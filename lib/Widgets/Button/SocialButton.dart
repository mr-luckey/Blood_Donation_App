import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  // final IconData? iconData;
  final String? iconAsset;
  final String? svgAsset;
  final VoidCallback onTap;
  final bool isLoading;
  final bool expanded;

  const CustomIconButton({
    Key? key,
    required this.text,
    required this.onTap,
    // this.iconData,
    this.iconAsset,
    this.svgAsset,
    this.isLoading = false,
    this.expanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: expanded ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color:
                theme.elevatedButtonTheme.style?.backgroundColor?.resolve({}) ??
                theme.primaryColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: theme.dividerColor),
          ),
          child: isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (svgAsset != null)
                      SvgPicture.asset(
                        svgAsset!,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    if (svgAsset != null && text.isNotEmpty)
                      const SizedBox(width: 12),
                    Text(
                      text,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
