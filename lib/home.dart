// import 'package:flutter/material.dart';
//
//
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange[100],
//       appBar: AppBar(
//         backgroundColor: Colors.orange[400],
//         leading: GestureDetector(
//             onTap: () {
//
//             },
//             child: const Icon(
//               Icons.menu, // add custom icons also
//             )),
//         title: const Text('श्रीपाद श्रीवल्लभ चरित्रामृत',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//       ),
//       body: ListView.builder(
//
//         itemBuilder: (context, index) {
//           return Card(
//               child: ListTile(
//
//                 title: const Text('श्रीपाद श्रीवल्लभ चरित्रामृत',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Varun')),
//                 subtitle: Text('श्रीपाद श्रीवल्लभ चरित्रामृत',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepOrangeAccent[700],
//                         fontFamily: 'Varun')),
//                 // When a user taps the ListTile, navigate to the DetailScreen.
//
//               ));
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         tooltip: ('Open Bookmarked Page'),
//         onPressed: () {  },
//         child: const Icon(
//           Icons.bookmark,
//           color: Colors.white,
//         ),
//
//
//
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'details.dart';
import 'todo.dart';



class ChapterScreen extends StatefulWidget {
  final List<Todo> todos;
  final VoidCallback openDrawer;

  const ChapterScreen({super.key, required this.todos, required this.openDrawer});

  @override
  // ignore: library_private_types_in_public_api
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  late SharedPreferences prefs;
  Map<int, bool> readState = {};

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
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],

        leading: GestureDetector(
            onTap: () {

              widget.openDrawer();
            },
            child: const Icon(
              Icons.menu, // add custom icons also
            )),
        title: const Text('श्रीपाद श्रीवल्लभ चरित्रामृत',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          bool isRead = readState[index] ?? false;
          return Card(
            surfaceTintColor:Colors.orangeAccent ,
              color: Colors.orange[50] ,
              child: ListTile(
                leading: ClipOval(
                  child: Image.asset(
                    'assets/appicon1.png',
                    fit: BoxFit.cover,
                    width: 60, // Adjust the width as needed
                    height: 60, // Adjust the height as needed
                  ),
                ),

                title: Text(widget.todos[index].title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Varun')),

                subtitle: Text(widget.todos[index].subtitle,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                        color: Colors.deepOrangeAccent[700],
                        fontFamily: 'Varun')
                ),
                // When a user taps the ListTile, navigate to the DetailScreen.
                onTap: () {

                  Navigator.push(
                    context,

                    MaterialPageRoute(


                      builder: (context) => DetailScreen(todo: widget.todos[index]
                      ),

                    ),
                  );
                },
                trailing: IconButton(
                  icon: Icon(
                    Icons.check, // Use a different icon for "Mark as Read"
                    color: isRead ? Colors.lime[900] : Colors.white,
                  ),
                  onPressed: () {

                    setState(() {
                      // Toggle the read state when the user taps the IconButton.
                      isRead = !isRead;
                      readState[index] = isRead;

                      // Save the read state in SharedPreferences.
                      prefs.setBool('read_$index', isRead);
                    });

                  },
                ),
              ));
        },
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: ('Open Bookmarked Page'),
          backgroundColor: Colors.orange,
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
          // },
        }),
    );
  }


}
