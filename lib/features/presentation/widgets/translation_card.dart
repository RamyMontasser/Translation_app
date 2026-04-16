import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TranslationCard extends StatelessWidget {
  const TranslationCard({
    super.key,
    required this.lang,
    required this.text,
    required this.isLoading,
    required this.translate,
  });
  final String lang;
  final TextEditingController text;
  final bool isLoading;
  final VoidCallback translate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lang,
                style: TextStyle(
                  color: Color(0xFF003366),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              IconButton(
                onPressed: () {
                  text.clear();
                },
                icon: Icon(Icons.close),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          Expanded(
            child: TextField(
              controller: text,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Enter text here...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Color(0xFF003366),
                ),
                child: Icon(Icons.mic, size: 28, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: isLoading ? null : translate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6600),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 10.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: isLoading
                    ? SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.w,
                        ),
                      )
                    : Text("Translate", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
