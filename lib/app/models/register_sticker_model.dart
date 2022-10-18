class RegisterStickerModel {
  final String name;
  final String stickerCode;
  final String stickerNumber;

  RegisterStickerModel({
    required this.name,
    required this.stickerCode,
    required this.stickerNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sticker_code': stickerCode,
      'sticker_number': stickerNumber,
    };
  }

  factory RegisterStickerModel.fromJson(Map<String, dynamic> map) {
    return RegisterStickerModel(
      name: map['name'] ?? '',
      stickerCode: map['sticker_code'] ?? '',
      stickerNumber: map['sticker_number'] ?? '',
    );
  }
}
