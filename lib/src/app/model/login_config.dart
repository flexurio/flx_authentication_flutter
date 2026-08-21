import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginConfig {
  const LoginConfig({
    this.layout = 'split_right_form',
    this.background,
    this.leftPanel,
    this.rightPanel,
  });

  factory LoginConfig.fromJson(Map<String, dynamic> json) {
    return LoginConfig(
      layout: json['layout'] as String? ?? 'split_right_form',
      background: json['background'] != null
          ? LoginBackgroundConfig.fromJson(
              json['background'] as Map<String, dynamic>,
            )
          : null,
      leftPanel: json['leftPanel'] != null
          ? LoginLeftPanelConfig.fromJson(
              json['leftPanel'] as Map<String, dynamic>,
            )
          : null,
      rightPanel: json['rightPanel'] != null
          ? LoginRightPanelConfig.fromJson(
              json['rightPanel'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  static Future<LoginConfig?> loadFromAsset(String? assetPath) async {
    if (assetPath == null || assetPath.isEmpty) return null;
    try {
      final jsonStr = await rootBundle.loadString(assetPath);
      final jsonMap = json.decode(jsonStr) as Map<String, dynamic>;
      return LoginConfig.fromJson(jsonMap);
    } catch (e) {
      debugPrint('LoginConfig.loadFromAsset error: $e');
      return null;
    }
  }

  final String layout;
  final LoginBackgroundConfig? background;
  final LoginLeftPanelConfig? leftPanel;
  final LoginRightPanelConfig? rightPanel;
}

class LoginBackgroundConfig {
  const LoginBackgroundConfig({
    this.type = 'gradient',
    this.colors,
    this.image,
    this.pattern,
  });

  factory LoginBackgroundConfig.fromJson(Map<String, dynamic> json) {
    List<Color>? parsedColors;
    if (json['colors'] is List) {
      parsedColors = (json['colors'] as List)
          .map((c) => _hexToColor(c.toString()))
          .whereType<Color>()
          .toList();
    } else {
      final gradient = json['gradient'];
      if (gradient is Map && gradient['colors'] is List) {
        parsedColors = (gradient['colors'] as List)
            .map((c) => _hexToColor(c.toString()))
            .whereType<Color>()
            .toList();
      }
    }

    return LoginBackgroundConfig(
      type: json['type'] as String? ?? 'gradient',
      colors: parsedColors,
      image: json['image'] as String?,
      pattern: json['pattern'] as String?,
    );
  }

  final String type; // 'gradient', 'image', 'color'
  final List<Color>? colors;
  final String? image;
  final String? pattern; // 'dots', 'none'
}

class LoginLeftPanelConfig {
  const LoginLeftPanelConfig({
    this.tag,
    this.title,
    this.description,
    this.features = const [],
    this.copyright,
  });

  factory LoginLeftPanelConfig.fromJson(Map<String, dynamic> json) {
    return LoginLeftPanelConfig(
      tag: json['tag'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      features: (json['features'] as List<dynamic>?)
              ?.map(
                (e) => LoginFeatureItemConfig.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
      copyright: json['copyright'] as String?,
    );
  }

  final String? tag;
  final String? title;
  final String? description;
  final List<LoginFeatureItemConfig> features;
  final String? copyright;
}

class LoginFeatureItemConfig {
  const LoginFeatureItemConfig({
    this.icon,
    this.title,
    this.description,
  });

  factory LoginFeatureItemConfig.fromJson(Map<String, dynamic> json) {
    return LoginFeatureItemConfig(
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );
  }

  final String? icon;
  final String? title;
  final String? description;
}

class LoginRightPanelConfig {
  const LoginRightPanelConfig({
    this.logoUrl,
    this.logoNamedUrl,
    this.logoHeight,
    this.title,
    this.subtitle,
    this.cardBackgroundColor,
    this.cardBackgroundGradient,
    this.cardBorderRadius,
    this.panelBackgroundColor,
    this.panelBackgroundGradient,
  });

  factory LoginRightPanelConfig.fromJson(Map<String, dynamic> json) {
    List<Color>? cardGradientColors;
    if (json['cardBackgroundGradient'] is List) {
      cardGradientColors = (json['cardBackgroundGradient'] as List)
          .map((c) => _hexToColor(c.toString()))
          .whereType<Color>()
          .toList();
    }

    List<Color>? panelGradientColors;
    if (json['panelBackgroundGradient'] is List) {
      panelGradientColors = (json['panelBackgroundGradient'] as List)
          .map((c) => _hexToColor(c.toString()))
          .whereType<Color>()
          .toList();
    }

    return LoginRightPanelConfig(
      logoUrl: json['logoUrl'] as String?,
      logoNamedUrl: json['logoNamedUrl'] as String?,
      logoHeight: (json['logoHeight'] as num?)?.toDouble(),
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      cardBackgroundColor: json['cardBackgroundColor'] != null
          ? _hexToColor(json['cardBackgroundColor'].toString())
          : null,
      cardBackgroundGradient: cardGradientColors,
      cardBorderRadius: (json['cardBorderRadius'] as num?)?.toDouble(),
      panelBackgroundColor: json['panelBackgroundColor'] != null
          ? _hexToColor(json['panelBackgroundColor'].toString())
          : null,
      panelBackgroundGradient: panelGradientColors,
    );
  }

  final String? logoUrl;
  final String? logoNamedUrl;
  final double? logoHeight;
  final String? title;
  final String? subtitle;
  final Color? cardBackgroundColor;
  final List<Color>? cardBackgroundGradient;
  final double? cardBorderRadius;
  final Color? panelBackgroundColor;
  final List<Color>? panelBackgroundGradient;
}

Color? _hexToColor(String hexString) {
  try {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  } catch (_) {
    return null;
  }
}
