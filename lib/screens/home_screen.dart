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
                _buildSliverAppBar(),
              ];
            },
            body: const TabBarView(
              children: [
                SurahTab(), // Replace with your widget for Surah tab
                ParaTab(), // Replace with your widget for Juz tab
                PageTab(), // Replace with your widget for Hafalan tab
                HijbTab(), // Replace with your widget for Bookmark tab
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: background,
      elevation: 0,
      pinned: true,
      floating: false,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0), // Adjust height as needed
        child: _tab(),
      ),
    );
  }

  TabBar _tab() {
    return TabBar(
      unselectedLabelColor: text,
      labelColor: Colors.white,
      indicatorColor: purple,
      indicatorWeight: 3,
      tabs: [
        _tabItem(label: "Surah"),
        _tabItem(label: "Para"),
        _tabItem(label: "Page"),
        _tabItem(label: "Hijb"),
      ],
    );
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
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
        _lastRead(),
      ],
    );
  }

  Stack _lastRead() {
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

// Placeholder widgets for each tab
class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Surah Tab Content',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class ParaTab extends StatelessWidget {
  const ParaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Para Tab Content',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class PageTab extends StatelessWidget {
  const PageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Page Tab Content',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class HijbTab extends StatelessWidget {
  const HijbTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hijb Tab Content',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
