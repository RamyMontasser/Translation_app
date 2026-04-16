import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translation_app/core/service/storage_service.dart';
import 'package:translation_app/features/data/models/translation_item.dart';

class HistoryFavouriteScaffold extends StatelessWidget {
  const HistoryFavouriteScaffold({super.key, required this.label, required this.translationList, required this.fun});
  final String label;
  final List<TranslationItem> translationList;
  final Future<void> fun;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF003366),
        actions: [
          TextButton(
            onPressed: () async {
              await StorageService.clearAll();
              fun;
            },
            child: Text("Clear all", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: translationList.length,
        itemBuilder: (context, index) {
          final item = translationList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        item.sourceLangCode,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Text(
                          item.sourceText,
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await StorageService.toggleFavorite(index);
                          fun;
                        },
                        child: Icon(
                          item.isFavorite ? Icons.star : Icons.star_border,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text(
                        item.targetLangCode,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Text(
                          item.translatedText,
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await StorageService.deleteItem(index);
                          fun;
                        },
                        child: Icon(Icons.delete_outline, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}