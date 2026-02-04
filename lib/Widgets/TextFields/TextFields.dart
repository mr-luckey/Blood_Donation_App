import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;

  const PasswordField({super.key, this.controller, this.hint = 'Password'});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: theme.inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: theme.textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: theme.inputDecorationTheme.hintStyle,
          prefixIcon: Icon(Icons.lock_outline, color: theme.hintColor),
          suffixIcon: IconButton(
            splashRadius: 18,
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: theme.hintColor,
            ),
            onPressed: () => setState(() => _obscureText = !_obscureText),
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

class SimpleTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController? controller;

  const SimpleTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: theme.inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: controller,
        style: theme.textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: theme.inputDecorationTheme.hintStyle,
          prefixIcon: Icon(icon, color: theme.hintColor),
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
