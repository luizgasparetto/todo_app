import 'package:flutter/material.dart';
import 'package:tads_design_system/src/common/common.dart';

class TADSCustomTextField extends StatefulWidget {
  final String label;
  final IconData prefixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validate;
  final bool isPassword;
  final String? initialValue;

  const TADSCustomTextField({
    Key? key,
    required this.label,
    required this.prefixIcon,
    required this.onChanged,
    this.validate,
    this.isPassword = false,
    this.initialValue,
  }) : super(key: key);

  @override
  State<TADSCustomTextField> createState() => _TADSCustomTextFieldState();
}

class _TADSCustomTextFieldState extends State<TADSCustomTextField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: size.width >= 600 ? size.width * 0.28 : null,
        child: TextFormField(
          initialValue: widget.initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textAlign: TextAlign.start,
          obscureText: widget.isPassword && isVisible,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.label,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 2),
              child: Icon(
                widget.prefixIcon,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () => setState(() => isVisible = !isVisible),
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      color: CustomColors.borderColor,
                    ),
                  )
                : null,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          onChanged: widget.onChanged,
          validator: widget.validate,
        ),
      ),
    );
  }
}
