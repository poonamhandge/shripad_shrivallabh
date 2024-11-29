import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class Arti extends StatefulWidget {
  final VoidCallback openDrawer;

  const Arti({super.key, required this.openDrawer});
  @override
  // ignore: library_private_types_in_public_api
  _Arti createState() => _Arti();
}

class _Arti extends State<Arti> {
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
              backgroundColor: themeProvider.isDarkTheme ? Colors.orange[200] : Colors.orange[400],
              leading: GestureDetector(
                  onTap: () {
                    widget.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu, // add custom icons also
                  )),
              title: const Text('आरती',
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
                  '॥श्री गणेशायनम:॥ॐद्रांदत्तात्रेयायनमः॥',
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
                  '॥श्री गुरुवे नम:॥ श्रीपादराजं शरणं प्रपद्ये ॥ ',
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
                  'गोदातट पवित्र पिठीकापूर स्थान ।\n सगुण रूपाने करिसी जगताला धन्य ।।\n आपळ - सुमती - बापन्नासी भाससी तू सान ।\n निर्गुण रूपे भूषविसी ब्रह्मांडाचे आसन ।।\n जयदेव जयदेव जय सदगुरु दत्ता हो श्री सदगुरु दत्ता ।\n श्रीपाद श्रीवल्लभ परब्रह्म रूपा जयदेव जयदेव ।।१।।',
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
                  'संकल्पासी कथूनी तू कार्यासी धरिसी ।\n मुनिजन - साधू - भक्ता निर्भय तू करिसी ।।\n खल - कली - कामी जनांही तू उद्धरसी ।\n अभिनव लीले पातक कर्मा नाशविसी ।। जयदेव ० ।।२।।',
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
                  'अंध पंगु भ्रात्यांना आरोग्य ते दिधले ।\n कुरवपुरासी जाऊनी मुनिजन उद्धरिले ।।\n दर्शन मात्रे तुझिया अनेका संतत्व ते फळले । \nप्रिती तुजवर जडुनि कर्मांचे बंधन हे जळले ।। जयदेव ० ।।३।।',
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
                  'नामानंदासी दाखविले चांडाळाचे रूप । \n वल्लभदासासी आणिले अरण्यातून सुखरूप ।। \n लोहकारासी रक्षुनी धरिसी गाडीवानाचे रूप । \n निमिषमात्रे करिसी रजकाचा तू नृप ।। जयदेव ० ।।४।।',
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
                  'ब्रह्मा - विष्णू - महेश्वरांचा तू अनघा अवतार । \n निर्गुण ब्रह्म सनातनाचा अनंत आधार ।। \n नेती-नेती म्हणता पुढती पडले समस्त श्रुतीसार ।। \n दत्तदासावरी असावा तव कृपेचा कर ।। जयदेव ० ।।५।।',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),

              Text('॥ अवधूत चिंतन श्री गुरुदेव दत्त ॥',
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
