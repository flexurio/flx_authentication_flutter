import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    required this.child,
    this.asset,
    super.key,
  });

  final Widget child;
  final String? asset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        child,
      ],
    );
  }

  Widget _buildBackground() {
    if (asset == null || asset!.isEmpty) {
      debugPrint(
        'LoginBackground: No asset provided, using Unsplash fallback.',
      );
      return _buildFallback();
    }

    debugPrint('LoginBackground: Loading from asset: $asset');
    return Image.asset(
      asset!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        debugPrint(
          'LoginBackground: Failed to load asset "$asset". '
          'Falling back to Unsplash.',
        );
        return _buildFallback();
      },
    );
  }

  Widget _buildFallback() {
    debugPrint('LoginBackground: Fetching image from Unsplash...');
    return SizedBox.expand(
      child: Stack(
        children: [
          // Base layer: Always dark blue
          const ColoredBox(color: Color(0xFF0F172A)),

          // Image layer: Try to load Unsplash
          Image.network(
            'https://images.unsplash.com/photo-1497215728101-856f4ea42174?auto=format&fit=crop&q=80&w=1920',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox.expand(
                child: ColoredBox(color: Color(0xFF0F172A)),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              debugPrint('LoginBackground: Failed to fetch Unsplash image.');
              return const SizedBox.expand(
                child: ColoredBox(color: Color(0xFF0F172A)),
              );
            },
          ),
        ],
      ),
    );
  }
}
