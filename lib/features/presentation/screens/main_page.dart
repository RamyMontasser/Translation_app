import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translation_app/features/presentation/screens/camera_page.dart';
import 'package:translation_app/features/presentation/screens/chat_page.dart';
import 'package:translation_app/features/presentation/screens/favourite_page.dart';
import 'package:translation_app/features/presentation/screens/history_page.dart';
import 'package:translation_app/features/presentation/screens/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;

  final List<Widget> _screens = [
    ChatPage(),
    CameraPage(),
    HomePage(),
    HistoryPage(),
    FavouritePage(),
  ];

  Widget menuItem(IconData icon, String title,) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: !Navigator.canPop(context)
          ? Drawer(
              backgroundColor: Colors.white,
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                    children: [
                      Image.asset('assets/translate.png'),
                        SizedBox(height: 10.h),
                        Text(
                          "Translate on the Go",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                     ],
                  )),
                   
                  menuItem(Icons.share, "Share App", ),
                  menuItem(Icons.star, "Rate Us",),
                  menuItem(Icons.privacy_tip, "Privacy Policy",),
                  menuItem(Icons.feedback, "Feedback",),
                ],
              ),
            )
          : null,
      body: IndexedStack(index: _selectedIndex, children: _screens),

      bottomNavigationBar: customBottomNav(),
    );
  }

  Widget customBottomNav() {
    return BottomAppBar(
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(0, Icons.mic, "Chat"),
          _navItem(1, Icons.camera_alt, "Camera"),
          GestureDetector(
            onTap: () => setState(() => _selectedIndex = 2),
            child: Container(
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: Color(0xFF003366),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(alpha: 70),
                    blurRadius: 3,
                    offset: Offset(0, 2)
                  ),
                ],
              ),
              child: Icon(Icons.translate, color: Colors.white, size: 28),
            ),
          ),
          _navItem(3, Icons.history, "History"),
          _navItem(4, Icons.star_border, "Favourite"),
        ],
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isSelected ? 24.sp : 22.sp,
            color: isSelected ? Color(0xFF003366) : null,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: isSelected ? 14.sp : 12.sp,
              color: isSelected ? Color(0xFF003366) : null,
            ),
          ),
          isSelected
              ? Container(width: 35.w, height: 2.h, color: Color(0xFF003366))
              : SizedBox(),
        ],
      ),
    );
  }
}
