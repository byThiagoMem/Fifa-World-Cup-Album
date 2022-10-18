import '../../../models/group_stickers_model.dart';

abstract class MyStickersView {
  void loadedPage(List<GroupStickers> album);

  void error(String message);

  void updateStatusFilter(String status);

  void updateAlbum(List<GroupStickers> album);
}
