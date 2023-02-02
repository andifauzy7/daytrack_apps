/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsAnimationGen {
  const $AssetsAnimationGen();

  /// File path: assets/animation/loaded_error.json
  String get loadedError => 'assets/animation/loaded_error.json';

  /// List of all assets
  List<String> get values => [loadedError];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.webp
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.webp');

  /// File path: assets/images/greeting.webp
  AssetGenImage get greeting =>
      const AssetGenImage('assets/images/greeting.webp');

  /// File path: assets/images/health_not_fit.webp
  AssetGenImage get healthNotFit =>
      const AssetGenImage('assets/images/health_not_fit.webp');

  /// File path: assets/images/healthy.webp
  AssetGenImage get healthy =>
      const AssetGenImage('assets/images/healthy.webp');

  /// File path: assets/images/onboarding_first.webp
  AssetGenImage get onboardingFirst =>
      const AssetGenImage('assets/images/onboarding_first.webp');

  /// File path: assets/images/onboarding_second.webp
  AssetGenImage get onboardingSecond =>
      const AssetGenImage('assets/images/onboarding_second.webp');

  /// File path: assets/images/onboarding_third.webp
  AssetGenImage get onboardingThird =>
      const AssetGenImage('assets/images/onboarding_third.webp');

  /// File path: assets/images/sick.webp
  AssetGenImage get sick => const AssetGenImage('assets/images/sick.webp');

  /// File path: assets/images/sign_in_illustration.webp
  AssetGenImage get signInIllustration =>
      const AssetGenImage('assets/images/sign_in_illustration.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
        avatar,
        greeting,
        healthNotFit,
        healthy,
        onboardingFirst,
        onboardingSecond,
        onboardingThird,
        sick,
        signInIllustration
      ];
}

class Assets {
  Assets._();

  static const $AssetsAnimationGen animation = $AssetsAnimationGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
