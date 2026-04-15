import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translation_app/core/service/get_it.dart';
import 'package:translation_app/features/data/models/language_model.dart';
import 'package:translation_app/features/domain/repo/transation_repo.dart';
import 'package:translation_app/features/presentation/widgets/language_selector.dart';
import 'package:translation_app/features/presentation/widgets/my_custom_scrollview.dart';
import 'package:translation_app/features/presentation/widgets/result_card.dart';
import 'package:translation_app/features/presentation/widgets/translation_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController text = TextEditingController();
  LanguageModel sourceLang = LanguageModel(
    name: "English",
    code: "en",
    flag: "🇺🇸",
  );
  LanguageModel targetLang = LanguageModel(
    name: "Arabic",
    code: "ar",
    flag: "🇪🇬",
  );

  String translatedText = "";
  bool isLoading = false;
  bool isTranslated = false;

  void translate() async {
    if (text.text.isEmpty) return;

    setState(() {
      isLoading = true;
    });
    debugPrint(text.text);

    final result = await getIt<TranslationRepo>().translateText(
      text.text,
      sourceLang.code,
      targetLang.code,
    );

    setState(() {
      result.fold(
        (f) {
          debugPrint(f.errorMsg);
          isLoading = false;
        },
        (s) {
          translatedText = s;
          isTranslated = true;
          isLoading = false;
          // debugPrint('translation is $s');
        },
      );
    });
  }

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollViewWithAppBar(
      title: "Language Translator",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          children: [
            LanguageSelector(
              fromLang: sourceLang, 
              toLang: targetLang, 
              onFromChanged: (newLang) {
                setState(() {
                  sourceLang = newLang;
                });
              },
              onToChanged: (newLang) {
                setState(() {
                  targetLang = newLang;
                });
              },
              onSwap: () {
                setState(() {
                  final temp = sourceLang;
                  sourceLang = targetLang;
                  targetLang = temp;
                });
              },
            ),

            SizedBox(height: 15.h),

            TranslationCard(
              lang: sourceLang.name,
              text: text,
              isLoading: isLoading,
              translate: translate,
            ),

            if (isTranslated && !isLoading) ...[
              SizedBox(height: 20),
              ResultCard(language: targetLang.name, translatedText: translatedText),
            ],
          ],
        ),
      ),
    );
  }
}
