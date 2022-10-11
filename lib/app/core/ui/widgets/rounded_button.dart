import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(.2),
      shape: const CircleBorder(),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: context.color.darkGrey,
          ),
        ),
      ),
    );
  }
}
