import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/entity/app_info.dart';
import '../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import 'user_geolocator_position.dart';

/// 座標リストとユーザーの現在位置から算出した経路（座標リスト）
final currentPolylinePointsProvider =
    FutureProvider.family<List<LatLng>, StampRally>(
  (ref, stampRally) async {
    final locations = stampRally.spots.map((spot) => spot.location).toList();
    if (locations.isEmpty) {
      return [];
    }

    final polylineCoordinates = <LatLng>[];

    // ユーザーの現在位置を取得する
    final userLocation = await ref.watch(userLocationProvider.future);

    final polylinePoints = PolylinePoints();

    for (var i = 0; i < locations.length - 1; i++) {
      late PointLatLng pointFrom;
      late PointLatLng pointTo;
      if (i == 0 && userLocation != null) {
        // 自分の位置〜1番最初のスポットまでの経路を求める
        pointFrom = PointLatLng(
          userLocation.latitude,
          userLocation.longitude,
        );
        pointTo = PointLatLng(
          locations[i].latitude,
          locations[i].longitude,
        );
      } else {
        // i番目〜その次のスポットまでの経路を求める
        pointFrom = PointLatLng(
          locations[i].latitude,
          locations[i].longitude,
        );
        pointTo = PointLatLng(
          locations[i + 1].latitude,
          locations[i + 1].longitude,
        );
      }

      // Directions APIを用いて２点間の最適な経路を求める
      final result = await polylinePoints.getRouteBetweenCoordinates(
        ref.read(appInfoProvider).googleMapAPIKey,
        pointFrom,
        pointTo,
        travelMode: TravelMode.walking,
        avoidHighways: true,
        avoidTolls: true,
      );

      if (result.points.isNotEmpty) {
        for (final point in result.points) {
          polylineCoordinates.add(
            LatLng(point.latitude, point.longitude),
          );
        }
      }
    }
    return polylineCoordinates;
  },
  name: 'currentPolylinePointsProvider',
);
