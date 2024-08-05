import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_provider.dart';

class Radioview extends StatelessWidget {
  const Radioview({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<Settingprovider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 200,
        ),
        Image.asset("assets/icons/radio_icn.png"),
        Text(
          "إذاعة الفران الكريم",
          style: theme.textTheme.bodyLarge?.copyWith(
              color: provider.isdark() ? Colors.white : Color(0xFF141A2E)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageIcon(
              const AssetImage("assets/icons/Icon metro-next.png"),
              color: provider.isdark()
                  ? const Color(0xFFFACC1D)
                  : Color(0xFFB7935F),
            ),
            ImageIcon(
              const AssetImage("assets/icons/Icon awesome-play.png"),
              color: provider.isdark()
                  ? const Color(0xFFFACC1D)
                  : Color(0xFFB7935F),
            ),
            ImageIcon(
              const AssetImage("assets/icons/Icon metro-next.png"),
              color: provider.isdark()
                  ? const Color(0xFFFACC1D)
                  : Color(0xFFB7935F),
            ),
          ],
        )
      ],
    );
  }
}
