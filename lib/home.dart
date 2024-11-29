


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'details.dart';
import 'todo.dart';
import 'theme_provider.dart';



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
          child: Icon(
            Icons.menu, // Menu icon color will be based on theme
          ),),
        title:  Text('श्रीपाद श्रीवल्लभ चरित्रामृत',
            style: TextStyle(fontWeight: FontWeight.bold,)),
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
                      style: TextStyle(
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
