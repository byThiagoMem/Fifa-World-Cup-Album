import 'package:fwc_album/app/models/group_stickers_model.dart';

abstract class StickersRepository {
  Future<List<GroupStickers>> getMyAlbum();
}
