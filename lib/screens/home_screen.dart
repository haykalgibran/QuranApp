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
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: _greeting(),
                ),
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  backgroundColor: background,
                  automaticallyImplyLeading: false,
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(0),
                    child: TabBar(
                      tabs: [
                        Tab(child: Text('Surah')),
                        Tab(child: Text('Para')),
                        Tab(child: Text('Page')),
                        Tab(child: Text('Hijb')),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Container(), // Replace with your widget for Surah tab
                Container(), // Replace with your widget for Juz tab
                Container(), // Replace with your widget for Hafalan tab
                Container(), // Replace with your widget for Bookmark tab
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _greeting() {
    return Column(
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
        const SizedBox(height: 4),
        Text(
          'Haykal Gibran Hakim',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        _LastRead(),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Stack _LastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [Color(0xFFDF98FA), Color(0xFF9055FF)],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset('assets/svgs/quran.svg'),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/book.svg'),
                  const SizedBox(width: 8),
                  Text(
                    'Last Read',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Al-Fatihah',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Ayat No.1',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
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
            const SizedBox(width: 24),
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

  BottomNavigationBarItem _bottomBarItem({
    required String icon,
    required String label,
  }) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          // ignore: deprecated_member_use
          color: text,
        ),
        activeIcon: SvgPicture.asset(
          icon,
          // ignore: deprecated_member_use
          color: purple,
        ),
        label: label,
      );
}
