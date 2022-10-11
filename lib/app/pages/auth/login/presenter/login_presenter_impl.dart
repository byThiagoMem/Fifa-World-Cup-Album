import 'dart:developer';

import 'package:fwc_album/app/core/exceptions/unauthorized_exception.dart';
import 'package:fwc_album/app/pages/auth/login/view/login_view.dart';
import 'package:fwc_album/app/services/login/login_service.dart';

import './login_presenter.dart';

class LoginPresenterImpl implements LoginPresenter {
  LoginPresenterImpl({
    required this.service,
  });

  final LoginService service;

  late LoginView _view;

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await service.execute(email: email, password: password);
      _view.success();
    } on UnauthorizedException {
      _view.error('Usuário ou senha inválidos');
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      _view.error('Erro ao realizar login');
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
