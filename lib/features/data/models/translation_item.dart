class TranslationItem {
  final String sourceText;
  final String translatedText;
  final String sourceLangCode;
  final String targetLangCode;
  bool isFavorite;

  TranslationItem({
    required this.sourceText,
    required this.translatedText,
    required this.sourceLangCode,
    required this.targetLangCode,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() => {
    'sourceText': sourceText,
    'translatedText': translatedText,
    'sourceLangCode': sourceLangCode,
    'targetLangCode': targetLangCode,
    'isFavorite': isFavorite,
  };

  factory TranslationItem.fromJson(Map<String, dynamic> json) => TranslationItem(
    sourceText: json['sourceText'],
    translatedText: json['translatedText'],
    sourceLangCode: json['sourceLangCode'],
    targetLangCode: json['targetLangCode'],
    isFavorite: json['isFavorite'] ?? false,
  );
}
