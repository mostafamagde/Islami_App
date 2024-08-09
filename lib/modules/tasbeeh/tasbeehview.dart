import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:islami/core/app_provider.dart';
import 'package:provider/provider.dart';

class Tasbeehview extends StatefulWidget {
  const Tasbeehview({super.key});

  @override
  State<Tasbeehview> createState() => _TasbeehviewState();
}

class _TasbeehviewState extends State<Tasbeehview> {
  @override
  int duacounter = 0;
  int count = 0;
  double rotate = 2;

  Widget build(BuildContext context) {
    List<String> duaalist = [
      "الله أكبر",
      "لا إله إلا الله",
      "سبحان الله",
      "الحمدلله"
    ];

    var theme = Theme.of(context);
    var provider = Provider.of<Settingprovider>(context);

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: provider.isdark()?const EdgeInsets.only(left: 90): EdgeInsets.only(left: 130),

                child: Image.asset(
                  provider.isdark()
                      ? "assets/icons/head of seb7a dark.png"
                      : "assets/icons/head of seb7a.png",
                  alignment: Alignment.center,

                ),
              ),
              Container(
                padding:provider.isdark()?const EdgeInsets.only(top: 78): const EdgeInsets.only(top: 37),
                child: Transform.rotate(
                  angle: rotate,
                  child: Image.asset(
                    provider.isdark()
                        ? "assets/icons/body of seb7a dark.png"
                        : "assets/icons/body of seb7a.png",


                  ),
                ),
              ),

            ],
          ),

          const SizedBox(
            height: 20,
          ),
          Text(
            "عددالتسبيحات",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 69,
            height: 81,
            decoration: BoxDecoration(
              color: provider.isdark()
                  ? const Color(0xFF141A2E).withOpacity(.57)
                  : const Color(0xFFB7935F).withOpacity(.57),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  count.toString(),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
              count++;
              rotate++;
              if (count == 32) {
                count = 0;
                duacounter++;

                if (duacounter == duaalist.length) {
                  duacounter = 0;
                }
              }
              if (rotate == 10) rotate = 1;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  provider.isdark() ? theme.primaryColor : theme.primaryColor,
              fixedSize: const Size(168, 51),
            ),
            child: Text(
              duaalist[duacounter],
              style: provider.isdark()
                  ? theme.textTheme.bodyMedium?.copyWith(color: Colors.black)
                  : theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
