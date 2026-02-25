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
    Widget fallback = _buildFallbackIcon();

    // Secondary fallback is logoUrl
    if (logoUrl != null && logoUrl!.isNotEmpty) {
      debugPrint('LoginLogo: logoUrl provided: $logoUrl');
      fallback = _buildImage(logoUrl!, fallback, source: 'logoUrl');
    }

    // Primary attempt is logoNamedUrl
    if (logoNamedUrl != null && logoNamedUrl!.isNotEmpty) {
      debugPrint('LoginLogo: logoNamedUrl provided: $logoNamedUrl');
      return _buildImage(logoNamedUrl!, fallback, source: 'logoNamedUrl');
    }

    // If both are null, return the final fallback
    debugPrint('LoginLogo: Both logoUrl and logoNamedUrl are null/empty.');
    return fallback;
  }

  Widget _buildImage(String path, Widget fallback, {required String source}) {
    final isNetwork = path.startsWith('http');

    if (isNetwork) {
      debugPrint('LoginLogo: Loading network image from $source: $path');
      return Image.network(
        path,
        height: height,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('LoginLogo: Failed to load network image from $source.');
          return fallback;
        },
      );
    } else {
      debugPrint('LoginLogo: Loading asset image from $source: $path');
      return Image.asset(
        path,
        height: height,
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
            fontSize: height * 0.6,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
