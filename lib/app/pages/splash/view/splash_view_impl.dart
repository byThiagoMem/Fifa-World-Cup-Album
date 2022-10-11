import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/helpers/loader.dart';
import 'package:fwc_album/app/pages/splash/splash_page.dart';

import './splash_view.dart';

abstract class SplashViewImpl extends State<SplashPage>
    with Loader<SplashPage>
    implements SplashView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void logged(bool isLogged) {
    hideLoader();
    if (isLogged) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/auth/login',
        (route) => false,
      );
    }
  }
}
