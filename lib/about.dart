import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override

  Widget build(BuildContext context) {
    late ThemeData currentTheme;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('श्रीपाद श्रीवल्लभ चरित्रामृत',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Varun')),
          backgroundColor: themeProvider.isDarkTheme ? Colors.orange[200] : Colors.orange[400],
          actions: const <Widget>[]),
      body: Padding(
        padding: const EdgeInsets.all(30.00),
        child: ListView(shrinkWrap: true, children: <Widget>[
          Text('ÞççÇHçço ÞççÇJçuuçYç ®ççÆj\$ççcçÉlç',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
          Text('\n\ncçÓ} iç´bLç j®ççÆ³çlçç',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
          Text(
              'ÞççÇ MçbkçÀj Yçì\n(ÞççÇ ÞççÇHçço ÞççÇJçuuçYççb®çí mçcçkçÀç}çÇvç)',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
          Text('\n\nMçbkçÀjYçì çÆ}çÆKçlç lçí}áiçá Òçlç GHç}yOç kçÀªvç çÆo}ç',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
          Text('ÞççÇ cçuuççoçÇ iççíçEJço oçÇçÆ#çlçá}á, YççÇcççJçjcçd.',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
          Text('\n\ncçjç"çÇ DçvçáJçço',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
          Text('ÞççÇ nçÆjYççT pççíMççÇ çÆvçìÓjkçÀj (YççT cçnçjçpç), nÌojçyçço',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
