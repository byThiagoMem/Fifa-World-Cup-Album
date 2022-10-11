import 'dart:developer';

import 'package:fwc_album/app/models/register_user_model.dart';
import 'package:fwc_album/app/pages/auth/register/view/register_view.dart';
import 'package:fwc_album/app/repository/auth/auth_repository.dart';

import './register_presenter.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  RegisterPresenterImpl({required this.repository});

  final AuthRepository repository;

  late RegisterView _view;

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final registerUserModel = RegisterUserModel(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    try {
      await repository.register(registerUserModel);
      _view.registerSuccess();
    } catch (e, s) {
      log('Erro ao cadastrar usuário', error: e, stackTrace: s);
      _view.registerError();
    }
  }

  @override
  set view(RegisterView view) => _view = view;
}
