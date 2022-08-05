import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tads_design_system/tads_design_system.dart';

class CardTileShimmerWidget extends StatelessWidget {
  const CardTileShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: 200,
        height: size.height * 0.08,
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).dialogBackgroundColor,
          highlightColor: Colors.white30,
          child: Container(
            height: size.height * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: CustomColors.backgroundSelected,
            ),
          ),
        ),
      ),
    );
  }
}
