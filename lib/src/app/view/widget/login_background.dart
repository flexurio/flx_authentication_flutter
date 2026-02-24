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
      return _buildFallback();
    }

    return Image.asset(
      asset!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return _buildFallback();
      },
    );
  }

  Widget _buildFallback() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _GridPainter(),
            ),
          ),
          Positioned(
            top: -150,
            right: -150,
            child: _GlowDisk(color: Colors.blue.withValues(alpha: 0.1)),
          ),
          Positioned(
            bottom: -150,
            left: -150,
            child: _GlowDisk(color: Colors.indigo.withValues(alpha: 0.1)),
          ),
        ],
      ),
    );
  }
}

class _GlowDisk extends StatelessWidget {
  const _GlowDisk({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 100,
            spreadRadius: 50,
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..strokeWidth = 1.0;

    const step = 40.0;
    for (double i = 0; i < size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
