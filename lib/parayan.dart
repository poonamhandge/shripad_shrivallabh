import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
class Parayan extends StatelessWidget {
  final VoidCallback openDrawer;

  const Parayan({Key? key, required this.openDrawer}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: themeProvider.isDarkTheme ? Colors.orange[200] : Colors.orange[400],
          leading: GestureDetector(
              onTap: () {
                openDrawer();
              },
              child: const Icon(
                Icons.menu, // add custom icons also
              )),
          title: const Text('Hççjç³çCç Hç×çÆlç',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Varun')),
          actions: const <Widget>[]),
      body: Padding(
        padding: const EdgeInsets.all(20.00),
        child: ListView(children: <Widget>[
          Text(
              'ÒçLçcç çÆoJçmç : 01 lçí 06 DçO³çç³ç \n\noÓmçjç çÆoJçmç : 07 lçí 12 DçO³çç³ç\n\nçÆlçmçjç çÆoJçmç : 13 lçí 18 DçO³çç³ç\n\n®ççÌLçç çÆoJçmç : 19 lçí 22 DçO³çç³ç\n\nHçç®çJçç çÆoJçmç : 23 lçí 34 DçO³çç³ç\n\nmçnçJçç çÆoJçmç  : 35 lçí 42 DçO³çç³ç\n\nmççlçJçç çÆoJçmç : 43 lçí 53 DçO³çç³ç',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
