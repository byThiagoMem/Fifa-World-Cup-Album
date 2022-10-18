import 'package:fwc_album/app/models/register_sticker_model.dart';
import 'package:fwc_album/app/models/sticker_model.dart';
import 'package:fwc_album/app/repository/stickers/stickers_repository.dart';

import './find_sticker_service.dart';

class FindStickerServiceImpl implements FindStickerService {
  FindStickerServiceImpl({
    required this.repository,
  });

  final StickersRepository repository;

  @override
  Future<StickerModel> execute(String countryCode, String stickerNumber) async {
    var sticker = await repository.findStickerByCode(
      countryCode,
      stickerNumber,
    );

    if (sticker == null) {
      final registerSticker = RegisterStickerModel(
        name: '',
        stickerCode: countryCode,
        stickerNumber: stickerNumber,
      );

      sticker = await repository.create(registerSticker);
    }

    return sticker;
  }
}
