import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/test_styles.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final Image icon;
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          width: 46,
          child: CircleAvatar(
            radius: 46,
            backgroundColor: context.color.grey,
            child: icon,
          ),
        ),
        title: Text(
          label,
          style: context.textStyle.textPrimaryFontRegular.copyWith(
            color: Colors.white,
          ),
        ),
        trailing: Text(
          '$value',
          style: context.textStyle.textPrimaryFontMedium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
