import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/pages/home/home_page.dart';
import 'package:fwc_album/app/pages/home/presenter/home_persenter.dart';
import 'package:fwc_album/app/pages/home/presenter/home_persenter_impl.dart';
import 'package:fwc_album/app/repository/user/user_repository.dart';
import 'package:fwc_album/app/repository/user/user_repository_impl.dart';

class HomeRoute extends FlutterGetItPageRoute {
  const HomeRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(dio: i())),
        Bind.lazySingleton<HomePersenter>(
          (i) => HomePersenterImpl(userRepository: i()),
        )
      ];

  @override
  WidgetBuilder get page => (context) => HomePage(presenter: context.get());
}
