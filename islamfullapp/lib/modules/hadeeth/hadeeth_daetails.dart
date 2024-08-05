import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_provider.dart';
import 'hadeethview.dart';

class hadeethdetails extends StatelessWidget {
  const hadeethdetails({super.key});

  static const String route = "hadeethdetails";

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as Hadeethdata;
    var media = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var provider = Provider.of<Settingprovider>(context);

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
            style: theme.textTheme.titleLarge,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
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
                    " ${data.title}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: provider.isdark()
                          ? const Color(0xFFFACC1D)
                          : const Color(0xFF242424),
                    ),
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    data.text,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: provider.isdark()
                          ? const Color(0xFFFACC1D)
                          : const Color(0xFF242424),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  itemCount: data.text.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
