import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/core/rest/custom_dio.dart';
import 'package:fwc_album/app/pages/auth/login/login_route.dart';
import 'package:fwc_album/app/pages/splash/splash_route.dart';
import 'package:fwc_album/app/repository/auth/auth_repository.dart';
import 'package:fwc_album/app/repository/auth/auth_repository_impl.dart';

import 'core/ui/theme/theme_config.dart';
import 'pages/auth/register/register_route.dart';
import 'pages/home/home_page.dart';

class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Album',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (_) => const LoginRoute(),
          '/auth/register': (_) => const RegisterRoute(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
