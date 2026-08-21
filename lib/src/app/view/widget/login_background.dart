import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/src/app/model/login_config.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    required this.child,
    this.asset,
    this.config,
    super.key,
  });

  final Widget child;
  final String? asset;
  final LoginBackgroundConfig? config;

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
    if (config != null) {
      if (config!.type == 'color' &&
          config!.colors != null &&
          config!.colors!.isNotEmpty) {
        return Container(color: config!.colors!.first);
      }
      if (config!.type == 'gradient' &&
          config!.colors != null &&
          config!.colors!.isNotEmpty) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: config!.colors!,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: config!.pattern == 'dots' ? _buildDotsOverlay() : null,
        );
      }
      if (config!.image != null && config!.image!.isNotEmpty) {
        return Image.asset(
          config!.image!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) => _buildFallback(),
        );
      }
    }

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

  Widget _buildDotsOverlay() {
    return CustomPaint(
      size: Size.infinite,
      painter: _DotPatternPainter(),
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

class _DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..style = PaintingStyle.fill;

    const spacing = 28.0;
    const radius = 1.5;

    for (double x = 14; x < size.width; x += spacing) {
      for (double y = 14; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
