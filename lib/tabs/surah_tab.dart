import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/globals.dart';
import 'package:quran_app/models/surah.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getSurahList() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');
    List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => Surah.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
        future: _getSurahList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  _surahItem(surah: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) => Container());
        });
  }

  Widget _surahItem({required Surah surah}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/svgs/nomor-surah.svg'),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Center(
                    child: Text(
                      "${surah.nomor}",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah.namaLatin,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      surah.tempatTurun.name,
                      style: GoogleFonts.poppins(
                          color: text,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: text,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${surah.jumlahAyat} Ayat",
                      style: GoogleFonts.poppins(
                          color: text,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    )
                  ],
                )
              ],
            )),
            Text(
              surah.nama,
              style: GoogleFonts.amiri(
                  color: primary, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
