import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hadeeth_daetails.dart';

class Hadeetview extends StatefulWidget {
  Hadeetview({super.key});

  @override
  State<Hadeetview> createState() => _HadeetviewState();
}

class _HadeetviewState extends State<Hadeetview> {
  List<Hadeethdata> hadeethlist = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (hadeethlist.isEmpty) readhadeeth();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/icons/hadith_header.png",
          scale: .85,
        ),
        const Divider(),
        Text(
          "الاحاديث",
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const Divider(),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, hadeethdetails.route,
                  arguments: hadeethlist[index]);
            },
            child: Text(
              hadeethlist[index].title,
              textAlign: TextAlign.center,
            ),
          ),
          itemCount: hadeethlist.length,
        ))
      ],
    );
  }

  Future<void> readhadeeth() async {
    String allhadeethdata =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allhadeeth = allhadeethdata.split('#');

    for (int i = 0; i < allhadeeth.length; i++) {
      String hadeeth = allhadeeth[i].trim();
      int titlelength = hadeeth.indexOf("\n");

      String hadeethtitle = hadeeth.substring(0, titlelength);
      String hadeethtext = hadeeth.substring(titlelength + 1);

      Hadeethdata data = Hadeethdata(
        title: hadeethtitle,
        text: hadeethtext,
      );
      hadeethlist.add(data);
    }
    setState(() {});
  }
}

class Hadeethdata {
  final String title;
  final String text;

  Hadeethdata({required this.title, required this.text});
}
