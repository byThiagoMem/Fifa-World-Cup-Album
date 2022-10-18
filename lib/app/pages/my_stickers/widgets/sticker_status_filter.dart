import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/test_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/button.dart';
import 'package:fwc_album/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickerStatusFilter extends StatefulWidget {
  const StickerStatusFilter({
    super.key,
    required this.filterSelected,
  });

  final String filterSelected;

  @override
  State<StickerStatusFilter> createState() => _StickerStatusFilterState();
}

class _StickerStatusFilterState extends State<StickerStatusFilter> {
  @override
  Widget build(BuildContext context) {
    var presenter = context.get<MyStickersPresenter>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('all');
            },
            style: widget.filterSelected == 'all'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primatyButton,
            labelStyle: widget.filterSelected == 'all'
                ? context.textStyle.textSecondaryFontMedium.copyWith(
                    color: context.color.primary,
                  )
                : context.textStyle.textSecondaryFontMedium,
            label: 'Todas',
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('missing');
            },
            style: widget.filterSelected == 'missing'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primatyButton,
            labelStyle: widget.filterSelected == 'missing'
                ? context.textStyle.textSecondaryFontMedium.copyWith(
                    color: context.color.primary,
                  )
                : context.textStyle.textSecondaryFontMedium,
            label: 'Faltando',
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('repeated');
            },
            style: widget.filterSelected == 'repeated'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primatyButton,
            labelStyle: widget.filterSelected == 'repeated'
                ? context.textStyle.textSecondaryFontMedium.copyWith(
                    color: context.color.primary,
                  )
                : context.textStyle.textSecondaryFontMedium,
            label: 'Repetidas',
          ),
        ],
      ),
    );
  }
}
