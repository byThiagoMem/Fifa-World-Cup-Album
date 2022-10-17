import 'package:fwc_album/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album/app/pages/home/view/home_view.dart';

abstract class HomePersenter extends FwcPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
