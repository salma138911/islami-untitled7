import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/providers/settings_provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  double angle = 0.0;

  int currentIndex = 0;
  int counter = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: mediaQuery.height * 0.34,

            /// TODO Edit on Image Header
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    provider.isDarkMode()
                        ? "assets/images/head_sebha_dark.png"
                        : "assets/images/head_sebha_logo.png",
                    height: mediaQuery.height * 0.1,
                  ),
                  left: mediaQuery.width * 0.46,
                ),
                Positioned(
                  top: 55,
                  left: mediaQuery.width * 0.23,
                  child: GestureDetector(
                    onTap: () {
                      onClick();
                    },
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        provider.isDarkMode()
                            ? "assets/images/body_sebha_dark.png"
                            : "assets/images/body_sebha_logo.png",
                        height: mediaQuery.height * 0.26,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('عدد التسبيحات', style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 30),
          Container(
            width: 70,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              counter.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: 140,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              azkar[currentIndex],
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  onClick() {
    setState(() {
      counter++;
      angle--;
      if (counter == 100) {
        currentIndex++;
        counter = 0;
      }
      if (currentIndex > azkar.length - 1) {
        currentIndex = 0;
      }
    });
  }
}
