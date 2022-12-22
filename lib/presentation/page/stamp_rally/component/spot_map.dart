import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../application/geolocator/state/current_poly_points.dart';
import '../../../../application/geolocator/state/user_geolocator_position.dart';
import '../../../../application/stamp_rally/state/pin_icon.dart';
import '../../../../domain/entity/value_object/geo_location.dart';
import '../../../../domain/repository/stamp_rally/entity/spot.dart';
import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import '../../../../util/assets/assets.gen.dart';
import '../../../component/async_value_handler.dart';
import '../../../router.dart';

/// マップ表示の現在選択中のスポットのインデックス
final _currentMapSpotIndexProvider = StateProvider(
  (_) => 0,
);

/// スポットのマップ
class SpotMapView extends ConsumerStatefulWidget {
  const SpotMapView({
    super.key,
    required this.stampRally,
  });

  final StampRally stampRally;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<SpotMapView> {
  final Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context) {
    if (widget.stampRally.spots.isEmpty) {
      return const SizedBox();
    }

    // ピンアイコン画像
    final icon = ref.watch(pinIconProvider);

    // 選択中スポットの位置情報
    final spotIndex = ref.watch(_currentMapSpotIndexProvider);
    final location = widget.stampRally.spots[spotIndex].location.toLatLng();

    // 経路
    final polylinePoints =
        ref.watch(currentPolylinePointsProvider(widget.stampRally)).value ?? [];

    // 選択中スポットインデックスを監視してマップ上のカメラを移動する
    ref.listen(_currentMapSpotIndexProvider, (_, next) async {
      final spot = widget.stampRally.spots[next];
      final controller = await mapController.future;
      await controller.showMarkerInfoWindow(MarkerId(spot.id));
      await controller.animateCamera(
        CameraUpdate.newLatLngZoom(
          spot.location.toLatLng(),
          17,
        ),
      );
    });

    return GoogleMap(
      polylines: {
        Polyline(
          polylineId: const PolylineId('route'),
          points: polylinePoints,
          width: 4,
          color: Theme.of(context).colorScheme.primaryContainer,
        )
      },
      // hack ぬるぽで落ちる件のワークアラウンド
      // https://github.com/flutter/flutter/issues/51064#issuecomment-588519913
      minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: (controller) async {
        mapController.complete(controller);
        final value = await rootBundle.loadString(Assets.json.mapStyle);
        final futureController = await mapController.future;
        await futureController.setMapStyle(value); // Controllerを使ってMapをSetする
      },
      myLocationButtonEnabled: false,
      // マップに表示するマーカーを生成する
      markers: widget.stampRally.spots
          .map(
            (spot) => Marker(
              infoWindow: InfoWindow(title: spot.title),
              markerId: MarkerId(spot.id),
              icon: icon,
              position: LatLng(
                spot.location.latitude,
                spot.location.longitude,
              ),
            ),
          )
          .toSet(),
      initialCameraPosition: CameraPosition(
        target: location,
        zoom: 14,
      ),
    );
  }
}

extension _GeoLocationEx on GeoLocation {
  /// GeoLocation => LatLng
  LatLng toLatLng() => LatLng(
        latitude,
        longitude,
      );
}

/// マップで使うスポットのカードを含むSwiper
class SpotMapSwiper extends ConsumerWidget {
  const SpotMapSwiper({
    super.key,
    required this.spots,
  });

  final List<Spot> spots;

  static const height = 240.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      child: Swiper(
        index: ref.watch(_currentMapSpotIndexProvider),
        itemBuilder: (context, index) {
          final spot = spots[index];
          return SpotMapCard(
            spot: spot,
          );
        },
        loop: false,
        itemCount: spots.length,
        viewportFraction: 0.8,
        onIndexChanged: (index) {
          ref.read(_currentMapSpotIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}

/// マップで使うスポットのカード
class SpotMapCard extends ConsumerWidget {
  const SpotMapCard({
    super.key,
    required this.spot,
  });

  final Spot spot;

  static const borderRadius = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 4,
      child: InkWell(
        onTap: () => spot.isEntry
            ? EntrySpotViewRoute.fromSpot(spot).go(context)
            : PublicSpotViewRoute.fromSpot(spot).go(context),
        borderRadius: borderRadius,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      spot.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 6, bottom: 2),
                  child: Text(
                    spot.title,
                    style: TextStyle(
                      fontSize: 28,
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const Gap(8),
                _SpotAddressListTile(spot: spot),
                _SpotDistanceListTile(spot: spot),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// スポットの住所
class _SpotAddressListTile extends StatelessWidget {
  const _SpotAddressListTile({
    required this.spot,
  });

  final Spot spot;

  @override
  Widget build(BuildContext context) {
    return _ListTile(
      icon: CupertinoIcons.tag_fill,
      text: spot.address ?? '',
    );
  }
}

/// 現在地からの距離
class _SpotDistanceListTile extends ConsumerWidget {
  const _SpotDistanceListTile({
    required this.spot,
  });

  final Spot spot;

  static const icon = CupertinoIcons.placemark_fill;
  static const label = '現在地からの距離：';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(userLocationProvider),
      builder: (userLocation) {
        final distance = userLocation.distance(spot.location);
        return _ListTile(
          icon: icon,
          text: '$label$distance km',
        );
      },
      loading: () => const _ListTile(
        icon: icon,
        text: '$label測定中...',
      ),
      error: (_, __) => const _ListTile(
        icon: icon,
        text: '$labelエラー',
      ),
      orNull: () => const _ListTile(
        icon: icon,
        text: '$label-',
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          const Gap(8),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
