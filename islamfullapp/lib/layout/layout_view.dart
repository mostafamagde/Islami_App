import 'package:flutter/material.dart';
import 'package:islami/modules/hadeeth/hadeethview.dart';
import 'package:islami/modules/quran/quranview.dart';
import 'package:islami/modules/radio/radioview.dart';
import 'package:islami/modules/setting/settingview.dart';
import 'package:islami/modules/tasbeeh/tasbeehview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../core/app_provider.dart';

class Home_view extends StatefulWidget {
  const Home_view({super.key});

  static String routename = "home";

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  @override
  int currentindex = 0;
  static  List<Widget> screens = [
     const Quranview(),
    Hadeetview(),
    const Tasbeehview(),
    const Radioview(),
    const Settingview(),

  ];

  Widget build(BuildContext context) {
    var language =AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var provider =Provider.of<Settingprovider>(context);

    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getbackground(),),fit:BoxFit.cover

        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            language.islami,
            style: theme.textTheme.titleLarge,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (value) {
            currentindex = value;
            setState(() {});
          },
          items:  [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage("assets/icons/quran.png"),
              ),
              label: language.quran,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage("assets/icons/hadeeth.png"),
              ),
              label: language.hadeeth,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage("assets/icons/sebha.png"),
              ),
              label: language.tasbeeh,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage("assets/icons/radio.png"),
              ),
              label: language.radio,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: language.setting,
            ),
          ],
        ),
         body: screens[currentindex],
      ),
    );
  }
}
