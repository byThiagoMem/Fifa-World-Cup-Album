import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album/app/core/rest/custom_dio.dart';
import 'package:fwc_album/app/models/group_stickers_model.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;

  StickersRepositoryImpl({required this.dio});

  @override
  Future<List<GroupStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');

      return result.data
          .map<GroupStickers>((g) => GroupStickers.fromMap(g))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar algum do usuario', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar algum do usuário');
    }
  }
}
