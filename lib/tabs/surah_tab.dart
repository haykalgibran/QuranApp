import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_quran/models/surah.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getSurahList() async {
    String data = await rootBundle.loadString('assets/datas/list-surah.json');
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
        future: _getSurahList(),
        initialData: [],
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: (context, index) =>
                  _surahItem(surah: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) => Container(),
              itemCount: snapshot.data!.length);
        }));
  }

  Container _surahItem({required Surah surah}) => Container(
        child: Text(
          'OKE',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      );
}
