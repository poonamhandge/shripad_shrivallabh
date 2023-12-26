//
// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
//
// import 'audio_page.dart';
// import 'drawer_items.dart';
// import 'parayan.dart';
// import 'phal.dart';
// import 'sidhamangal.dart';
// import 'stotram.dart';
// import 'drawer.dart';
//
// import 'listData.dart';
// import 'drawer_item.dart';
// import 'todo.dart';
// import 'udhhar.dart';
// import 'package:flutter/material.dart';
// import 'package:in_app_update/in_app_update.dart';
//
//
//
//
//
// import 'abhay.dart';
//
// void main() => runApp(const MyApp1());
//
// class MyApp1 extends StatefulWidget {
//   const MyApp1({super.key});
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp1> {
//   late AppUpdateInfo _updateInfo;
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//
//
//   void showSnack(String text) {
//     if (_scaffoldKey.currentContext != null) {
//       // ScaffoldMessenger.of(_scaffoldKey.currentContext)
//       //     .showSnackBar(SnackBar(content: Text(text)));
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
//     }
//   }
//
//   @override
//   initState() {
//     super.initState();
//     if (kDebugMode) {
//       print('New version available');
//     }
//     InAppUpdate.checkForUpdate().then((info) {
//       setState(() {
//         _updateInfo = info;
//         if (Platform.isAndroid) {
//           if (_updateInfo.flexibleUpdateAllowed == true) {
//             if (kDebugMode) {
//               print('Hey Update');
//             }
//
//             InAppUpdate.startFlexibleUpdate().then((_) {
//               setState(() {
//                 InAppUpdate.completeFlexibleUpdate().then((_) {
//                   const SnackBar(content: Text('Success!'));
//                 }).catchError((e) {
//                   showSnack(e.toString());
//                 });
//               });
//             }).catchError((e) {
//               showSnack(e.toString());
//               return null; // or Future<void>.value(null);
//             });
//           }
//         }
//       });
//     }).catchError((e) {
//       showSnack(e.toString());
//       return null; // or Future<void>.value(null);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'श्रीपाद श्रीवल्लभ चरित्रामृत ',
//         theme: ThemeData(
//           primarySwatch: Colors.orange,
//           primaryColor: Colors.orange,
//         ),
//         home: const MainPage());
//   }
// }
//
// class MainPage extends StatefulWidget {
//   // ignore: use_super_parameters
//   const MainPage({key}) : super(key: key);
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   DateTime backbuttonpressedTime = DateTime.now();
//   double xOffset = 0;
//   double yOffset = 0;
//   double scaleFactor = 1;
//   bool isDragging = false;
//   bool isDrawerOpen = false;
//   DrawerItem item = DrawerItems.home;
//
//   @override
//   void initState() {
//     super.initState();
//     closeDrawer();
//   }
//
//   void closeDrawer() => setState(() {
//     xOffset = 0;
//     yOffset = 0;
//     scaleFactor = 1;
//     isDrawerOpen = false;
//   });
//   void openDrawer() => setState(() {
//     xOffset = 230;
//     yOffset = 130;
//     scaleFactor = 0.7;
//     isDrawerOpen = true;
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange[300],
//       body: Stack(
//         children: [
//
//           buildDrawer(),
//           homePage1(),
//         ],
//       ),
//     );
//   }
//
//   Widget buildDrawer() => SafeArea(
//       child: SizedBox(
//
//         width: xOffset,
//
//         child: DrawerWidget(
//           onSelectedItem: (item) {
//             Colors.orange[400];
//             setState(() => this.item = item);
//             closeDrawer();
//           },
//         ),
//       ));
//   Future<bool> onwillPop() async {
//     DateTime currentTime = DateTime.now();
//
//     bool backButton = currentTime.difference(backbuttonpressedTime) > const Duration(seconds: 2);
//     if (backButton) {
//       backbuttonpressedTime = currentTime;
//
//       return false;
//     }
//     exit(0);
//   }
//
//
//   Widget homePage1() {
//     return PopScope(
//
//       child: GestureDetector(
//         onTap: closeDrawer,
//         onHorizontalDragStart: (details) => isDragging = true,
//         onHorizontalDragUpdate: (details) {
//           if (!isDragging) return;
//           const delta = 1;
//           if (details.delta.dx > delta) {
//             openDrawer();
//           } else if (details.delta.dx < -delta) {
//             closeDrawer();
//           }
//           isDragging = false;
//         },
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 250),
//           transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
//           decoration: const BoxDecoration(boxShadow: [
//             BoxShadow(
//               color: Color.fromRGBO(255, 160, 0, 0),
//               blurRadius: 30,
//               offset: Offset(0, 0),
//               spreadRadius: 2.0,
//             )
//           ]),
//           child: AbsorbPointer(
//             absorbing: isDrawerOpen,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular((isDrawerOpen) ? 20 : 0),
//               child: Container(
//                 child: getDrawerPage(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget getDrawerPage() {
//
//     switch (item) {
//       case DrawerItems.uddhar:
//         return Uddhar(openDrawer: openDrawer);
//
//       case DrawerItems.parayan:
//         return Parayan(openDrawer: openDrawer);
//
//       case DrawerItems.phal:
//         return Phal(openDrawer: openDrawer);
//       case DrawerItems.sidhhamangal:
//         return SiddhaMangal(
//           openDrawer: openDrawer,
//         );
//       case DrawerItems.stotra:
//         return Stotram(openDrawer: openDrawer);
//       case DrawerItems.abhay:
//         return Abhay(openDrawer: openDrawer);
//
//       case DrawerItems.home:
//
//         // if (kDebugMode) {
//         //   print('Audio Files: ${audioFiles[0ß]}');
//         // }
//         return ChapterScreen(
//           todos: List.generate(
//             53,
//                 (i) => Todo(
//               'DçO³çç³ç - ${i + 1}',
//               chapterName.elementAt(i),
//               chapter.elementAt(i),
//               audioFiles.elementAt(i),
//               '$i',
//                // Pass the audio file path here
//             ),
//           ),
//           openDrawer: openDrawer,
//           audioFiles: audioFiles,
//         );
//
//
//       default:
//         return ChapterScreen(
//           todos: List.generate(
//             53,
//                 (i) => Todo(
//               'DçO³çç³ç - ${i + 1}',
//               chapterName.elementAt(i),
//               chapter.elementAt(i),
//                   audioFiles.elementAt(i),
//               '$i',
//               // Pass the audio file path here
//             ),
//           ),
//           openDrawer: openDrawer,
//           audioFiles: audioFiles,
//         );
//
//
//     }
//   }
// }
