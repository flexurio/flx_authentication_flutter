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
        children: [
          _ValidatedRatioImage(
            path: logoUrl!,
            expectedRatio: 1 / 1,
            label: 'Logo',
            height: height,
            fallback: const SizedBox.shrink(),
          ),
          const SizedBox(width: 32),
          _ValidatedRatioImage(
            path: logoNamedUrl!,
            expectedRatio: 30 / 7,
            label: 'Logo Named',
            height: height * 0.8,
            fallback: const SizedBox.shrink(),
          ),
        ],
      );
    } else if (hasLogo) {
      debugPrint('LoginLogo: Showing logoUrl only');
      content = _ValidatedRatioImage(
        path: logoUrl!,
        expectedRatio: 1 / 1,
        label: 'Logo',
        height: height,
        fallback: _buildFallbackIcon(),
      );
    } else {
      debugPrint('LoginLogo: Showing logoNamedUrl only');
      content = _ValidatedRatioImage(
        path: logoNamedUrl!,
        expectedRatio: 30 / 7,
        label: 'Logo Named',
        height: height,
        fallback: _buildFallbackIcon(),
      );
    }

    return FittedBox(
      child: content,
    );
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

class _ValidatedRatioImage extends StatefulWidget {
  const _ValidatedRatioImage({
    required this.path,
    required this.expectedRatio,
    required this.label,
    required this.fallback,
    this.height,
  });

  final String path;
  final double expectedRatio;
  final String label;
  final Widget fallback;
  final double? height;

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

              // Check ratio with 1% tolerance
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
        height: widget.height,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    if (!_isValid!) {
      return Container(
        height: widget.height,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red.withValues(alpha: 0.5)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 16),
            const SizedBox(height: 4),
            Text(
              '${widget.label} Ratio Error',
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
                fontSize: 8,
              ),
            ),
          ],
        ),
      );
    }

    return Image(
      image: _provider,
      height: widget.height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => widget.fallback,
    );
  }
}
