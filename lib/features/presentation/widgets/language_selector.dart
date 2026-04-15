import 'package:flutter/material.dart';
import 'package:translation_app/features/data/models/language_model.dart';
import 'package:translation_app/features/presentation/widgets/custom_bottom_sheet.dart';
import 'package:translation_app/features/presentation/widgets/language_buttun.dart';

class LanguageSelector extends StatelessWidget {
  LanguageSelector({
    super.key,
    required this.fromLang,
    required this.toLang,
    required this.onFromChanged,
    required this.onToChanged,
    required this.onSwap,
  });

  final LanguageModel fromLang;
  final LanguageModel toLang;
  final Function(LanguageModel) onFromChanged;
  final Function(LanguageModel) onToChanged;
  final VoidCallback onSwap;

  final List<LanguageModel> languageList = [
    LanguageModel(name: "English", code: "en", flag: "🇺🇸"),
    LanguageModel(name: "Arabic", code: "ar", flag: "🇪🇬"),
    LanguageModel(name: "Spanish", code: "es", flag: "🇪🇸"),
    LanguageModel(name: "French", code: "fr", flag: "🇫🇷"),
    LanguageModel(name: "German", code: "de", flag: "🇩🇪"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LanguageButtun(
            lang: fromLang,
            onPressed: () => _bottomSheet(context, onFromChanged),
          ),

          Icon(Icons.swap_horiz, size: 30),

          LanguageButtun(
            lang: toLang,
            onPressed: () => _bottomSheet(context, onToChanged),
          ),
        ],
      ),
    );
  }

  void _bottomSheet(BuildContext context, Function(LanguageModel) onSelected) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          CustomBottomSheet(languageList: languageList, onSelected: onSelected),
    );
  }
}
