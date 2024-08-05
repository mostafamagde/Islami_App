import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_provider.dart';
import 'package:islami/modules/quran/quranview.dart';
import 'package:provider/provider.dart';

class QuranVerses extends StatefulWidget {
  QuranVerses({super.key});

  static const String route = "versesroute";

  @override
  State<QuranVerses> createState() => _QuranVersesState();
}

class _QuranVersesState extends State<QuranVerses> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as Senddata;
    var media = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var provider = Provider.of<Settingprovider>(context);
    if (surah.isEmpty) readdata(data.number.toString());
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            provider.getbackground(),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "إسلامى",
            style: theme.textTheme.titleLarge?.copyWith(),
          ),
          iconTheme: const IconThemeData(color: Colors.white),

          //  backgroundColor: Colors.black,
        ),
        body: Container(
          margin:
              const EdgeInsets.only(bottom: 98, left: 29, right: 29, top: 25),
          padding: const EdgeInsets.only(left: 29, right: 29, top: 25),
          height: media.height,
          width: media.width,
          decoration: BoxDecoration(
            color: provider.isdark()
                ? const Color(0xFF141A2E).withOpacity(.8)
                : const Color(0xFFF8F8F8).withOpacity(.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " سورة ${data.name}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFFFACC1D),
                    ),
                  ),
                  const SizedBox(width: 34),
                  ImageIcon(
                    const AssetImage(
                        "assets/icons/Icon awesome-play-circle.png"),
                    color: provider.isdark()
                        ? const Color(0xFFFACC1D)
                        : const Color(0xFF242424),
                    size: 27.2,
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    verses[index],
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: provider.isdark()
                          ? const Color(0xFFFACC1D)
                          : const Color(0xFF242424),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  itemCount: verses.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String surah = "";
  List<String> verses = [];

  Future<void> readdata(String index) async {
    surah = await rootBundle.loadString("assets/files/$index.txt");
    verses = surah.split("/n");
    setState(() {});
  }
}
