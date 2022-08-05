import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:tads_design_system/src/common/common.dart';

class TADSNoItensCard extends StatelessWidget {
  final String title;
  const TADSNoItensCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          package: StringsConstants.tadsPackageName,
          StringsConstants.noItemImage,
          repeat: true,
          reverse: true,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
