class UserStickerModel {
  final int id;
  final int idUser;
  final int idSticker;
  final int duplicate;
  final String stickerCode;
  final String stickerNumber;

  UserStickerModel({
    required this.id,
    required this.idUser,
    required this.idSticker,
    required this.duplicate,
    required this.stickerCode,
    required this.stickerNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_user': idUser,
      'id_sticker': idSticker,
      'duplicate_stickers': duplicate,
      'sticker_code': stickerCode,
      'sticker_number': stickerNumber,
    };
  }

  factory UserStickerModel.fromJson(Map<String, dynamic> map) {
    return UserStickerModel(
      id: map['id']?.toInt() ?? 0,
      idUser: map['id_user']?.toInt() ?? 0,
      idSticker: map['id_sticker']?.toInt() ?? 0,
      duplicate: map['duplicate_stickers']?.toInt() ?? 0,
      stickerCode: map['sticker_code'] ?? '',
      stickerNumber: map['sticker_number'] ?? '',
    );
  }
}
