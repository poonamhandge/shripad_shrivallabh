import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SiddhaMangal extends StatefulWidget {
  final VoidCallback openDrawer;

  const SiddhaMangal({Key? key, required this.openDrawer}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SiddhaMangalState createState() => _SiddhaMangalState();
}

class _SiddhaMangalState extends State<SiddhaMangal> {
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
              title: const Text('çÆmç×cçbiç}mlççí\$ç',
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
                      if (kDebugMode) {
                        if (kDebugMode) {
                          print(_fsizeMangal - 1);
                        }
                      }
                    }
                    changeFont(_fsizeMangal - 1);
                  },
                ),
              ]),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: <Widget>[
              Text(
                  '1) ÞççÇ cçovçblç ÞççÇçÆJçYçáøççÇlç DçHHç} }#cççÇ vçjçEmçn jçpçç ~\n \tpç³ç çÆJçpç³ççÇYçJç, çÆoçqiJçpç³ççÇYçJç, ÞççÇcçoKçb[ ÞççÇ çÆJçpç³ççÇYçJç ~~\n \t\n \t2) ÞççÇ çÆJçÐççOçjçÇ jçOçç mçájíKçç ÞççÇ jçKççÇOçj ÞççÇHççoç ~\n \tpç³ç çÆJçpç³ççÇYçJç, çÆoçqiJçpç³ççÇYçJç, ÞççÇcçoKçb[ ÞççÇ çÆJçpç³ççÇYçJç ~~\n \t\n \t3) cççlçç mçácçlççÇ Jççlmçu³ççcçÉlç HççÆjHççíçÆøçlç pç³ç ÞççÇHççoç ~\n \tpç³ç çÆJçpç³ççÇYçJç, çÆoçqiJçpç³ççÇYçJç, ÞççÇcçoKçb[ ÞççÇ çÆJçpç³ççÇYçJç ~~\n \t\n \t4) mçl³ç\$ç+øççÇéçjoáçÆnlççvçbovç yççHçvçç®çç³ç&vçálç ÞççÇ®çjCçç ~\n \tpç³ç çÆJçpç³ççÇYçJç, çÆoçqiJçpç³ççÇYçJç, ÞççÇcçoKçb[ ÞççÇ çÆJçpç³ççÇYçJç ~~\n \t\n \t5) mçççÆJç\$ç kçÀç"kçÀ®ç³çvç HçáC³çHçÀ}ç YççjÜçpç \$ç+øççÇ iççí\$ç mçbYçJçç ~\n \tpç³ç çÆJçpç³ççÇYçJç, çÆoçqiJçpç³ççÇYçJç, ÞççÇcçoKçb[ ÞççÇ çÆJçpç³ççÇYçJç ~~\n \t\n \t6) oçÌ ®ççÌHççlççÇ oíJç }#cççÇiçCç mçbK³çç yççíçÆOçlç ÞççÇ®çjCçç ~\n \tpç³ç çÆJçpç³ççÇYçJç, çÆoçqiJçpç³ççÇYçJç, ÞççÇcçoKçb[ ÞççÇ çÆJçpç³ççÇYçJç ~~\n \t\n \t7) HçáC³çªçÆHçCççÇ jçpçcççbyççmçálç içYç&HçáC³çHçÀ}mçbpççlçç ~\n \tpç³ç çÆJçpç³ççÇYçJç, çÆoçqiJçpç³ççÇYçJç, ÞççÇcçoKçb[ ÞççÇ çÆJçpç³ççÇYçJç ~~\n \t\n \t8) mçácçlççÇvçbovç vçjnjçÇvçbovç oÊçoíJç ÒçYçÓ ÞççÇHççoç ~\n \tpç³ç çÆJçpç³ççÇYçJç, çÆoçqiJçpç³ççÇYçJç, ÞççÇcçoKçb[ ÞççÇ çÆJçpç³ççÇYçJç ~~\n \t\n \t9) HççÇçÆ"kçÀçHçáj çÆvçl³ççÆJçnçjç cçOçácçlççÇoÊçç cçbiç}ªHçç ~\n \tpç³ç çÆJçpç³ççÇYçJç, çÆoçqiJçpç³ççÇYçJç, ÞççÇcçoKçb[ ÞççÇ çÆJçpç³ççÇYçJç ~~',
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
