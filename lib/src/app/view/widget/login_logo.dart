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
    // Attempt to load logoNamedUrl first as it usually contains both logo and name image
    if (logoNamedUrl != null && logoNamedUrl!.isNotEmpty) {
      return _buildImage(logoNamedUrl!);
    }

    // Fallback to logoUrl if available
    if (logoUrl != null && logoUrl!.isNotEmpty) {
      return _buildImage(logoUrl!);
    }

    // Default fallback to an app icon if no image is provided or if loading fails
    return _buildFallbackIcon();
  }

  Widget _buildImage(String path) {
    final isNetwork = path.startsWith('http');

    Widget image;
    if (isNetwork) {
      image = Image.network(
        path,
        height: height,
        errorBuilder: (context, error, stackTrace) => _buildFallbackIcon(),
      );
    } else {
      image = Image.asset(
        path,
        height: height,
        errorBuilder: (context, error, stackTrace) => _buildFallbackIcon(),
      );
    }

    return image;
  }

  Widget _buildFallbackIcon() {
    final String initial = flavorConfig.companyName.isNotEmpty
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
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
