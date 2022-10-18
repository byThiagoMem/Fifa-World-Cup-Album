import 'package:fwc_album/app/models/sticker_model.dart';

abstract class FindStickerService {
  Future<StickerModel> execute(String countryCode, String stickerNumber);
}
