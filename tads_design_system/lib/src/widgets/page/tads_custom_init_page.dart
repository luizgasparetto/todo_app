import 'package:flutter/material.dart';

class TADSCustomInitPage extends StatelessWidget {
  final Widget child;
  final double verticalPadding;

  const TADSCustomInitPage({
    Key? key,
    required this.child,
    required this.verticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: verticalPadding),
          child: child,
        ),
      ),
    );
  }
}
