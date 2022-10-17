import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/test_styles.dart';

class StickerPercent extends StatelessWidget {
  const StickerPercent({
    super.key,
    required this.percent,
  });

  final int percent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: context.color.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$percent%',
              style: context.textStyle.titlePrimaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 110,
          width: 110,
          child: Transform.rotate(
            angle: -pi / 2.5,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 5,
              backgroundColor: Colors.white.withOpacity(.5),
              value: percent / 100,
            ),
          ),
        ),
      ],
    );
  }
}
