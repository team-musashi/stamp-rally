import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/stamp_rally/entity/stamp_rally.dart';
import 'spot_map.dart';

/// スタンプラリー詳細のマップ表示
class StampRallyMapView extends ConsumerStatefulWidget {
  const StampRallyMapView({
    super.key,
    required this.stampRally,
  });

  final StampRally stampRally;

  @override
  _StampRallyMapViewState createState() => _StampRallyMapViewState();
}

class _StampRallyMapViewState extends ConsumerState<StampRallyMapView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Stack(
        children: [
          SpotMapView(
            stampRally: widget.stampRally,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SpotMapSwiper(
                spots: widget.stampRally.spots,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
