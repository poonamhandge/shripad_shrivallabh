import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_provider.dart';

class Abhay extends StatefulWidget {
  final VoidCallback openDrawer;

  const Abhay({Key? key, required this.openDrawer}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _Abhay createState() => _Abhay();
}

class _Abhay extends State<Abhay> {
  double _fsizeMangal = 20;
  double _fontSize = 20;
  final double _baseFontSize = 20;
  double _fontScale = 1;
  double _baseFontScale = 1;
  late ThemeData currentTheme;
  @override
  void initState() {
    if (kDebugMode) {
      print('init');
    }
    super.initState();
    _loadFont();
  }

  _loadFont() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    setState(() {
      if (prefs2.getDouble('fsizeMangal') == null) {
        _fsizeMangal = 20;
        prefs2.setDouble('fsizeMangal', _fsizeMangal);
      } else {
        _fsizeMangal = prefs2.getDouble('fsizeMangal') ?? 0;
      }
    });
  }

  changeFont(double fs) async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    setState(() {
      if (fs >= 10 && fs <= 60) {
        _fsizeMangal = fs;
        prefs2.setDouble('fsizeMangal', _fsizeMangal);
        _fontScale = _fsizeMangal / _baseFontSize;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
        onScaleStart: (ScaleStartDetails scaleStartDetails) {
          _baseFontScale = _fontScale;
        },
        onScaleUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
          // don't update the UI if the scale didn't change
          if (scaleUpdateDetails.scale == 1.0) {
            return;
          }
          setState(() {
            _fontScale =
                (_baseFontScale * scaleUpdateDetails.scale).clamp(0.5, 3.0);
            _fontSize = _fontScale * _baseFontSize;
            if (kDebugMode) {
              print("object $_fontSize");
            }
            changeFont(_fontSize);
          });
        },
        child: Scaffold(
          appBar: AppBar(
              // backgroundColor: Colors.orange[400],
              backgroundColor: themeProvider.isDarkTheme ? Colors.orange[200] : Colors.orange[400],
              leading: GestureDetector(
                  onTap: () {
                    widget.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu, // add custom icons also
                  )),
              title: const Text('अभय वचने',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Varun')),
              actions: <Widget>[
                const Icon(Icons.format_size),
                IconButton(
                  icon: const Icon(Icons.add_box),
                  tooltip: 'अक्षरांचा आकार वाढवा ',
                  onPressed: () {
                    changeFont(_fsizeMangal + 1);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.indeterminate_check_box),
                  tooltip: 'अक्षरांचा आकार कमी करा',

                  onPressed: () {
                    if (kDebugMode) {
                      print(_fsizeMangal - 1);
                    }
                    changeFont(_fsizeMangal - 1);
                  },
                ),
              ]),

          body:

          Padding(
            padding: const EdgeInsets.all(16.0),

            child: ListView(children: <Widget>[

              Text(
                  '1) माझ्या चरित्राचे पारायण होत असलेल्या प्रत्येक स्थळी मी सूक्ष्म रूपात असतो.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),

              const SizedBox(
                height: 15,
              ),
              Text(
                  '2) मनो वाक् काय कर्मणा मला समर्पित असलेल्या साधकांचा मी डोळयात तेल घालून संभाळ करतो.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '3) श्री पीठीकापुरम मध्ये मी प्रतिदिन मध्याह्न काळी भिक्षा स्विकारतो. माझे येणे दैव रहस्य आहे.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '4) सतत माझे ध्यान करणाऱ्यांचे कर्म, ते कितीही जन्मजन्मांतरीचे असले तरी मी ते भस्म करून टाकतो.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '5) (अन्न हेच परब्रह्म-अन्नमोरामचंद्राय) अन्नासाठी तळमळणाऱ्यांना अन्न दिल्यास, मी त्या दात्यास नक्कीच प्रसन्न होतो.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '6) मी श्रीपाद श्रीवल्लभ आहे. माझ्या भक्तांच्या घरी महालक्ष्मी तिच्या संपूर्ण कलेने प्रकाशित असते.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '7) तुमचे अंत:करण शुध्द असले तर माझा कटाक्ष सदैव तुमच्यावर असतो.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '8) तुम्ही ज्या देवता स्वरूपाची आराधना कराल, ज्या सद्गुरुंची उपासना कराल ती मलाचप्राप्त होईल.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '9) तुम्ही केलेली प्रार्थना मलाच पोचते. माझा अनुग्रह/आशिर्वाद तुम्ही आराधिलेल्या देवतेच्या स्वरूपाद्वारे, तुमच्या सद्गुरुद्वारे तुम्हाला प्राप्त होतो.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '10) श्रीपाद श्रीवल्लभ म्हणजे केवळ नामरूपच नाही. सकल देवता स्वरूप समस्त शक्तीचे अंश मिळून माझे विराट स्वरूप, अनुष्ठानाद्वारेच तुम्हाला समजू शकेल.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '11) श्रीपाद श्रीवल्लभ हा माझा संपूर्ण योग अवतार आहे. जे महायोगी, महासिध्दपुरुष माझे नित्य ध्यान करतात ते माझेच अंश आहेत.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '12) तुम्ही माझी आराधना केली तर मी तुम्हाला धर्ममार्गाचा, कर्म मार्गाचा बोध करतो. तुम्ही पतित होऊ नये म्हणून सदैव मी तुमचे रक्षण करतो.',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text('\n~~ ÞççÇHçço ÞççÇJçuuçYççb®çç pç³çpç³çkçÀçj Dçmççí ~~',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
            ]),
          ),

        ));
  }
}
