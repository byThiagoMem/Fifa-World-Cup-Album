import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/test_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/rounded_button.dart';
import 'package:fwc_album/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import 'package:fwc_album/app/pages/sticker_detail/view/sticker_detail_view_impl.dart';

import '../../core/ui/widgets/button.dart';

class StickerDetailsPage extends StatefulWidget {
  const StickerDetailsPage({super.key, required this.presenter});

  final StickerDetailPresenter presenter;

  @override
  State<StickerDetailsPage> createState() => _StickerDetailsPageState();
}

class _StickerDetailsPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                hasSticker
                    ? 'assets/images/sticker.png'
                    : 'assets/images/sticker_pb.png',
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      '$countryCode $stickerNumber',
                      style: context.textStyle.textPrimaryFontBold.copyWith(
                        fontSize: 22,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: RoundedButton(
                        icon: Icons.remove,
                        onPressed: widget.presenter.decrementAmount,
                      ),
                    ),
                    Text(
                      '$amount',
                      style: context.textStyle.textSecondaryFontMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: RoundedButton(
                        icon: Icons.add,
                        onPressed: widget.presenter.incrementAmount,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  countryName,
                  style: context.textStyle.textPrimaryFontRegular,
                ),
              ),
              Button.primary(
                onPressed: widget.presenter.saveSticker,
                label:
                    hasSticker ? 'Atualizar figurinha' : 'Adicionar figurinha',
                width: MediaQuery.of(context).size.width * .9,
              ),
              Button(
                onPressed: widget.presenter.deleteSticker,
                label: 'Excluir figurinha',
                width: MediaQuery.of(context).size.width * .9,
                outlined: true,
                style: context.buttonStyles.primatyOutlinedButton,
                labelStyle:
                    context.textStyle.textSecondaryFontExtraBoldPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
