import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/globals.dart';
import 'package:quran_app/tabs/hijb_tab.dart';
import 'package:quran_app/tabs/page_tab.dart';
import 'package:quran_app/tabs/para_tab.dart';
import 'package:quran_app/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: _greeting(),
                    ),
                    SliverAppBar(
                      pinned: true,
                      elevation: 0,
                      backgroundColor: background,
                      automaticallyImplyLeading: false,
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(0),
                        child: _tab(),
                      ),
                    ),
                  ],
              body: TabBarView(children: [
                SurahTab(),
                ParaTab(),
                PageTab(),
                HijbTab(),
              ])),
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  TabBar _tab() {
    return TabBar(
        unselectedLabelColor: text,
        indicatorColor: primary,
        indicatorWeight: 3,
        labelColor: Colors.white,
        tabs: [
          _tabItem(label: 'Surah'),
          _tabItem(label: 'Para'),
          _tabItem(label: 'Page'),
          _tabItem(label: 'Hijb'),
        ]);
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
              fontSize: 18, fontWeight: FontWeight.w500, color: text),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Bintoro Linkebin',
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: 24,
        ),
        _lastRead()
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0,
                    0.6,
                    1
                  ],
                  colors: [
                    Color(0xFFDF98FA),
                    Color(0xFFB070FD),
                    Color(0xFF9055FF)
                  ])),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/svgs/quran.svg')),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/book.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Last Read',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Al-Fatihah',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Ayat No: 1',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _bottomBarItem(icon: 'assets/svgs/quran-icon.svg', label: 'Quran'),
          _bottomBarItem(icon: 'assets/svgs/lamp-icon.svg', label: 'Tips'),
          _bottomBarItem(icon: 'assets/svgs/pray-icon.svg', label: 'Prayer'),
          _bottomBarItem(icon: 'assets/svgs/doa-icon.svg', label: 'Doa'),
          _bottomBarItem(
              icon: 'assets/svgs/bookmark-icon.svg', label: 'Bookmark'),
        ],
        backgroundColor: gray,
      );

  BottomNavigationBarItem _bottomBarItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(text, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(icon,
              colorFilter: ColorFilter.mode(primary, BlendMode.srcIn)),
          label: label);

  AppBar _appBar() {
    return AppBar(
      backgroundColor: background,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svgs/menu-icon.svg')),
          SizedBox(
            width: 24,
          ),
          Text('Quran App',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const Spacer(
            flex: 1,
          ),
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svgs/search-icon.svg')),
        ],
      ),
    );
  }
}
