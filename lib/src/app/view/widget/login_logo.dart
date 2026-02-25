import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    this.logoUrl,
    this.logoNamedUrl,
    this.height = 40,
    super.key,
  });

  final String? logoUrl;
  final String? logoNamedUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    final hasLogo = logoUrl != null && logoUrl!.isNotEmpty;
    final hasLogoNamed = logoNamedUrl != null && logoNamedUrl!.isNotEmpty;

    if (!hasLogo && !hasLogoNamed) {
      debugPrint('LoginLogo: Both logoUrl and logoNamedUrl are null/empty.');
      return _buildFallbackIcon();
    }

    Widget content;

    if (hasLogo && hasLogoNamed) {
      debugPrint(
        'LoginLogo: Showing both logoUrl and logoNamedUrl side-by-side',
      );
      content = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height,
            child: _buildImage(
              logoUrl!,
              const SizedBox.shrink(),
              source: 'logoUrl',
            ),
          ),
          const SizedBox(width: 32),
          SizedBox(
            height: height * 0.7,
            child: _buildImage(
              logoNamedUrl!,
              const SizedBox.shrink(),
              source: 'logoNamedUrl',
            ),
          ),
        ],
      );
    } else if (hasLogo) {
      debugPrint('LoginLogo: Showing logoUrl only');
      content = SizedBox(
        height: height,
        child: _buildImage(logoUrl!, _buildFallbackIcon(), source: 'logoUrl'),
      );
    } else {
      debugPrint('LoginLogo: Showing logoNamedUrl only');
      content = SizedBox(
        height: height,
        child: _buildImage(
          logoNamedUrl!,
          _buildFallbackIcon(),
          source: 'logoNamedUrl',
        ),
      );
    }

    return FittedBox(
      fit: BoxFit.contain,
      alignment: Alignment.center,
      child: content,
    );
  }

  Widget _buildImage(String path, Widget fallback, {required String source}) {
    final isNetwork = path.startsWith('http');

    if (isNetwork) {
      debugPrint('LoginLogo: Loading network image from $source: $path');
      return Image.network(
        path,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('LoginLogo: Failed to load network image from $source.');
          return fallback;
        },
      );
    } else {
      debugPrint('LoginLogo: Loading asset image from $source: $path');
      return Image.asset(
        path,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('LoginLogo: Failed to load asset image from $source.');
          return fallback;
        },
      );
    }
  }

  Widget _buildFallbackIcon() {
    debugPrint('LoginLogo: Using fallback icon/company name.');
    final initial = flavorConfig.companyName.isNotEmpty
        ? flavorConfig.companyName[0].toUpperCase()
        : 'C';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                flavorConfig.color.withValues(alpha: 0.7),
                flavorConfig.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(height * 0.25),
            boxShadow: [
              BoxShadow(
                color: flavorConfig.color.withValues(alpha: 0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            initial,
            style: TextStyle(
              fontSize: height * 0.6,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          flavorConfig.companyName,
          style: TextStyle(
            fontSize: height * 0.4,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
