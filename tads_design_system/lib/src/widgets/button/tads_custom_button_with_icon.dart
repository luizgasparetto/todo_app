import 'package:flutter/material.dart';
import 'package:tads_design_system/src/common/common.dart';

class TADSCustomButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final double width;
  final bool isLoading;

  const TADSCustomButtonWithIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.width,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget child;
    if (isLoading) {
      child = const CircularProgressIndicator(
        color: Colors.white,
      );
    } else {
      child = Icon(icon, color: Colors.white);
    }
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: CustomColors.buttonGradient,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: child),
      ),
    );
  }
}
