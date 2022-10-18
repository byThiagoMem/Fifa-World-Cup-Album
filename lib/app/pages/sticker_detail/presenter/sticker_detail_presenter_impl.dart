import 'package:fwc_album/app/models/sticker_model.dart';
import 'package:fwc_album/app/models/user_sticker_model.dart';
import 'package:fwc_album/app/pages/sticker_detail/view/sticker_detail_view.dart';
import 'package:fwc_album/app/repository/stickers/stickers_repository.dart';
import 'package:fwc_album/app/services/sticker/find_sticker_service.dart';

import './sticker_detail_presenter.dart';

class StickerDetailPresenterImpl implements StickerDetailPresenter {
  late final StickerDetailView _view;
  final FindStickerService service;
  final StickersRepository repository;
  UserStickerModel? stickerUser;
  StickerModel? sticker;
  int amount = 0;

  StickerDetailPresenterImpl({
    required this.service,
    required this.repository,
  });

  @override
  set view(StickerDetailView view) => _view = view;

  @override
  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickerModel? stickerUser,
  }) async {
    this.stickerUser = stickerUser;

    if (stickerUser == null) {
      sticker = await service.execute(countryCode, stickerNumber);
    }

    bool hasSticker = stickerUser != null;

    if (hasSticker) {
      amount = stickerUser.duplicate + 1;
    }

    _view.screenLoaded(
      hasSticker,
      countryCode,
      stickerNumber,
      countryName,
      amount,
    );
  }

  @override
  void decrementAmount() {
    if (amount > 1) {
      _view.updateAmount(--amount);
    }
  }

  @override
  void incrementAmount() {
    _view.updateAmount(++amount);
  }

  @override
  Future<void> saveSticker() async {
    try {
      _view.showLoader();
      if (stickerUser == null) {
        await repository.registerUserSticker(sticker!.id, amount);
      } else {
        await repository.updateUserSticker(stickerUser!.idSticker, amount);
      }
      _view.saveSuccess();
    } on Exception catch (_) {
      _view.error('Erro ao atualizar ou cadastrar figurinha');
    }
  }

  @override
  Future<void> deleteSticker() async {
    _view.showLoader();
    if (stickerUser != null) {
      await repository.updateUserSticker(stickerUser!.idSticker, 0);
    }
    _view.saveSuccess();
  }
}
