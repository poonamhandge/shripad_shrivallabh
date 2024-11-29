import 'package:charitramrut/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stotram extends StatelessWidget {
  final VoidCallback openDrawer;

  const Stotram({Key? key, required this.openDrawer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: themeProvider.isDarkTheme ? Colors.orange[200] : Colors.orange[400],
          leading: GestureDetector(
              onTap: () {
                openDrawer();
              },
              child: const Icon(
                Icons.menu, // add custom icons also
              )),
          title: const Text('श्रीपाद श्रीवल्लभ स्तोत्रम्',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Varun')),
          actions: const <Widget>[]),
      body: Padding(
        padding: const EdgeInsets.all(20.00),
        child: ListView(children: <Widget>[
          Text(
              'श्रीपाद वल्लभ गुरोः वंदनारविन्दं\n वैराग्य दीप्ती परमो ज्वालामद्वितीयम् । \nमंदस्मितं सुमधुरं करुणार्द्र नेत्रं \nसंसार - ताप - हरणं - सततं स्मरामि।।\n\nश्रीपाद वल्लभ गुरो: कारकल्पवृक्ष \nभक्तेष्ट - दान - निरतं रिपुसंक्षयं वै।\nस्मरणमात्र चिति - जागरणं सुभद्रं \nसंसार - भीति - शमानं सततं भजामी ।।\n\nश्रीपाद वल्लभ गुरो: परमेश्वरस्य \nयोगिश्वरस्य शिवशक्ती समन्वितस्य ।\nश्री पर्वतस्य शिखरं खलु संनिविष्टं\nत्रैलोक्य - पावन - पदाब्जमहं नमामि ।।',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
