import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translation_app/features/data/models/language_model.dart';

class LanguageButtun extends StatelessWidget {
  const LanguageButtun({super.key, required this.lang, required this.onPressed});
  final LanguageModel lang;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(lang.flag, style: TextStyle(fontSize: 18.sp)),
            SizedBox(width: 8.w),
            Text(lang.name, style: TextStyle(fontWeight: FontWeight.w600)),
            Icon(Icons.arrow_drop_down, color: Colors.grey),])
    );
  }
}