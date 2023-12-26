import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Uddhar extends StatefulWidget {
  final VoidCallback openDrawer;

  const Uddhar({Key? key, required this.openDrawer}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _Uddhar createState() => _Uddhar();
}

class _Uddhar extends State<Uddhar> {
  double _fsizeMangal = 20;

  double _fontSize = 20;
  final double _baseFontSize = 20;
  double _fontScale = 1;
  double _baseFontScale = 1;

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

      if (kDebugMode) {
        print('fontchange $_fsizeMangal');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              backgroundColor: Colors.orange[400],
              leading: GestureDetector(
                  onTap: () {
                    widget.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu, // add custom icons also
                  )),
              title: const Text('घोरकष्टोद्धरणस्तोत्रम्',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Varun')),
              actions: <Widget>[
                const Icon(Icons.format_size),
                IconButton(
                  icon: const Icon(Icons.add_box),
                  tooltip: 'increase by 1',
                  onPressed: () {
                    changeFont(_fsizeMangal + 1);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.indeterminate_check_box),
                  tooltip: 'Decrease by 1',
                  onPressed: () {
                    if (kDebugMode) {
                      print(_fsizeMangal - 1);
                    }
                    changeFont(_fsizeMangal - 1);
                  },
                ),
              ]),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: <Widget>[
              Text(
                  'श्रीपाद श्री वल्लभ त्वं सदैव, श्रीदत्तास्मान पाहि देवाधिदेव ।\nभावग्राह्य क्लेशहारिन सुकीर्ते, घोरात्कष्टात उध्दरास्मान नमस्ते ।।१।।\n\nत्वं नो माता, त्वं पिताप्तो धिपस्त्वं, त्राता योगक्षेमकृत, सदगुरुस्त्वम् ।\nत्वं सर्वस्वं, नः प्रभो विश्र्वमूर्ते, घोरात्कष्टात उध्दरास्मान नमस्ते ।।२।।\n\nपापं तापं व्याधि माधिं च दैन्यं, भीतिं क्लेशं त्वं हराशु त्वदन्यम् ।\nत्रातारं नो वीक्ष ईशास्तजूर्ते, घोरात्कष्टात उध्दरास्मान नमस्ते ।।३।।\n\nनान्यस्त्राता नापि दाता न भर्ता, त्वत्तो देव त्वं शरण्योकहर्ता ।\nकुर्वात्रेयानुग्रहं पूर्णराते, घोरात्कष्टात उध्दरास्मान नमस्ते ।।४।।\n\nधर्मे प्रीतिं सन्मतिं देवभक्तिं, सत्संगाप्तिं देहि भुक्तिं च मुक्तिम् ।\nभावासक्तिं चाखिलानन्दमूर्ते, घोरात्कष्टात उध्दरास्मान नमस्ते ।।५।।\n\nश्र्लोक पंचक मेतद्यो लोकमंगल वर्धनम् ।\nप्रपठेन्नियतो भक्त्या स श्रीदत्तप्रियो भवेत् ।।\n\nइति श्रीमद वासुदेवानंद सरस्वती कृतं घोरकष्टोध्दरणस्तोत्रं संपूर्णम् ।।',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
              Text('\n~~ ÞççÇHçço ÞççÇJçuuçYççb®çç pç³çpç³çkçÀçj Dçmççí ~~',
                  style: TextStyle(
                      fontSize: _fsizeMangal,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent[700],
                      fontFamily: 'Varun'),
                  textAlign: TextAlign.center),
            ]),
          ),
        ));
  }
}
