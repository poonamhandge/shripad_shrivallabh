import 'about.dart';


import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'drawer_item.dart';
import 'drawer_items.dart';
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
