import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/app_provider.dart';
//dsvcsdvvdfv
class Settingview extends StatefulWidget {
  const Settingview({super.key});

  @override
  State<Settingview> createState() => _SettingviewState();
}

class _SettingviewState extends State<Settingview> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<Settingprovider>(context);
    var language = AppLocalizations.of(context)!;

    List<String> langs = [
      "English",
      "عربى",
    ];
    List<String> themes = [
      language.light,
      language.dark,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 65,
        ),
        Text(
          language.language,
          style: theme.textTheme.bodyLarge,
        ),
        CustomDropdown<String>(
          decoration: CustomDropdownDecoration(
            closedFillColor:
                provider.isdark() ? Color(0xFF141A2E) : Colors.white,
            expandedFillColor:
                provider.isdark() ? Color(0xFF141A2E) : Colors.white,
            expandedSuffixIcon: Icon(
              Icons.arrow_drop_up_outlined,
              color: provider.isdark() ? Color(0xFFFACC1D) : Colors.white,
            ),
            closedSuffixIcon: Icon(
              Icons.arrow_drop_down_outlined,
              color: provider.isdark() ? Color(0xFFFACC1D) : Colors.white,
            ),
          ),
          items: langs,
          initialItem: provider.selectedlanguage == "en" ? langs[0] : langs[1],
          onChanged: (value) {
            if (value == "English") provider.changelanguage("en");
            if (value == "عربى") provider.changelanguage("ar");
            log('changing value to: $value');
          },
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          language.theme,
          style: theme.textTheme.bodyLarge,
        ),
        CustomDropdown<String>(
          items: themes,
          initialItem:
              provider.currentmode == ThemeMode.light ? themes[0] : themes[1],
          onChanged: (value) {
            if (value == language.light) provider.changemode(ThemeMode.light);
            if (value == language.dark) provider.changemode(ThemeMode.dark);
            log('changing value to: $value');
          },
          decoration: CustomDropdownDecoration(
            closedFillColor:
                provider.isdark() ? const Color(0xFF141A2E) : Colors.white,
            expandedFillColor:
                provider.isdark() ? const Color(0xFF141A2E) : Colors.white,
            expandedSuffixIcon: Icon(
              Icons.arrow_drop_up_outlined,
              color: provider.isdark() ? const Color(0xFFFACC1D) : Colors.white,
            ),
            closedSuffixIcon: Icon(
              Icons.arrow_drop_down_outlined,
              color: provider.isdark() ? const Color(0xFFFACC1D) : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
