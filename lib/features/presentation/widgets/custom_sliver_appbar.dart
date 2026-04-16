import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppbar extends StatelessWidget {
  const CustomSliverAppbar({super.key, this.pinned, required this.title});
  final bool? pinned;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Navigator.canPop(context)? IconButton(
    icon: const Icon(Icons.arrow_back_ios_new_rounded), 
    onPressed: () => Navigator.pop(context),
  ): null,
      pinned: pinned?? false, 
      surfaceTintColor: Colors.white,
      expandedHeight: 50.h,
      foregroundColor: Colors.white,
      
      title: Text(title),
      
      backgroundColor: Color(0xFF003366),
    );
  }
}
