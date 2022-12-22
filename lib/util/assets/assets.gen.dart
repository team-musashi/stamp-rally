/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/done.svg
  SvgGenImage get done => const SvgGenImage('assets/images/done.svg');

  /// File path: assets/images/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon.png');

  /// File path: assets/images/icon_adaptive_foreground.png
  AssetGenImage get iconAdaptiveForeground =>
      const AssetGenImage('assets/images/icon_adaptive_foreground.png');

  /// File path: assets/images/icon_dev.png
  AssetGenImage get iconDev =>
      const AssetGenImage('assets/images/icon_dev.png');

  /// File path: assets/images/icon_prod.png
  AssetGenImage get iconProd =>
      const AssetGenImage('assets/images/icon_prod.png');

  /// File path: assets/images/join_burally.svg
  SvgGenImage get joinBurally =>
      const SvgGenImage('assets/images/join_burally.svg');

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

  /// File path: assets/images/snap_shot.svg
  SvgGenImage get snapShot => const SvgGenImage('assets/images/snap_shot.svg');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/splash_android12.png
  AssetGenImage get splashAndroid12 =>
      const AssetGenImage('assets/images/splash_android12.png');

  /// File path: assets/images/splash_background.png
  AssetGenImage get splashBackground =>
      const AssetGenImage('assets/images/splash_background.png');

  /// File path: assets/images/stop_burally.svg
  SvgGenImage get stopBurally =>
      const SvgGenImage('assets/images/stop_burally.svg');

  /// List of all assets
  List<dynamic> get values => [
        done,
        icon,
        iconAdaptiveForeground,
        iconDev,
        iconProd,
        joinBurally,
        logoBurarry,
        logoHeaderBurarry,
        markerAndroid,
        markerIos,
        snapShot,
        splash,
        splashAndroid12,
        splashBackground,
        stopBurally
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
