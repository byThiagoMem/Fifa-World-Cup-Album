class StickerModel {
  final int id;
  final String stickerCode;
  final String stickerName;
  final String stickerNumber;
  final String stickerImage;

  StickerModel({
    required this.id,
    required this.stickerCode,
    required this.stickerName,
    required this.stickerNumber,
    required this.stickerImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sticker_code': stickerCode,
      'sticker_name': stickerName,
      'sticker_number': stickerNumber,
      'sticker_image': stickerImage,
    };
  }

  factory StickerModel.fromJson(Map<String, dynamic> map) {
    return StickerModel(
      id: map['id']?.toInt() ?? 0,
      stickerCode: map['sticker_code'] ?? '',
      stickerName: map['sticker_name'] ?? '',
      stickerNumber: map['sticker_number'] ?? '',
      stickerImage: map['sticker_image'] ?? '',
    );
  }
}
