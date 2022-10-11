import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/helpers/loader.dart';
import 'package:fwc_album/app/pages/auth/register/register_page.dart';

import './register_view.dart';
import '../../../../core/ui/helpers/messages.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Messages<RegisterPage>, Loader<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showError(message ?? 'Erro ao register usuário');
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess('Usuário cadastrado com sucesso');
    Navigator.of(context).pop();
  }
}
