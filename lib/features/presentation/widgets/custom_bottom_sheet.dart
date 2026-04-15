import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:translation_app/features/data/models/language_model.dart';

class CustomBottomSheet extends StatelessWidget {
  final List<LanguageModel> languageList;
  final Function(LanguageModel) onSelected;

  const CustomBottomSheet({
    super.key,
    required this.languageList,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h, 
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: AnimationLimiter(
        child: ListView.separated(
          itemCount: languageList.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50,
                child: FadeInAnimation(
                  child: ListTile(
                    leading: Text(
                      languageList[index].flag,
                      style: TextStyle(fontSize: 24.sp),
                    ),
                    title: Text(
                      languageList[index].name,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    onTap: () {
                      onSelected(languageList[index]);
                      Navigator.pop(context); 
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
