import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album/app/core/rest/custom_dio.dart';
import 'package:fwc_album/app/models/group_stickers_model.dart';
import 'package:fwc_album/app/models/register_sticker_model.dart';
import 'package:fwc_album/app/models/sticker_model.dart';

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

  @override
  Future<StickerModel?> findStickerByCode(
    String stickerCode,
    String stickerName,
  ) async {
    try {
      var result =
          await dio.auth().get('/api/sticker-search', queryParameters: {
        'sticker_code': stickerCode,
        'sticker_name': stickerName,
      });

      return StickerModel.fromJson(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 404) {
        return null;
      } else {
        log('Erro ao buscar figurinha', error: e, stackTrace: s);
        throw RepositoryException(message: 'Erro ao buscar figurinha');
      }
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerStickerModel) async {
    try {
      final body = FormData.fromMap({
        ...registerStickerModel.toJson(),
        'sticker_image_upload': '',
      });

      final result = await dio.auth().post('/api/sticker', data: body);

      return StickerModel.fromJson(result.data);
    } on DioError catch (e, s) {
      log('Erro ao register figurinha no album', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao register figurinha no album');
    }
  }

  @override
  Future<void> registerUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().post('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log('Erro ao cadastrar figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao cadastrar figurinha');
    }
  }

  @override
  Future<void> updateUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().put('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log('Erro ao cadastrar figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao cadastrar figurinha');
    }
  }
}
