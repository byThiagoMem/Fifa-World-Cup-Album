import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import 'package:fwc_album/app/pages/sticker_detail/presenter/sticker_detail_presenter_impl.dart';
import 'package:fwc_album/app/pages/sticker_detail/sticker_details_page.dart';
import 'package:fwc_album/app/repository/stickers/stickers_repository_impl.dart';
import 'package:fwc_album/app/services/sticker/find_sticker_service_impl.dart';

import '../../repository/stickers/stickers_repository.dart';
import '../../services/sticker/find_sticker_service.dart';

class StickerDetailRoute extends FlutterGetItPageRoute {
  const StickerDetailRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>(
            (i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<FindStickerService>((i) => FindStickerServiceImpl(
              repository: i(),
            )),
        Bind.lazySingleton<StickerDetailPresenter>(
            (i) => StickerDetailPresenterImpl(service: i(), repository: i())),
      ];

  @override
  WidgetBuilder get page => ((context) => StickerDetailsPage(
        presenter: context.get(),
      ));
}
