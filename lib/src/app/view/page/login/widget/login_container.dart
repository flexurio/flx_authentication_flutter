import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:gap/gap.dart';
import 'package:screen_identifier/screen_identifier.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    required this.builder,
    required this.logoUrl,
    required this.logoNamedUrl,
    this.config,
    super.key,
  });

  final Widget Function(EdgeInsets contentPadding) builder;
  final String? logoUrl;
  final String? logoNamedUrl;
  final LoginConfig? config;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ScreenIdentifierBuilder(
        builder: (context, screenIdentifier) {
          final isSmall = screenIdentifier.conditions(sm: true, md: false);

          if (config == null) {
            return _buildClassicLayout(context, screenIdentifier, isSmall);
          }

          final effectiveLogoUrl = config?.rightPanel?.logoUrl ?? logoUrl;
          final effectiveLogoNamedUrl =
              config?.rightPanel?.logoNamedUrl ?? logoNamedUrl;

          return LoginBackground(
            asset: AssetBackground.displayLogin,
            config: config?.background,
            child: isSmall
                ? _buildMobileLayout(
                    context,
                    effectiveLogoUrl,
                    effectiveLogoNamedUrl,
                  )
                : _buildDesktopLayout(
                    context,
                    screenIdentifier,
                    effectiveLogoUrl,
                    effectiveLogoNamedUrl,
                  ),
          );
        },
      ),
    );
  }

  Widget _buildClassicLayout(
    BuildContext context,
    ScreenIdentifier screenIdentifier,
    bool isSmall,
  ) {
    final contentPadding = screenIdentifier.conditions(
      sm: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      md: const EdgeInsets.only(right: 150, left: 150),
      lg: const EdgeInsets.only(right: 450, left: 150),
    );

    return LoginBackground(
      asset: AssetBackground.displayLogin,
      child: Center(
        child: SingleChildScrollView(
          padding: isSmall ? const EdgeInsets.all(24) : null,
          child: ContainerGlass(
            width: isSmall ? double.infinity : 900,
            height: isSmall ? 560 : 600,
            child: Stack(
              children: [
                if (isSmall)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: LoginLogo(
                        logoUrl: logoUrl,
                        logoNamedUrl: logoNamedUrl,
                        height: 60,
                      ),
                    ),
                  ),
                Padding(
                  padding: isSmall
                      ? const EdgeInsets.only(top: 90)
                      : EdgeInsets.zero,
                  child: builder(contentPadding),
                ),
                if (!isSmall)
                  Positioned(
                    left: 600,
                    bottom: 0,
                    top: 0,
                    right: 0,
                    child: _buildClassicLogo(screenIdentifier),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedSwitcher _buildClassicLogo(ScreenIdentifier screenIdentifier) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: screenIdentifier.conditions(md: false, lg: true)
          ? ContainerGlass(
              width: 300,
              elevation: 0,
              opacity: .6,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: LoginLogo(
                    logoUrl: logoUrl,
                    logoNamedUrl: logoNamedUrl,
                    height: 120,
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    String? logoUrl,
    String? logoNamedUrl,
  ) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 450),
          decoration: BoxDecoration(
            gradient: config?.rightPanel?.cardBackgroundGradient != null
                ? LinearGradient(
                    colors: config!.rightPanel!.cardBackgroundGradient!,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )
                : config?.rightPanel?.cardBackgroundColor != null
                    ? null
                    : const LinearGradient(
                        colors: [
                          Color(0xFFE2E8F0),
                          Color(0xFFF1F5F9),
                          Color(0xFFFFFFFF),
                          Color(0xFFFFFFFF),
                        ],
                        stops: [0.0, 0.25, 0.65, 1.0],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
            color: config?.rightPanel?.cardBackgroundColor,
            borderRadius: BorderRadius.circular(
              config?.rightPanel?.cardBorderRadius ?? 24,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginLogo(
                logoUrl: logoUrl,
                logoNamedUrl: logoNamedUrl,
                height: config?.rightPanel?.logoHeight ?? 50,
              ),
              const Gap(24),
              builder(EdgeInsets.zero),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    ScreenIdentifier screenIdentifier,
    String? logoUrl,
    String? logoNamedUrl,
  ) {
    final leftConfig = config?.leftPanel;
    final copyright = leftConfig?.copyright ??
        '© ${DateTime.now().year} ${flavorConfig.companyName}. All rights reserved.';

    final Decoration rightPanelDecoration = BoxDecoration(
      gradient: config?.rightPanel?.panelBackgroundGradient != null
          ? LinearGradient(
              colors: config!.rightPanel!.panelBackgroundGradient!,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )
          : config?.rightPanel?.panelBackgroundColor != null
              ? null
              : const LinearGradient(
                  colors: [
                    Color(0xFFD9E2EC), // Soft pale slate
                    Color(0xFFEDF2F7), // Very subtle grey
                    Color(0xFFF8FAFC), // Off-white clean slate
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
      color: config?.rightPanel?.panelBackgroundColor,
    );

    return Stack(
      children: [
        // Full-screen Row: left panel is transparent (outer blue bg shows through),
        // right panel owns the gray gradient — card inside Center = perfectly symmetric
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left panel — wrapper depends on mode
            Expanded(
              flex: config?.leftFlex ?? 8,
              child: Builder(
                builder: (context) {
                  final mode = config?.leftPanel?.mode ?? 'text';
                  final isImageMode =
                      mode == 'image' || mode == 'image_with_text';

                  if (isImageMode) {
                    // Image fills the full left column (no padding, no constraints)
                    return ClipRect(child: _buildLeftInfoPanel(context));
                  }

                  // Text mode: centered & padded
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(48, 40, 40, 80),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: _buildLeftInfoPanel(context),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Right: gray background panel — card centered = equal left/right margins
            Expanded(
              flex: config?.rightFlex ?? 3,
              child: Container(
                decoration: rightPanelDecoration,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    // at minimum, fill the full viewport height so Center works
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.sizeOf(context).height,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 40,
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: config?.rightPanel?.cardMaxWidth ?? 380,
                          ),
                          decoration: BoxDecoration(
                            gradient:
                                config?.rightPanel?.cardBackgroundGradient !=
                                        null
                                    ? LinearGradient(
                                        colors: config!.rightPanel!
                                            .cardBackgroundGradient!,
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      )
                                    : null,
                            color: config?.rightPanel?.cardBackgroundColor ??
                                Colors.white,
                            borderRadius: BorderRadius.circular(
                              config?.rightPanel?.cardBorderRadius ?? 24,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 32,
                                offset: const Offset(0, 12),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 40,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LoginLogo(
                                logoUrl: logoUrl,
                                logoNamedUrl: logoNamedUrl,
                                height: config?.rightPanel?.logoHeight ?? 50,
                              ),
                              const Gap(32),
                              builder(EdgeInsets.zero),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // Copyright — bottom-left overlay
        Positioned(
          left: 48,
          bottom: 24,
          child: Text(
            copyright,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeftInfoPanel(BuildContext context) {
    final leftConfig = config?.leftPanel;
    final mode = leftConfig?.mode ?? 'text';

    switch (mode) {
      case 'image':
        return _buildLeftImagePanel(context, withText: false);
      case 'image_with_text':
        return _buildLeftImagePanel(context, withText: true);
      case 'text':
      default:
        return _buildLeftTextPanel(context);
    }
  }

  /// Renders the image-based left panel.
  /// [withText] = true overlays tag + title + copyright on top of the image.
  Widget _buildLeftImagePanel(BuildContext context, {required bool withText}) {
    final leftConfig = config?.leftPanel;
    final imageUrl = leftConfig?.imageUrl ?? '';
    final fit = _resolveBoxFit(leftConfig?.imageFit ?? 'contain');
    final alignment = _resolveAlignment(leftConfig?.imageAlignment ?? 'center');

    final isNetwork =
        imageUrl.startsWith('http://') || imageUrl.startsWith('https://');

    Widget imageWidget;
    if (imageUrl.isEmpty) {
      // Fallback: show placeholder icon
      imageWidget = Center(
        child: Icon(
          Icons.image_outlined,
          size: 80,
          color: Colors.white.withValues(alpha: 0.4),
        ),
      );
    } else if (isNetwork) {
      imageWidget = Image.network(
        imageUrl,
        fit: fit,
        alignment: alignment,
        errorBuilder: (_, __, ___) => Center(
          child: Icon(
            Icons.broken_image_outlined,
            size: 80,
            color: Colors.white.withValues(alpha: 0.4),
          ),
        ),
      );
    } else {
      imageWidget = Image.asset(
        imageUrl,
        fit: fit,
        alignment: alignment,
        errorBuilder: (_, __, ___) => Center(
          child: Icon(
            Icons.broken_image_outlined,
            size: 80,
            color: Colors.white.withValues(alpha: 0.4),
          ),
        ),
      );
    }

    if (!withText) return imageWidget;

    // image_with_text: stack image + gradient overlay + text at bottom
    final tag = leftConfig?.tag ?? '';
    final title = leftConfig?.title ?? flavorConfig.companyName;

    return Stack(
      fit: StackFit.expand,
      children: [
        imageWidget,
        // Dark gradient overlay for readability
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.55),
              ],
              stops: const [0.5, 1.0],
            ),
          ),
        ),
        // Text anchored at bottom
        Positioned(
          left: 0,
          right: 0,
          bottom: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (tag.isNotEmpty) ...[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    tag.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                const Gap(10),
              ],
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                  shadows: [
                    Shadow(
                      color: Colors.black45,
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Renders the text-based left panel (default mode).
  Widget _buildLeftTextPanel(BuildContext context) {
    final leftConfig = config?.leftPanel;
    final tag = leftConfig?.tag ?? 'COMPLIANCE MANAGEMENT';
    final title = leftConfig?.title ?? flavorConfig.companyName;
    final description = leftConfig?.description ??
        'Manage compliance, verification, and audit processes seamlessly for operations.';
    final features = leftConfig?.features ??
        const [
          LoginFeatureItemConfig(
            icon: 'shield',
            title: 'Compliance Verification',
            description:
                'Comprehensive tracking and compliance validation for transactions and operations',
          ),
          LoginFeatureItemConfig(
            icon: 'task',
            title: 'Audit & Workflow Approval',
            description:
                'Streamlined review and structured approval cycles across business units',
          ),
          LoginFeatureItemConfig(
            icon: 'analytics',
            title: 'Integrated Monitoring',
            description:
                'Real-time visibility, reporting, and operational compliance tracking',
          ),
        ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tag Pill
        if (tag.isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.25),
              ),
            ),
            child: Text(
              tag.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const Gap(24),
        ],
        // Title
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        const Gap(14),
        // Description
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(
            description,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ),
        const Gap(36),
        // Features
        ...features.map(_buildFeatureItem),
      ],
    );
  }

  BoxFit _resolveBoxFit(String value) {
    switch (value.toLowerCase()) {
      case 'cover':
        return BoxFit.cover;
      case 'fill':
        return BoxFit.fill;
      case 'fitwidth':
        return BoxFit.fitWidth;
      case 'fitheight':
        return BoxFit.fitHeight;
      case 'scaledown':
        return BoxFit.scaleDown;
      case 'none':
        return BoxFit.none;
      case 'contain':
      default:
        return BoxFit.contain;
    }
  }

  Alignment _resolveAlignment(String value) {
    switch (value.toLowerCase()) {
      case 'topcenter':
        return Alignment.topCenter;
      case 'topleft':
        return Alignment.topLeft;
      case 'topright':
        return Alignment.topRight;
      case 'bottomcenter':
        return Alignment.bottomCenter;
      case 'bottomleft':
        return Alignment.bottomLeft;
      case 'bottomright':
        return Alignment.bottomRight;
      case 'centerleft':
        return Alignment.centerLeft;
      case 'centerright':
        return Alignment.centerRight;
      case 'center':
      default:
        return Alignment.center;
    }
  }

  Widget _buildFeatureItem(LoginFeatureItemConfig item) {
    var iconData = Icons.verified_user_outlined;
    final iconName = (item.icon ?? '').toLowerCase();
    if (iconName.contains('task') ||
        iconName.contains('audit') ||
        iconName.contains('assignment')) {
      iconData = Icons.assignment_turned_in_outlined;
    } else if (iconName.contains('chart') ||
        iconName.contains('analytics') ||
        iconName.contains('monitoring') ||
        iconName.contains('insights')) {
      iconData = Icons.insights_outlined;
    } else if (iconName.contains('shield') ||
        iconName.contains('compliance') ||
        iconName.contains('lock')) {
      iconData = Icons.verified_user_outlined;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(iconData, color: Colors.white, size: 22),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(4),
                Text(
                  item.description ?? '',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.75),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
