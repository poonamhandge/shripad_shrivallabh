import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';






import 'todo.dart';



class DetailScreen extends StatefulWidget {
  // Declare a field that holds the Todo.
  final Todo todo;


  const DetailScreen({super.key, required this.todo});


  @override
  // ignore: library_private_types_in_public_api
  _DetailScreenState createState() => _DetailScreenState();

}

class _DetailScreenState extends State<DetailScreen> {


  double _fsize = 20;
  double _fontSize = 20;
  final double _baseFontSize = 20;
  double _fontScale = 1;
  double _baseFontScale = 1;
  bool playing = false;
  // LyricsModel lyricModel = LyricsModelBuilder.create().getModel();





  @override
  void initState() {
    super.initState();
    _loadFont();

  }

  _loadFont() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (prefs.getDouble('fsize') == null) {
        _fsize = 20;
        prefs.setDouble('fsize', _fsize);
      } else {
        _fsize = prefs.getDouble('fsize') ?? 0;
      }
    });
  }

  changeFont(double fs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (fs >= 10 && fs <= 60) {
        _fsize = fs;
        prefs.setDouble('fsize', _fsize);
        _fontScale = _fsize / _baseFontSize;
      }
      if (kDebugMode) {
        print('fontchange');
      }
    });
  }


  setBookmark(int mark) async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setInt('bookmarked', mark);
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.

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
                title: Text(widget.todo.title,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Varun')),
                actions: <Widget>[
                  const Icon(Icons.format_size),
                  IconButton(
                    icon: const Icon(Icons.add_box),
                    tooltip: 'increase by 1',
                    onPressed: () {
                      changeFont(_fsize + 1);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.indeterminate_check_box),
                    tooltip: 'Decrease by 1',
                    onPressed: () {
                      changeFont(_fsize - 1);

                    },
                  ),
                ]),
          // backgroundColor: Colors.orange[50],
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[

                  const Text('~~ ÞççÇHççojçpçb MçjCçb ÒçHçÐçí ~~',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                          fontFamily: 'Varun'),
                      textAlign: TextAlign.center),

                  // Image.asset(widget.todo.imageName,
                  //   // Replace with the path to your image asset
                  //   width: 50, // Set the desired width of the image
                  //   height: 50, // Set the desired height of the image
                  //
                  // ),

                  const SizedBox(height: 16),
                  Text(widget.todo.subtitle,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent[700],
                          fontFamily: 'Varun'),
                      textAlign: TextAlign.center),
                  const Text('\n\n'),
                  Text(
                    widget.todo.description,
                    style: TextStyle(fontFamily: 'Varun', fontSize: _fsize),
                    textAlign: TextAlign.justify,


                  ),

                  Text(
                      '\n\n~~ ÞççÇHçço ÞççÇJçuuçYççb®çç pç³çpç³çkçÀçj Dçmççí ~~',
                      style: TextStyle(
                          fontSize: _fsize,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent[700],
                          fontFamily: 'Varun'),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Bookmark This Chapter',
              onPressed: () {
                  setBookmark(int.parse((widget.todo.index).toString()));
              },


              backgroundColor: Colors.orange,
              child: const Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
            ),

        ));
  }



}
