


import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data' as typed_data;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'details.dart';
import 'todo.dart';
import 'theme_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';




class ChapterScreen extends StatefulWidget {
  final List<Todo> todos;
  final VoidCallback openDrawer;


  const ChapterScreen({super.key, required this.todos, required this.openDrawer,});

  @override
  // ignore: library_private_types_in_public_api
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  late SharedPreferences prefs;
  Map<int, bool> readState = {};
  late ThemeData currentTheme;


  @override
  void initState() {
    super.initState();
    // Load the saved read states from SharedPreferences when the screen is created.
    loadReadStates();


    WidgetsBinding.instance.addPostFrameCallback((_) async {
      dialogForShowAudioAppDownload(context);
      await _checkAndShowWelcomeDialog();
    });


  }

  Future<void>dialogForShowAudioAppDownload(BuildContext context) async {
    // Show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'श्रीपाद श्रीवल्लभ चरित्रामृत ऑडिओ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.orange[700],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'आध्यात्मिक ज्ञानाचा अनुभव घ्या! 🌟',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Launch the URL
                  launch(
                      'https://play.google.com/store/apps/details?id=com.staticgsm.shripad_shrivallabh&hl=en&gl=US');
                },
                child: const Text(
                  'डाउनलोड करा: Google Play Store',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        );
      },
    );
  }


  Future<void> _checkAndShowWelcomeDialog() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final String? lastShownDate = prefs.getString('lastWelcomeDialogDate');

    // Show dialog only if it's not shown today
    if (lastShownDate != today) {
      // ignore: use_build_context_synchronously
      await _showWelcomeDialog(context);
      await prefs.setString('lastWelcomeDialogDate', today);
    }
  }
  Future<void> _showWelcomeDialog(BuildContext context) async {
    final GlobalKey repaintBoundaryKey = GlobalKey();

    try {
      // Fetch images from the 'images' folder
      final ListResult imageResult = await FirebaseStorage.instance.ref('images').listAll();

      // Fetch quotes from the 'quotes.json' file in 'quotes' folder
      final Reference quoteFileRef = FirebaseStorage.instance.ref('quotes/data.json');
      final String quoteFileUrl = await quoteFileRef.getDownloadURL();

      final response = await http.get(Uri.parse(quoteFileUrl));
      if (response.statusCode == 200) {
        // Use utf8.decode to correctly decode any non-ASCII characters
        final String decodedBody = utf8.decode(response.bodyBytes);
        final Map<String, dynamic> quoteData = json.decode(decodedBody);
        final List<String> quotes = List<String>.from(quoteData['quotes']);


        if (imageResult.items.isNotEmpty && quotes.isNotEmpty) {
          // Random image
          final randomImageIndex = Random().nextInt(imageResult.items.length);
          final Reference randomImageFile = imageResult.items[randomImageIndex];
          String imageUrl = await randomImageFile.getDownloadURL();

          // Random quote
          final randomQuoteIndex = Random().nextInt(quotes.length);
          String quoteText = quotes[randomQuoteIndex];


          showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.orange[50], // Add your desired color here
                  borderRadius: BorderRadius.circular(15), // Optional: Add rounded corners
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      '॥श्री गुरुवे नम:॥',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.orange[700],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Yatra One', // Optional: Match the quote style
                      ),
                    ),

                    RepaintBoundary(
                      key: repaintBoundaryKey,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            imageUrl,
                            height: 250,
                            width: 1000,
                            fit: BoxFit.contain,
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: const EdgeInsets.all(9.0),
                                child: Text(
                                  quoteText,
                                  style: const TextStyle(
                                    fontFamily: 'Kalam',
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            try {
                              final imageBytes = await _captureImage(repaintBoundaryKey);
                              if (imageBytes != null) {
                                final tempDir = await getTemporaryDirectory();
                                final file = File('${tempDir.path}/shared_image.png');
                                await file.writeAsBytes(imageBytes as List<int>);


                                await Share.shareXFiles(
                                  [XFile(file.path)],
                                  text: 'श्रीपाद श्रीवल्लभ चरित्रामृत ऑडिओ अॅपच्या माध्यमातून आध्यात्मिक ज्ञानाचा अनुभव घ्या! 🌟\nडाउनलोड करा: https://play.google.com/store/search?q=shreepad+shree+vallabh+charitramrut&c=apps',
                                  subject: 'श्रीपाद श्रीवल्लभ चरित्रामृत ऑडिओ',
                                );

                              }
                            } catch (e) {
                              print('Error during sharing: $e');
                            }
                          },

                          icon: const Icon(Icons.share),
                          label: const Text('Share'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent, // Set text and icon color
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close),
                          label: const Text('Close'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.orange[100], // Set text and icon color
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        } else {
          throw Exception("No images or quotes found in the folders.");
        }
      } else {
        throw Exception("Failed to load quotes from Firebase Storage.");
      }
    } catch (e) {
      print("Error: $e");
    }
  }


  Future<typed_data.Uint8List?> _captureImage(GlobalKey repaintBoundaryKey) async {
    try {
      RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 6.0);
      typed_data.ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      print("Capture Error: $e");
      return null;
    }
  }

  void loadReadStates() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < widget.todos.length; i++) {
        readState[i] = prefs.getBool('read_$i') ?? false;
      }
    });
  }
  void toggleTheme() {
    setState(() {
      currentTheme = currentTheme.brightness == Brightness.dark ? lightTheme : darkTheme;
      // Save the theme preference if needed
      saveThemePreference(currentTheme.brightness);
    });
  }
  void saveThemePreference(Brightness brightness) async {
    prefs.setBool('isDarkTheme', brightness == Brightness.dark);
  }
  @override

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      // backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkTheme ? Colors.orange[200] : Colors.orange[400],

        leading: GestureDetector(
            onTap: () {

              widget.openDrawer();
            },
          child: const Icon(
            Icons.menu, // Menu icon color will be based on theme
          ),),
        title:  const Text('श्रीपाद श्रीवल्लभ चरित्रामृत',
            style: TextStyle(fontFamily: 'Yatra One',)),
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDarkTheme ? Icons.wb_sunny : Icons.dark_mode_rounded),
            onPressed: () {
              themeProvider.toggleTheme(); // Toggle the theme on button press
            },
          ),
        ],
      ),

        body: ListView.builder(
          itemCount: widget.todos.length,
          itemBuilder: (context, index) {
            bool isRead = readState[index] ?? false;
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                surfaceTintColor: Colors.orangeAccent,
                color: themeProvider.isDarkTheme ? Colors.orange[50] : Colors.amber[50],
                // color: Colors.orange[100],
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                   leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/appicon1.png'),
                  ),
                  title: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.100,

                    child: Text(
                      widget.todos[index].title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Varun',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.100,
                    child: Text(
                      widget.todos[index].subtitle,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent[700],
                        fontFamily: 'Varun',
                      ),
                      // maxLines: 4,
                    ),
                  ),
                  onTap: () {
                    Color detailTextColor = themeProvider.isDarkTheme ? Colors.white : Colors.black;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          todo: widget.todos[index],
                          textColor: detailTextColor, // Pass the text color
                        ),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(
                      Icons.check,
                      color: isRead ? Colors.green : Colors.grey,
                      size: 20.0,

                    ),
                    onPressed: () {
                      setState(() {
                        isRead = !isRead;
                        readState[index] = isRead;
                        prefs.setBool('read_$index', isRead);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(isRead
                                ? 'वाचले म्हणून चिन्हांकित केले'
                                : 'न वाचलेले म्हणून चिन्हांकित केले'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),

      floatingActionButton: FloatingActionButton(
        tooltip: ('बुकमार्क केलेला अध्याय उघडा'),
          // backgroundColor: Colors.orange,
          backgroundColor: themeProvider.isDarkTheme ? Colors.orange[200] : Colors.orange,
          child: const Icon(

          Icons.bookmark,
          color: Colors.white,


        ),
        onPressed: () async {
          SharedPreferences prefs1 = await SharedPreferences.getInstance();
          // ignore: use_build_context_synchronously
          Navigator.push(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(
                      todo: widget.todos[prefs1.getInt('bookmarked') ?? 0]),

            ),
          );
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('बुकमार्क केलेला अध्याय उघडला'),
            ),
          );
          // },
        }),
    );
  }

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );

  final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.orange,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );
}
