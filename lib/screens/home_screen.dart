import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_quran/screens/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assalamualaikum',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: text,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Haykal Gibran Hakim',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svgs/menu-icon.svg'),
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              'Quran App',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svgs/search-icon.svg'),
            ),
          ],
        ),
      );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color(0xFF121931),
        items: [
          _bottomBarItem(icon: 'assets/svgs/menu1.svg', label: 'Quran'),
          _bottomBarItem(icon: 'assets/svgs/menu2.svg', label: 'Tips'),
          _bottomBarItem(icon: 'assets/svgs/menu3.svg', label: 'Prayer'),
          _bottomBarItem(icon: 'assets/svgs/menu4.svg', label: 'Doa'),
          _bottomBarItem(icon: 'assets/svgs/menu5.svg', label: 'Bookmark'),
        ],
      );

  BottomNavigationBarItem _bottomBarItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          color: text,
        ),
        activeIcon: SvgPicture.asset(
          icon,
          color: purple,
        ),
        label: label,
      );
}
