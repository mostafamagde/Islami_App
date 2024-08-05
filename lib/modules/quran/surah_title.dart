import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/application_theme_manager.dart';

class SurahTitle extends StatelessWidget {
  const SurahTitle(
      {super.key, required this.getSurahNumber, required this.getSurahTitle});

  final String getSurahTitle;
  final String getSurahNumber;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            getSurahNumber,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        const SizedBox(
          height: 38,
          child: VerticalDivider(
            color: ApplicationThemeManager.primarycolor,
          ),
        ),
        Expanded(
          child: Text(
            getSurahTitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
