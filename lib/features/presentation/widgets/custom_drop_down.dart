import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translation_app/features/data/models/language_model.dart';

class CustomDropDown extends StatelessWidget {
  final List<LanguageModel> languageList;
  final LanguageModel currentLang;
  final Function(LanguageModel?) onSelected;

  const CustomDropDown({
    super.key,
    required this.languageList,
    required this.currentLang,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<LanguageModel>(
        value: currentLang,
        icon: Icon(Icons.arrow_drop_down),
        onChanged: onSelected,
        selectedItemBuilder: (context) {
          return languageList.map((lang) {
            return Row(
              children: [
                Text(lang.name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 8.w),
                Text(lang.flag, style: TextStyle(fontSize: 20)),
              ],
            );
          }).toList();
        },
        items: languageList.map((lang) {
          return DropdownMenuItem<LanguageModel>(
            value: lang,
            child: Row(
              children: [
                Text(lang.flag, style: TextStyle(fontSize: 20)),
                SizedBox(width: 10.w),
                Text(lang.name),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
