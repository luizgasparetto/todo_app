import 'package:flutter/material.dart';
import "package:asuka/asuka.dart" as asuka;

import '../../../tads_design_system.dart';

class TADSCustomSnackBar extends SnackBar {
  TADSCustomSnackBar({
    Key? key,
    required String content,
    required Color color,
    required IconData? icon,
  }) : super(
          key: key,
          duration: const Duration(seconds: 3),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              Icon(icon, color: Colors.black54),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () => asuka.hideCurrentSnackBar(),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.close,
                    color: Colors.black54,
                  ),
                ),
              )
            ],
          ),
        );

  factory TADSCustomSnackBar.success(String content) =>
      TADSCustomSnackBar(content: content, color: CustomColors.success, icon: Icons.check);

  factory TADSCustomSnackBar.error(String content) =>
      TADSCustomSnackBar(content: content, color: CustomColors.primary, icon: Icons.error);
}
