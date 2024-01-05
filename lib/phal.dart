import 'package:flutter/material.dart';

class Phal extends StatelessWidget {
  final VoidCallback openDrawer;

  const Phal({super.key, required this.openDrawer});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange[400],
          leading: GestureDetector(
              onTap: () {
                openDrawer();
              },
              child: const Icon(
                Icons.menu, // add custom icons also
              )),
          title: const Text(
             'ग्रंथाच्या प्रत्येक अध्याय-पठणाचे फल',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Varun')),

          actions: const <Widget>[]),
      body: Padding(
        padding: const EdgeInsets.all(20.00),
        child: ListView(children: <Widget>[
          Text(
              '।। श्रीपादराजं शरणं प्रपद्ये ।। ',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),

          Text(
              '१ घरात शांती नांदते सुखाची प्राप्ति\n२ मनः क्लेश निवारण\n३ नागदोष निवारण, संतान-प्रतिबंधक-दोष निवारण\n४ मुलीना योग्य वर प्राप्ति, गुरुनिन्दा-दोष-निवारण\n५ विघ्न दूर होण्यास, देवता कोपापासून मुक्ती\n६ पितृ शापापासून निवृत्ती\n७ अज्ञान निवृत्ती, विवेक प्राप्ति\n८ संतानप्राप्ती, लक्ष्मी-कृपा-कटाक्ष लाभ\n९ प्रारब्ध-कर्म-नाश\n१० दौर्भाग्य-नाश\n११ दुर्गुणापासून मुक्ती\n१२ शरीरारोग्य प्राप्ति\n१३ व्यवसाय वृद्धी, पशु-वृद्धि\n१४ आपदा-निवारण, उत्साह-वृद्धि\n१५ अकारण कलह निवारण, पूर्व जन्म कृत दोष निवारण\n१६ धनाकर्षण-शक्ति-वृद्धि\n१७ सिद्ध पुरुषांचे आशिर्वाद\n१८ पापकर्मांचा नाश, भाग्य वृद्धि\n१९ मानसिक क्लेश निवारण\n २० कष्ट-नष्ट-निवारण\n२१ अध्यात्मिक लाभ, पुण्य वृद्धि\n२२ कर्मदोष निवारण\n २३ ऐश्वर्य-प्राप्ति\n२४ दांपत्य-सुख\n२५ आर्थिक समस्या दूरिकरण\n२६ दुर्दैव नाश, सत्संतान प्राप्ति\n२७ ऐश्वर्य लक्ष्मी प्राप्ति\n२८ विवाह अनुकूल व शीघ्र होण्यास\n२९ पितृ देवतांचे आशिर्वाद\n३० उज्वल भविष्य होण्यास\n३१ विद्या, ऐश्वर्य यांची प्राप्ती\n३२ सद्गुरु कृपाकटाक्ष प्राप्ति साठी\n३३ अनुकूल विवाह होण्यास\n३४ ऋण मोचनांसाठी\n३५ वाक्सिद्धी साठी\n३६ अनुकूल दाम्पत्य जीवनासाठी\n३७ जीवनात स्थैर्य\n३८ आत्मस्थैर्य\n३९ सर्प दोष-निवारण\n४० असाध्य कार्यात यश मिळण्यासाठी\n४१ लोकनिन्दा परिहारार्थ\n४२ हरवलेले मूल सापडण्यास\n४३ अष्टैश्वर्य प्राप्तिसाठी\n४४ उज्वल भविष्यासाठी\n४५ सर्व क्षेत्रात वृद्धि\n४६ त्वरित विवाहसाठी\n४७ सर्व शुभफल मिळण्यास\n४८ आर्त, अर्थार्थी, जिज्ञासू, मुमुक्षु यांना चारी पुरुषार्थ सिद्धीसाठी\n४९ समस्त कर्म-दोषापासून निवृत्ति\n५० गुरुनिन्दा केल्यामुळे आलेले दारिद्र्य दूर होण्यास\n५१ जलगंडादिकापासून रक्षण\n५२ सर्व समस्या अप्रयत्नाने दूर होतील\n५३ महापाप-ध्वंस होण्यास',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent[700],
                  fontFamily: 'Varun'),
              textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
