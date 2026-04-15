import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultCard extends StatelessWidget {
  final String language;
  final String translatedText;

  const ResultCard({
    super.key,
    required this.language,
    required this.translatedText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                language,
                style: TextStyle(
                  color: Color(0xFF003366),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              Icon(Icons.volume_up, color: Color(0xFF003366)),
            ],
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Text(
              translatedText,
              style: TextStyle(fontSize: 16.sp, ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.copy, color: Color(0xFF003366)),
              SizedBox(width: 20.w),
              Icon(Icons.share, color: Color(0xFF003366)),
              SizedBox(width: 20.w),
              Icon(Icons.star_border, color: Color(0xFF003366)),
            ],
          ),
        ],
      ),
    );
  }
}
