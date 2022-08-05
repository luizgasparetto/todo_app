import 'package:flutter/material.dart';
import 'package:tads_design_system/src/common/common.dart';

class TADSCustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? width;
  final bool isLoading;

  const TADSCustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget child;

    if (isLoading) {
      child = const SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(color: Colors.white),
      );
    } else {
      child = Text(text, style: Theme.of(context).textTheme.headline2);
    }

    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(isLoading ? 50 : 15),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isLoading ? 60 : width,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: CustomColors.buttonGradient,
            ),
            borderRadius: BorderRadius.circular(isLoading ? 50 : 15),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
