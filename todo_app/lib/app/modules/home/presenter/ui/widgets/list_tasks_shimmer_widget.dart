import 'package:flutter/material.dart';
import 'package:tads_design_system/tads_design_system.dart';

class ListTasksShimmerWidget extends StatelessWidget {
  const ListTasksShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12, bottom: 12),
          child: Text(
            'Tasks',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.all(8.0),
            child: CardTileShimmerWidget(),
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
        ),
        SizedBox(height: size.height * 0.01),
        const Padding(
          padding: EdgeInsets.only(left: 12, bottom: 12),
          child: Text(
            'Completed',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.all(8.0),
            child: CardTileShimmerWidget(),
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
        ),
      ],
    );
  }
}
