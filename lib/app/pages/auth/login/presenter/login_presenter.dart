import 'package:fwc_album/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album/app/pages/auth/login/view/login_view.dart';

abstract class LoginPresenter extends FwcPresenter<LoginView> {
  Future<void> login({required String email, required String password});
}
