import 'package:flutter/material.dart';

/// M3準拠
/// see: https://zenn.dev/enoiu/articles/6b754d37d5a272#flutter%E3%81%A7filled-card%2C-outlined-card
class FilledCard extends StatelessWidget {
  const FilledCard({
    super.key,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.borderOnForeground = true,
    this.margin,
    this.clipBehavior,
    this.child,
    this.semanticContainer = true,
  });

  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final Clip? clipBehavior;
  final EdgeInsetsGeometry? margin;
  final bool semanticContainer;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Theme.of(context).colorScheme.surfaceVariant,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: 0,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      semanticContainer: semanticContainer,
      child: child,
    );
  }
}

/// M3準拠
/// see: https://zenn.dev/enoiu/articles/6b754d37d5a272#flutter%E3%81%A7filled-card%2C-outlined-card
class OutlinedCard extends StatelessWidget {
  const OutlinedCard({
    super.key,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.outlineColor,
    this.borderOnForeground = true,
    this.margin,
    this.clipBehavior,
    this.child,
    this.semanticContainer = true,
    this.onTap,
  });

  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Color? outlineColor;
  final bool borderOnForeground;
  final Clip? clipBehavior;
  final EdgeInsetsGeometry? margin;
  final bool semanticContainer;
  final Widget? child;
  final VoidCallback? onTap;

  static const borderRadius = BorderRadius.all(Radius.circular(12));

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: outlineColor ?? Theme.of(context).colorScheme.outline,
        ),
        borderRadius: borderRadius,
      ),
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      semanticContainer: semanticContainer,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}
