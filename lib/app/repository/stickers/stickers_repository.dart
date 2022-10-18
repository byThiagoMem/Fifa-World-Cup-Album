import 'package:fwc_album/app/models/group_stickers_model.dart';
import 'package:fwc_album/app/models/sticker_model.dart';

import '../../models/register_sticker_model.dart';

abstract class StickersRepository {
  Future<List<GroupStickers>> getMyAlbum();

  Future<StickerModel> create(RegisterStickerModel registerStickerModel);

  Future<StickerModel?> findStickerByCode(
    String stickerCode,
    String stickerName,
  );

  Future<void> registerUserSticker(int stickerId, int amount);

  Future<void> updateUserSticker(int stickerId, int amount);
}
