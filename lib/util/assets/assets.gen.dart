/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/icon_dev.png
  AssetGenImage get iconDev =>
      const AssetGenImage('assets/images/icon_dev.png');

  /// File path: assets/images/icon_prod.png
  AssetGenImage get iconProd =>
      const AssetGenImage('assets/images/icon_prod.png');

  /// File path: assets/images/logo_burarry.png
  AssetGenImage get logoBurarry =>
      const AssetGenImage('assets/images/logo_burarry.png');

  /// File path: assets/images/logo_header_burarry.png
  AssetGenImage get logoHeaderBurarry =>
      const AssetGenImage('assets/images/logo_header_burarry.png');

  /// File path: assets/images/marker_android.png
  AssetGenImage get markerAndroid =>
      const AssetGenImage('assets/images/marker_android.png');

  /// File path: assets/images/marker_ios.png
  AssetGenImage get markerIos =>
      const AssetGenImage('assets/images/marker_ios.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/splash_android12.png
  AssetGenImage get splashAndroid12 =>
      const AssetGenImage('assets/images/splash_android12.png');

  /// File path: assets/images/splash_background.png
  AssetGenImage get splashBackground =>
      const AssetGenImage('assets/images/splash_background.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        iconDev,
        iconProd,
        logoBurarry,
        logoHeaderBurarry,
        markerAndroid,
        markerIos,
        splash,
        splashAndroid12,
        splashBackground
      ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/map_style.json
  String get mapStyle => 'assets/json/map_style.json';

  /// List of all assets
  List<String> get values => [mapStyle];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
