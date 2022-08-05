import 'package:flutter/material.dart';

import '../../../tads_design_system.dart';

class TADSCustomDateTime extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final String title;
  final String validateText;
  final bool? isWeb;
  const TADSCustomDateTime({
    Key? key,
    this.onPressed,
    required this.label,
    required this.title,
    required this.validateText,
    this.isWeb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isWeb != null ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(CustomColors.backgroundSelected)),
          child: SizedBox(
            height: 35,
            width: 80,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 20, color: CustomColors.primary),
        ),
      ],
    );
  }
}
