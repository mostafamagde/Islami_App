import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:islami/core/app_provider.dart';
import 'package:islami/layout/layout_view.dart';
import 'package:provider/provider.dart';

class Splash_view extends StatefulWidget {
  const Splash_view({super.key});

  static const String routename = "/";

  @override
  State<Splash_view> createState() => _Splash_viewState();
}

class _Splash_viewState extends State<Splash_view> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, Home_view.routename);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Settingprovider>(context);
    return Image.asset(
      provider.getsplash(),
      fit: BoxFit.cover,
    );
  }
}
