import 'package:flutter/material.dart';

class TADSCustomPrefixLabel extends StatelessWidget {
  final String label;

  const TADSCustomPrefixLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.01),
      child: Text(
        label,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
