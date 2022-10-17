import 'package:fwc_album/app/pages/home/view/home_view.dart';
import 'package:fwc_album/app/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './home_persenter.dart';

class HomePersenterImpl implements HomePersenter {
  final UserRepository userRepository;
  late HomeView _view;

  HomePersenterImpl({
    required this.userRepository,
  });

  @override
  Future<void> getUserData() async {
    try {
      _view.showLoader();
      final user = await userRepository.getMe();
      _view.updateUser(user);
    } catch (_) {
      _view.error('Erro ao buscar os dados do usuário');
    }
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    _view.logoutSuccess();
  }

  @override
  set view(HomeView view) => _view = view;
}
