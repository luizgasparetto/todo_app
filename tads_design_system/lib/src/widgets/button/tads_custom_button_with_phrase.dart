import 'package:flutter/material.dart';

class TADSCustomButtonWithPhrase extends StatelessWidget {
  final String phrase;
  final String buttonTitle;
  final void Function()? onPressed;

  const TADSCustomButtonWithPhrase({
    Key? key,
    required this.phrase,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            phrase,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ],
    );
  }
}
