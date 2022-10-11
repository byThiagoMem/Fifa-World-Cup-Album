import 'package:fwc_album/app/repository/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './login_service.dart';

class LoginServiceImpl implements LoginService {
  LoginServiceImpl({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<void> execute(
      {required String email, required String password}) async {
    final accessToken =
        await repository.login(email: email, password: password);

    final sp = await SharedPreferences.getInstance();

    sp.setString('access_token', accessToken);
  }
}
