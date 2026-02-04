import 'package:flutter/material.dart';

class Simpletextfield extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController? controller;

  const Simpletextfield({
    super.key,
    required this.hint,
    required this.icon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 15),
          prefixIcon: Icon(icon, color: Colors.grey.shade600),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
        ),
      ),
    );
  }
}
