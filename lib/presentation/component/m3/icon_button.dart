import 'package:flutter/material.dart';

/// M3 準拠の Filled IconButton
///
/// see: https://m3.material.io/components/icon-buttons/overview
/// see: https://api.flutter.dev/flutter/material/IconButton-class.html
class FilledIconButton extends StatelessWidget {
  const FilledIconButton({
    super.key,
    this.iconSize,
    this.visualDensity,
    this.padding = const EdgeInsets.all(8),
    this.alignment = Alignment.center,
    this.splashRadius,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    required this.onPressed,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.enableFeedback = true,
    this.constraints,
    this.style,
    this.isSelected,
    this.selectedIcon,
    required this.icon,
  }) : assert(splashRadius == null || splashRadius > 0);

  final double? iconSize;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final double? splashRadius;
  final Widget icon;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? color;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? disabledColor;
  final VoidCallback? onPressed;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? tooltip;
  final bool enableFeedback;
  final BoxConstraints? constraints;
  final ButtonStyle? style;
  final bool? isSelected;
  final Widget? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      iconSize: iconSize,
      visualDensity: visualDensity,
      padding: padding,
      alignment: alignment,
      splashRadius: splashRadius,
      color: color,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      disabledColor: disabledColor,
      onPressed: onPressed,
      mouseCursor: mouseCursor,
      focusNode: focusNode,
      autofocus: autofocus,
      tooltip: tooltip,
      enableFeedback: enableFeedback,
      constraints: constraints,
      style: IconButton.styleFrom(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
        hoverColor: colorScheme.onPrimary.withOpacity(0.08),
        focusColor: colorScheme.onPrimary.withOpacity(0.12),
        highlightColor: colorScheme.onPrimary.withOpacity(0.12),
      ),
      isSelected: isSelected,
      selectedIcon: selectedIcon,
      icon: icon,
    );
  }
}

/// M3 準拠の FilledTonal IconButton
///
/// see: https://m3.material.io/components/icon-buttons/overview
/// see: https://api.flutter.dev/flutter/material/IconButton-class.html
class FilledTonalIconButton extends StatelessWidget {
  const FilledTonalIconButton({
    super.key,
    this.iconSize,
    this.visualDensity,
    this.padding = const EdgeInsets.all(8),
    this.alignment = Alignment.center,
    this.splashRadius,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    required this.onPressed,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.enableFeedback = true,
    this.constraints,
    this.style,
    this.isSelected,
    this.selectedIcon,
    required this.icon,
  }) : assert(splashRadius == null || splashRadius > 0);

  final double? iconSize;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final double? splashRadius;
  final Widget icon;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? color;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? disabledColor;
  final VoidCallback? onPressed;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? tooltip;
  final bool enableFeedback;
  final BoxConstraints? constraints;
  final ButtonStyle? style;
  final bool? isSelected;
  final Widget? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      iconSize: iconSize,
      visualDensity: visualDensity,
      padding: padding,
      alignment: alignment,
      splashRadius: splashRadius,
      color: color,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      disabledColor: disabledColor,
      onPressed: onPressed,
      mouseCursor: mouseCursor,
      focusNode: focusNode,
      autofocus: autofocus,
      tooltip: tooltip,
      enableFeedback: enableFeedback,
      constraints: constraints,
      style: IconButton.styleFrom(
        foregroundColor: colorScheme.onSecondaryContainer,
        backgroundColor: colorScheme.secondaryContainer,
        disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
        hoverColor: colorScheme.onSecondaryContainer.withOpacity(0.08),
        focusColor: colorScheme.onSecondaryContainer.withOpacity(0.12),
        highlightColor: colorScheme.onSecondaryContainer.withOpacity(0.12),
      ),
      isSelected: isSelected,
      selectedIcon: selectedIcon,
      icon: icon,
    );
  }
}

/// M3 準拠の Outlined IconButton
///
/// see: https://m3.material.io/components/icon-buttons/overview
/// see: https://api.flutter.dev/flutter/material/IconButton-class.html
class OutlinedIconButton extends StatelessWidget {
  const OutlinedIconButton({
    super.key,
    this.iconSize,
    this.visualDensity,
    this.padding = const EdgeInsets.all(8),
    this.alignment = Alignment.center,
    this.splashRadius,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    required this.onPressed,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.enableFeedback = true,
    this.constraints,
    this.style,
    this.isSelected,
    this.selectedIcon,
    required this.icon,
  }) : assert(splashRadius == null || splashRadius > 0);

  final double? iconSize;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final double? splashRadius;
  final Widget icon;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? color;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? disabledColor;
  final VoidCallback? onPressed;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? tooltip;
  final bool enableFeedback;
  final BoxConstraints? constraints;
  final ButtonStyle? style;
  final bool? isSelected;
  final Widget? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      iconSize: iconSize,
      visualDensity: visualDensity,
      padding: padding,
      alignment: alignment,
      splashRadius: splashRadius,
      color: color,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      disabledColor: disabledColor,
      onPressed: onPressed,
      mouseCursor: mouseCursor,
      focusNode: focusNode,
      autofocus: autofocus,
      tooltip: tooltip,
      enableFeedback: enableFeedback,
      constraints: constraints,
      style: IconButton.styleFrom(
        focusColor: colorScheme.onSurfaceVariant.withOpacity(0.12),
        highlightColor: colorScheme.onSurface.withOpacity(0.12),
        side: onPressed == null
            ? BorderSide(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
              )
            : BorderSide(color: colorScheme.outline),
      ).copyWith(
        foregroundColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.onSurface;
          }
          return null;
        }),
      ),
      isSelected: isSelected,
      selectedIcon: selectedIcon,
      icon: icon,
    );
  }
}
