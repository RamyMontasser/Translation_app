import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translation_app/features/data/models/language_model.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key, required this.languageList, required this.currentLang, required this.onSelected});
  final List<LanguageModel> languageList;
  final LanguageModel currentLang;
  final Function(LanguageModel) onSelected;

  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton<LanguageModel>(
      initialValue: currentLang,
      onSelected: onSelected,
      child: Row(
        children: [
          Text(currentLang.name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 8.w),
          Text(currentLang.flag, style: TextStyle(fontSize: 20)),
          // Icon(Icons.arrow_drop_down),
        ],
      ),
      itemBuilder: (BuildContext context) {
        return 
        languageList.map((LanguageModel lang) {
          return PopupMenuItem<LanguageModel>(
            value: lang,
            child: Row(
              children: [
                Text(lang.flag, style: TextStyle(fontSize: 20)),
                SizedBox(width: 10.w),
                Text(lang.name),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}