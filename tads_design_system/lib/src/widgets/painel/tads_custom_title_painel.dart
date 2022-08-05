import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TADSCustomTitlePainel extends StatelessWidget {
  final String title;
  final String subtitle;

  const TADSCustomTitlePainel({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment:
          kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
