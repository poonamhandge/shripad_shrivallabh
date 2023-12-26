// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'audio.dart';
// import 'details.dart';
// import 'listData.dart';
// import 'todo.dart';
//
//
//
//
// class ChapterScreen extends StatefulWidget {
//   final List<Todo> todos;
//   final VoidCallback openDrawer;
//   final List<String> audioFiles;
//
//
//   const ChapterScreen({
//     super.key,
//     required this.todos,
//     required this.audioFiles,
//     required this.openDrawer,
//   });
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _ChapterScreenState createState() => _ChapterScreenState();
// }
//
// class _ChapterScreenState extends State<ChapterScreen> {
//
//   Map<int, bool> readState = {};
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       // backgroundColor: Colors.orange[100],
//       appBar: AppBar(
//         backgroundColor: Colors.orange[400],
//
//         leading: GestureDetector(
//             onTap: () {
//
//               widget.openDrawer();
//             },
//             child: const Icon(
//               Icons.menu, // add custom icons also
//             )),
//         title: const Text('श्रीपाद श्रीवल्लभ चरित्रामृत',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//       ),
//       body: ListView.builder(
//         itemCount: widget.todos.length,
//         itemBuilder: (context, index) {
//           bool isRead = readState[index] ?? false;
//           return Card(
//             surfaceTintColor: Colors.orangeAccent,
//             color: Colors.orange[50],
//             child: ListTile(
//               leading: ClipOval(
//                 child: Image.asset(
//                   'assets/appicon1.png',
//                   fit: BoxFit.cover,
//                   width: 60, // Adjust the width as needed
//                   height: 60, // Adjust the height as needed
//                 ),
//               ),
//               title: Text(
//                 widget.todos[index].title,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Varun',
//                 ),
//               ),
//               subtitle: Text(
//                 widget.todos[index].subtitle,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepOrangeAccent[700],
//                   fontFamily: 'Varun',
//                 ),
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DetailScreen(todo: widget.todos[index]),
//                   ),
//                 );
//               },
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: Icon(
//                       Icons.check,
//                       color: isRead ? Colors.lime[900] : Colors.white,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         readState[index] = !isRead;
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.play_arrow),
//                     onPressed: () {
//                       if (kDebugMode) {
//                         print('Audio Files: ${widget.audioFiles}');
//                       }
//                       // Navigate to the AudioScreen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MyApp2(audioFiles:audioFiles),
//                         ),
//                       );
//                     },
//                   ),
//
//
//
//
//                 ],
//               ),
//
//             ),
//           );
//         },
//       ),
//
//
//       floatingActionButton: FloatingActionButton(
//           tooltip: ('Open Bookmarked Page'),
//           backgroundColor: Colors.orange,
//           child: const Icon(
//
//             Icons.bookmark,
//             color: Colors.white,
//
//
//           ),
//           onPressed: () async {
//             SharedPreferences prefs1 = await SharedPreferences.getInstance();
//             // ignore: use_build_context_synchronously
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>
//                     DetailScreen(
//                         todo: widget.todos[prefs1.getInt('bookmarked') ?? 0]),
//               ),
//             );
//             // },
//           }),
//     );
//   }
//
//
// }
