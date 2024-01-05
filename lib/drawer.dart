import 'about.dart';


import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'drawer_item.dart';
import 'drawer_items.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';



class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;

  const DrawerWidget({super.key, required this.onSelectedItem});
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pithapur.jpg'),
                  fit: BoxFit.cover,
                ),
                color: Colors.orange,
              ),
              child: null,
            ),
            buildDrawItems(context),
            //-----------------------------------------------
            Align(
                alignment: FractionalOffset.bottomCenter,
                // This container holds all the children that will be aligned
                // on the bottom and should not scroll with the above ListView
                child: Column(

                                  children: <Widget>[

                const Divider(),

                ListTile(
                    leading: Icon(Icons.graphic_eq,
                        color: Colors.orange[900]),
                    title: Text('About',
                        style: TextStyle(
                            color: Colors.orange[900],
                            fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const About(),
                        ),
                      );
                    }),
                ListTile(
                    leading:
                        Icon(Icons.share, color: Colors.orange[900]),
                    title: Text('Share',
                        style: TextStyle(
                            color: Colors.orange[900],
                            fontWeight: FontWeight.bold)),
                    onTap: () {
                      Share.share('श्रीपाद श्रीवल्लभ चरित्रामृत\n\n Download App @ https://play.google.com/store/apps/details?id=com.shripadshrivallabh.charitramrut',
                        subject: 'श्रीपाद श्रीवल्लभ चरित्रामृत',);

                    }),


                ListTile(
                    leading: Icon(Icons.rate_review,
                        color: Colors.orange[900]),
                    title: Text('Feedback',
                        style: TextStyle(
                            color: Colors.orange[900],
                            fontWeight: FontWeight.bold)),
                    onTap: () {
                      // ignore: deprecated_member_use
                      launch(
                          'https://play.google.com/store/apps/details?id=com.shripadshrivallabh.charitramrut');

                    }),
                                    ListTile(
                                        leading: Icon(Icons.apps,
                                            color: Colors.orange[900]),
                                        title: Text('आमचे इतर ऍप एक्सप्लोर करा ',
                                            style: TextStyle(
                                                color: Colors.orange[900],
                                                fontWeight: FontWeight.bold)),
                                        onTap: () {
                                          // ignore: deprecated_member_use
                                          launch(
                                              'https://g.co/kgs/GKA8ow');

                                        }),
                                    ListTile(
                                        leading: Icon(Icons.play_arrow,
                                            color: Colors.orange[900]),
                                        title: Text('श्रीपाद श्रीवल्लभ चरित्रमृत ऑडियो',
                                            style: TextStyle(
                                                color: Colors.orange[900],
                                                fontWeight: FontWeight.bold)),
                                      onTap: () {
                                        // Show Snackbar at the middle of the screen when the ListTile is tapped
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Coming soon'),

                                            duration: Duration(seconds: 2),
                                            backgroundColor: Colors.black54,
                                            behavior: SnackBarBehavior.floating,

                                            margin: EdgeInsets.all(100.0), // Adjust margin to position the Snackbar
                                          ),
                                        );

                                        // Perform any other action you want to take when the ListTile is tapped
                                        // ...
                                      }),
                                  ],
                                )),
          ],
        ),

        //------------------------------------------------
      );
  // Column
  // SingleChildScrollView

  Widget buildDrawItems(BuildContext context) => Column(
        children: DrawerItems.all
            .map((item) => ListTile(
                  contentPadding: const EdgeInsets.only(left: 24, top: 8),
                  leading: Icon(item.icon),
                  title: Text(item.title,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Varun',
                          color: Colors.brown[900])),
                  onTap: () => onSelectedItem(item),

                ))
            .toList(),
      );
}
