import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;

  const PasswordField({super.key, this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

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
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 15),
          prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade600),
          suffixIcon: IconButton(
            splashRadius: 18,
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey.shade400,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
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
