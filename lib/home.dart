


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
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                surfaceTintColor: Colors.orangeAccent,
                color: Colors.orange[50],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(todo: widget.todos[index]),
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


}
