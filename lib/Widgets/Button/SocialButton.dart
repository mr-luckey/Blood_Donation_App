// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomIconButton extends StatelessWidget {
//   final String text;
//   final IconData? iconData;
//   final String? iconAsset;
//   final String? svgAsset;
//   final Color buttonColor;
//   final Color textColor;
//   final Color iconColor;
//   final VoidCallback onTap;
//   final double borderRadius;
//   final EdgeInsetsGeometry padding;
//   final bool isLoading;
//   final double elevation;
//   final bool expanded;

//   const CustomIconButton({
//     Key? key,
//     required this.text,
//     required this.onTap,
//     this.iconData,
//     this.iconAsset,
//     this.svgAsset,
//     this.buttonColor = Colors.white,
//     this.textColor = Colors.black,
//     this.iconColor = Colors.black,
//     this.borderRadius = 8.0,
//     this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//     this.isLoading = false,
//     this.elevation = 1.0,
//     this.expanded = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: elevation,
//       borderRadius: BorderRadius.circular(borderRadius),
//       child: Container(
//         width: expanded ? double.infinity : null,
//         child: InkWell(
//           onTap: isLoading ? null : onTap,
//           borderRadius: BorderRadius.circular(borderRadius),
//           child: Container(
//             padding: padding,
//             decoration: BoxDecoration(
//               color: buttonColor,
//               borderRadius: BorderRadius.circular(borderRadius),
//               border: Border.all(color: Colors.grey.shade300, width: 1.0),
//             ),
//             child: isLoading
//                 ? Center(
//                     child: SizedBox(
//                       height: 20,
//                       width: 20,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                         valueColor: AlwaysStoppedAnimation<Color>(textColor),
//                       ),
//                     ),
//                   )
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: expanded
//                         ? MainAxisSize.max
//                         : MainAxisSize.min,
//                     children: [
//                       // Icon/Image section
//                       if (iconData != null)
//                         Icon(iconData, color: iconColor, size: 20)
//                       else if (svgAsset != null)
//                         SvgPicture.asset(
//                           svgAsset!,
//                           height: 20,
//                           width: 20,
//                           colorFilter: iconColor != Colors.black
//                               ? ColorFilter.mode(iconColor, BlendMode.srcIn)
//                               : null,
//                         )
//                       else if (iconAsset != null)
//                         Image.asset(iconAsset!, height: 20, width: 20),

//                       if ((iconData != null ||
//                               iconAsset != null ||
//                               svgAsset != null) &&
//                           text.isNotEmpty)
//                         SizedBox(width: 12),

//                       // Text section
//                       if (text.isNotEmpty)
//                         Text(
//                           text,
//                           style: TextStyle(
//                             color: textColor,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.25,
//                           ),
//                         ),
//                     ],
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final String? iconAsset;
  final String? svgAsset;
  final Color buttonColor;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onTap;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final bool isLoading;
  final double elevation;
  final bool expanded;

  const CustomIconButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.iconData,
    this.iconAsset,
    this.svgAsset,
    this.buttonColor = Colors.white,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.isLoading = false,
    this.elevation = 1.0,
    this.expanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = size.width / 375; // base iPhone width

    return Material(
      elevation: elevation * scale,
      borderRadius: BorderRadius.circular(borderRadius * scale),
      child: Container(
        width: expanded ? double.infinity : null,
        child: InkWell(
          onTap: isLoading ? null : onTap,
          borderRadius: BorderRadius.circular(borderRadius * scale),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24 * scale,
              vertical: 16 * scale,
            ),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(borderRadius * scale),
              border: Border.all(color: Colors.grey.shade300, width: 1 * scale),
            ),
            child: isLoading
                ? Center(
                    child: SizedBox(
                      height: 20 * scale,
                      width: 20 * scale,
                      child: CircularProgressIndicator(
                        strokeWidth: 2 * scale,
                        valueColor: AlwaysStoppedAnimation<Color>(textColor),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: expanded
                        ? MainAxisSize.max
                        : MainAxisSize.min,
                    children: [
                      if (iconData != null)
                        Icon(iconData, color: iconColor, size: 20 * scale)
                      else if (svgAsset != null)
                        SvgPicture.asset(
                          svgAsset!,
                          height: 20 * scale,
                          width: 20 * scale,
                          colorFilter: iconColor != Colors.black
                              ? ColorFilter.mode(iconColor, BlendMode.srcIn)
                              : null,
                        )
                      else if (iconAsset != null)
                        Image.asset(
                          iconAsset!,
                          height: 20 * scale,
                          width: 20 * scale,
                        ),

                      if ((iconData != null ||
                              iconAsset != null ||
                              svgAsset != null) &&
                          text.isNotEmpty)
                        SizedBox(width: 12 * scale),

                      if (text.isNotEmpty)
                        Text(
                          text,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16 * scale,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.25,
                          ),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
