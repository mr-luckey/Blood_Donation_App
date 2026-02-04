// import 'package:flutter/material.dart';

// class GradientGlowButton extends StatelessWidget {
//   final VoidCallback onTap;
//   final String text;

//   const GradientGlowButton({
//     super.key,
//     required this.onTap,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 56,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(14),
//           gradient: const LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFF2DD4FF), // light blue
//               Color(0xFF2563EB), // deep blue
//             ],
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xFF2563EB).withOpacity(0.6),
//               blurRadius: 20,
//               spreadRadius: 2,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           text,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 1.2,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class GradientGlowButton extends StatelessWidget {
  final VoidCallback? onTap; // nullable now
  final String text;

  const GradientGlowButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return GestureDetector(
      onTap: isDisabled ? null : onTap, // safe now
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: isDisabled
              ? LinearGradient(
                  colors: [Colors.grey.shade400, Colors.grey.shade600],
                )
              : const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF2DD4FF), // light blue
                    Color(0xFF2563EB), // deep blue
                  ],
                ),
          boxShadow: [
            BoxShadow(
              color: (isDisabled ? Colors.grey : const Color(0xFF2563EB))
                  .withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isDisabled ? Colors.black38 : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
