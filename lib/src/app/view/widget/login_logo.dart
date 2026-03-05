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

    // Target sizes to fit within the ~300px right panel (available ~268px)
    const logoSize = 48.0;
    const namedWidth = 180.0;
    const namedHeight = 48.0;
    const gap = 12.0;

    if (!hasLogo && !hasLogoNamed) {
      debugPrint('LoginLogo: Both logoUrl and logoNamedUrl are null/empty.');
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLogoFallback(logoSize),
          const SizedBox(width: gap),
          _buildNamedFallback(namedWidth, namedHeight),
        ],
      );
    }

    Widget content;

    if (hasLogo && hasLogoNamed) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ValidatedRatioImage(
            path: logoUrl!,
            expectedRatio: 1 / 1,
            label: 'Logo',
            width: logoSize,
            height: logoSize,
            fallback: _buildLogoFallback(logoSize),
          ),
          const SizedBox(width: gap),
          _ValidatedRatioImage(
            path: logoNamedUrl!,
            expectedRatio: 30 / 7,
            label: 'Logo Named',
            width: namedWidth,
            height: namedHeight,
            fallback: _buildNamedFallback(namedWidth, namedHeight),
          ),
        ],
      );
    } else if (hasLogo) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ValidatedRatioImage(
            path: logoUrl!,
            expectedRatio: 1 / 1,
            label: 'Logo',
            width: logoSize,
            height: logoSize,
            fallback: _buildLogoFallback(logoSize),
          ),
          const SizedBox(width: 8),
          _buildNamedFallback(namedWidth * 0.7, namedHeight * 0.7),
        ],
      );
    } else {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLogoFallback(logoSize * 0.7),
          const SizedBox(width: 8),
          _ValidatedRatioImage(
            path: logoNamedUrl!,
            expectedRatio: 30 / 7,
            label: 'Logo Named',
            width: namedWidth,
            height: namedHeight,
            fallback: _buildNamedFallback(namedWidth, namedHeight),
          ),
        ],
      );
    }

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: content,
    );
  }

  Widget _buildLogoFallback(double size) {
    final initial = flavorConfig.companyName.isNotEmpty
        ? flavorConfig.companyName[0].toUpperCase()
        : 'C';

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: flavorConfig.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(size * 0.2),
        border: Border.all(
          color: flavorConfig.color.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: TextStyle(
          fontSize: size * 0.5,
          fontWeight: FontWeight.bold,
          color: flavorConfig.color,
        ),
      ),
    );
  }

  Widget _buildNamedFallback(double width, double height) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: flavorConfig.color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(height * 0.2),
        border: Border.all(
          color: flavorConfig.color.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        flavorConfig.companyName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: height * 0.4,
          fontWeight: FontWeight.bold,
          color: flavorConfig.color.withValues(alpha: 0.8),
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class _ValidatedRatioImage extends StatefulWidget {
  const _ValidatedRatioImage({
    required this.path,
    required this.expectedRatio,
    required this.label,
    required this.fallback,
    required this.width,
    required this.height,
  });

  final String path;
  final double expectedRatio;
  final String label;
  final Widget fallback;
  final double width;
  final double height;

  @override
  State<_ValidatedRatioImage> createState() => _ValidatedRatioImageState();
}

class _ValidatedRatioImageState extends State<_ValidatedRatioImage> {
  bool? _isValid;
  String? _errorDetail;
  late ImageProvider _provider;

  @override
  void initState() {
    super.initState();
    _initProvider();
    _validate();
  }

  @override
  void didUpdateWidget(_ValidatedRatioImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.path != widget.path) {
      _initProvider();
      _validate();
    }
  }

  void _initProvider() {
    final isNetwork = widget.path.startsWith('http');
    if (isNetwork) {
      _provider = NetworkImage(widget.path);
    } else {
      _provider = AssetImage(widget.path);
    }
  }

  void _validate() {
    _provider.resolve(ImageConfiguration.empty).addListener(
          ImageStreamListener(
            (info, synchronousCall) {
              if (!mounted) return;
              final width = info.image.width;
              final height = info.image.height;
              final actualRatio = width / height;

              // Check ratio with 5% tolerance
              final diff = (actualRatio - widget.expectedRatio).abs();
              final isValid = diff < (widget.expectedRatio * 0.05);

              setState(() {
                _isValid = isValid;
                if (!isValid) {
                  _errorDetail = 'Ratio: ${actualRatio.toStringAsFixed(2)}\n'
                      'Target: ${widget.expectedRatio.toStringAsFixed(2)}';
                }
              });
            },
            onError: (exception, stackTrace) {
              if (!mounted) return;
              setState(() {
                _isValid = false;
                _errorDetail = 'Failed to load';
              });
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    if (_isValid == null) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    if (!_isValid!) {
      return Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.withValues(alpha: 0.5)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 20),
            const SizedBox(height: 4),
            Text(
              '${widget.label} Ratio Error',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _errorDetail ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 9,
              ),
            ),
          ],
        ),
      );
    }

    return Image(
      image: _provider,
      width: widget.width,
      height: widget.height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => widget.fallback,
    );
  }
}
