import 'dart:ui';
import 'package:charitramrut/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lyric/lyric_ui/lyric_ui.dart';
import 'package:flutter_lyric/lyric_ui/ui_netease.dart';
import 'package:flutter_lyric/lyrics_model_builder.dart';
import 'package:flutter_lyric/lyrics_reader_widget.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'listData.dart';
import 'main.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
class App extends StatefulWidget {
  final GlobalKey<OnboardingState> onboardingKey = GlobalKey<OnboardingState>();

  App({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppState createState() => _AppState();
}
class _AppState extends State<App> {
  final GlobalKey closeKey = GlobalKey();
  late List<FocusNode> focusNodes;
  int currentStepIndex = 0;
  bool showSkipButton = false;
  bool onboardingPaused = false;

  @override
  @override
  void initState() {
    super.initState();
    focusNodes = List<FocusNode>.generate(
      20, // Number of onboarding steps
          (int i) => FocusNode(debugLabel: 'Onboarding Focus Node $i'),
      growable: false,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!showSkipButton) {
        widget.onboardingKey.currentState?.show();
      }
      else {
        setState(() {
          onboardingPaused = true;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        home: Onboarding(
          key: widget.onboardingKey,
          steps: <OnboardingStep>[
            OnboardingStep(
              focusNode: focusNodes[0],
              titleText: 'श्रीपाद श्रीवल्लभ चरित्रामृत',
              textAlign: TextAlign.center,
              titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange[50],
              ),


            ),
            OnboardingStep(
              focusNode: focusNodes[1],
              titleText: 'मेनू',
              bodyText: 'मेनू उघडण्यासाठी आणि बंद करण्यासाठी येथे टॅप करा.\n''सुरू ठेवण्यासाठी टॅप करा',

            ),
            OnboardingStep(
              focusNode: focusNodes[2],
              titleText: 'अध्याय यादी',
              bodyText: 'सुरू ठेवण्यासाठी टॅप करा',
              textAlign: TextAlign.center,


            ),

            OnboardingStep(
              focusNode: focusNodes[3],
              titleText: 'बुकमार्क केलेला अध्याय प्ले करा.',
              bodyText: 'सुरू ठेवण्यासाठी टॅप करा',


            ),
            OnboardingStep(
              focusNode: focusNodes[4],
              titleText: 'अध्याय ऐकण्यासाठी अध्याय वर टॅप करा.',
              bodyText: 'सुरू ठेवण्यासाठी टॅप करा',

            ),

            OnboardingStep(
              focusNode: focusNodes[5],
              titleText: 'अध्यायचे बोल',
              bodyText: 'तुम्ही येथे अध्यायचे बोल पाहू शकता\n''सुरू ठेवण्यासाठी टॅप करा',



            ),

            OnboardingStep(
              focusNode: focusNodes[6],
              titleText: 'आधीचा अध्याय ऐकण्यासाठी या बटणावर टॅप करा',
              bodyText: 'सुरू ठेवण्यासाठी टॅप करा',

            ),
            OnboardingStep(
              focusNode: focusNodes[7],
              titleText: 'अध्याय प्ले/पॉज करा',
              bodyText: 'सुरू ठेवण्यासाठी टॅप करा',

            ),
            OnboardingStep(
              focusNode: focusNodes[8],
              titleText: 'पुढील अध्याय ऐकण्यासाठी या बटणावर टॅप करा',
              bodyText: 'सुरू ठेवण्यासाठी टॅप करा',

            ),

            OnboardingStep(
              focusNode: focusNodes[10],
              titleText: 'अध्याय बुकमार्क करा',
              bodyText: 'ऐकायचे आहे त्या अध्यायाचा ओळी आणि ऑडिओ टाइमिंग सेव्ह करा\nसुरू ठेवण्यासाठी टॅप करा',

            ),

            OnboardingStep(
              focusNode: focusNodes[11],
              titleText: 'बुकमार्क केलेले अध्याय प्ले करा ',
              bodyText: 'अध्यायाचा ओळी आणि ऑडिओ सेव्ह केला होता तेथून ऑडिओ प्ले करा\nसुरू ठेवण्यासाठी टॅप करा',

            ),
            OnboardingStep(
              focusNode: focusNodes[12],
              titleText: 'अँप सुरुवात करा',
              bodyText: 'सुरू करण्याासाठी टॅप करा',
              textAlign: TextAlign.center,
              titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange[50],
              ),
            ),

          ],
          onChanged: (stepIndex) {
            setState(() {
              currentStepIndex = stepIndex;
            });
            if (stepIndex ==
                widget.onboardingKey.currentState!.widget.steps.length - 1) {
              // Navigate to the MainPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            }
          },
          child: OnboardingPage(
            focusNodes: focusNodes,
            currentStepIndex: currentStepIndex,
          ),
        ),
      );
}
class OnboardingPage extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final int currentStepIndex;
  const OnboardingPage({super.key, required this.focusNodes, required this.currentStepIndex});




  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
  List<Todo> get todos => [
    Todo(
      'अध्याय १',
      'ÞççÇ J³ççIçí´éçj Mçcçç&®çç JçÉÊççblç',
      'ÞççÇ J³ççIçí´éçj Mçcçç&®çç JçÉÊççblç',
      '1',

    ),
    Todo(
      'अध्याय २',
      'çÆmç× ³ççíi³çç®çí oMç&vç-çÆJççÆ®ç\$çHçájçÇ®çç JçÉÊççblç',
      'çÆmç× ³ççíi³çç®çí oMç&vç-çÆJççÆ®ç\$çHçájçÇ®çç JçÉÊççblç',
      '2',

    ),
    Todo(
      'अध्याय ३',
      'HçUvççÇmJççcççÇ oMç&vç - kçáÀjJçHçáj®çí ÞççÇHçço ÞççÇJçuuçYç mJççcççÇb®çç mcçjCç cççÆncçç',
      'çÆmç× ³ççíi³çç®çí oMç&vç-çÆJççÆ®ç\$çHçájçÇ®çç JçÉÊççblç',
      '2',

    ),
    Todo(
      'अध्याय ४',
      'kçáÀjJçHçájçlç JççmçJççbçÆyçkçíÀ®çí oMç&vç',
      'çÆmç× ³ççíi³çç®çí oMç&vç-çÆJççÆ®ç\$çHçájçÇ®çç JçÉÊççblç',
      '2',

    ),
    Todo(
      'अध्याय ५',
      'MçbkçÀj Yçfç®çí çÆlç©HçlççÇ}ç Hççínçí®çCçí kçÀççÆCçHççkçÀçlç çÆlç©cç}oçmççb®ççÇ Yçíì',
      'çÆmç× ³ççíi³çç®çí oMç&vç-çÆJççÆ®ç\$çHçájçÇ®çç JçÉÊççblç',
      '2',

    ),
    Todo(
      'अध्याय ६',
      'vçjmççJçOççvççR®çí JçÉÊç',
      'çÆmç× ³ççíi³çç®çí oMç&vç-çÆJççÆ®ç\$çHçájçÇ®çç JçÉÊççblç',
      '2',

    ),
    Todo(
      'अध्याय ७',
      'Kçiççí} JçCç&vç',
      'çÆmç× ³ççíi³çç®çí oMç&vç-çÆJççÆ®ç\$çHçájçÇ®çç JçÉÊççblç',
      '2',

    ),
    Todo(
      'अध्याय ८',
      'Kçiççí} JçCç&vç',
      'çÆmç× ³ççíi³çç®çí oMç&vç-çÆJççÆ®ç\$çHçájçÇ®çç JçÉÊççblç',
      '2',

    ),
    Todo(
      'अध्याय ९',
      'Kçiççí} JçCç&vç',
      'çÆmç× ³ççíi³çç®çí oMç&vç-çÆJççÆ®ç\$çHçájçÇ®çç JçÉÊççblç',
      '2',

    ),
    Todo(
      'अध्याय १०',
      'Kçiççí} JçCç&vç',
      'çÆmç× ³ççíi³çç®çí oMç&vç-çÆJççÆ®ç\$çHçájçÇ®çç JçÉÊççblç',
      '2',
    ),
    // Add more Todo items as needed
  ];
}
class _OnboardingPageState extends State<OnboardingPage> {
  bool skipOnboarding = false;
  final pageController = PageController();
  late SharedPreferences prefs;
  Map<int, bool> readState = {};
  late List<Todo> todos;
  bool showStepFiveContent = false;
  // AudioPlayer? audioPlayer;
  double sliderProgress = 111658;
  int playProgress = 111658;
  // ignore: non_constant_identifier_names
  double max_value = 211658;
  bool isTap = false;
  bool useEnhancedLrc = false;
  static const normalLyric0 = """[00:00.17]॥ श्री गुरुवे नम: ॥ ॥ श्रीपादराजं शरणं प्रपद्ये ॥
[00:04.42]अध्याय -१
[00:06.28]श्री व्याघ्रेश्वर शर्माचा वृतांत
[00:09.20]श्री महागणपती, श्री महासरस्वती, श्रीकृष्ण भगवान, सर्व चराचरवासी देवी-देवता आणि सकल गुरु परंपरेच्या चरणी नतमस्तक होऊन,
[00:18.51] मी त्या अनंत कोटी ब्रह्मांड नायक श्री दत्तप्रभुंच्या, कलियुगातील, श्रीपाद श्रीवल्लभ स्वामींच्या अवतार लीलांचे वर्णन करण्याचा संकल्प केला आहे.
[00:28.89]अनसूया-अत्रिनंदन भगवान श्री दत्तात्रेय यांनी आंध्र प्रदेशातील पीठिकापुरम् या गावी श्रीपाद श्रीवल्लभ या नावाने अवतार घेतला.
[00:37.13]त्यांच्या दिव्य चरित्राचे वर्णन यथायोग्य करणे अनेक पंडितांना, विद्वानांना सुध्दा जमले नाही.
[00:43.78]ते करण्याचे मी धाडस करीत आहे, ते केवळ आपणासारख्या थोर, विद्वान श्रोत्यांच्या आशिर्वादामुळेच.
[00:50.69]मी शंकरभट्ट, देशस्थ कर्नाटकी स्मार्त ब्राह्मण. माझा जन्म भारद्वाज गोत्रात झाला. मी श्रीकृष्ण दर्शनासाठी 'उडपी' तीर्थस्थानी गेलो असताना तेथील नयनमनोहारी,
[01:04.23]मोरमुकुटधारी कृष्णाने मला मंत्रमुग्ध केले. त्याने मला कन्याकुमारीस जाऊन कन्यका परमेश्वरीचे दर्शन घेण्याची आज्ञा केली.
[01:13.17]त्याप्रमाणे मी कन्याकुमारीस जाऊन त्रिवेणी सागरात स्नान करून श्रीकन्यका देवीचे दर्शन घेतले.
[01:19.54] मंदिरातील पुजारी मोठ्या भक्तीभावाने देवीची पूजा करीत होता. मी आणलेले लाल फूल त्याने मोठ्या श्रध्देने देवीस अर्पण केले. देवी अंबा माझ्याकडे मोठ्या स्नेहपूर्ण नजरेने पहात असल्याचे जाणवले.
[01:33.18] ती म्हणत होती ''शंकरा, तुझ्या अंतरंगातील भक्तीभावावर मी प्रसन्न झाले आहे. तू कुरवपूर क्षेत्रास जा आणि श्रीपाद श्रीवल्लभ स्वामींच्या दर्शनाने आपल्या जीवनाचे सार्थक कर. त्यांच्या दर्शनाने मनाला,
[01:46.74] अंतर आत्म्याला जो आनंदाचा अनुभव येतो, तो अवर्णनीय असतो.'' अंबामातेचा आशिर्वाद घेऊन मी प्रवास आरंभ केला आणि थोडया अंतरावर असलेल्या 'मरुत्वमलै' या गावी येऊन पोहोंचलो.
[01:58.70] लंकेतील राम-रावण संग्रामात लक्ष्मणास इंद्रजीताची शक्ति लागून तो अचेतन अवस्थेत असताना, श्री हनुमंताने संजीवनी बुटीसाठी द्रोणागिरी पर्वत उचलून आणला होता.
[02:09.84] लक्ष्मण संजीवनी बुटीने सजीव झाल्यावर हनुमंत तो पर्वत स्वस्थानी घेऊन जात असताना त्याचा एक मोठा तुकडा येथे पडला. त्याचेच नाव 'मरुत्वमलै'असे पडले. हे स्थान अत्यंत रम्य आहे.
[02:22.88] येथे अनेक गुहा असून त्यात सिध्द पुरुष गुप्तरुपाने तपश्चर्या करीत असतात. मी साऱ्या गुहेचे दर्शन घेण्यास आरंभ केला. एका गुहेच्या आत गेलो तेव्हा आत एक वाघ शांत बसलेला दिसला.
[02:35.09] त्याला पहाताच माझ्या अंगात कापरे भरले आणि घाबरुन मी एकदम ''श्रीपाद ! श्रीवल्लभा !''जोराने ओरडलो. त्या निर्जन अरण्यात माझ्या आरोळीचा प्रतिध्वनी तितक्याच मोठ्या आवाजात ऐकू आला.
[02:47.04]त्या आवाजाने त्या गुहेतून एक वृद्ध तपस्वी बाहेर आले आणि म्हणाले ''बाबारे, तू धन्य आहेस. या अरण्यात श्रीपाद श्रीवल्लभ या नावाचा प्रतिध्वनी आला.
[02:56.88]श्री दत्त प्रभूंनी कलीयुगात श्रीपाद श्रीवल्लभ या नांवाने अवतार घेतल्याचे योगी, ज्ञानी, परमहंस लोकांनाच माहीत आहे. तू भाग्यवान असल्याने या पुण्यस्थळी आलास.
[03:08.47] तुझ्या सर्व कामना पूर्ण होतील. तुला श्रीपाद श्रीवल्लभांच्या दर्शनाचा लाभ होईल. ह्या गुहेच्या दाराजवळ बसलेला वाघ एक ज्ञानी महात्मा आहे. त्याला नमस्कार कर.''
[03:20.16] मी अत्यंत नम्रभावाने त्या वाघास नमस्कार केला. त्या वाघाने लगेच ॐ काराचा उच्चार केला. त्या आवाजाने सारा मरुत्वमलै पर्वत दुमदुमला.
[03:29.98] नंतर त्या व्याघ्राने ''श्रीपाद राजं शरणं प्रपद्ये'' असे सुस्वरात प्रभूंना आळविले. याच वेळी एक चमत्कार झाला. त्या वाघाच्या ठिकाणी एक दिव्य कांतीमान पुरुष प्रगट झाला.
[03:42.20] त्याने त्या वृद्ध तपस्व्यास साष्टांग प्रणिपात केला आणि क्षणार्धात आकाश मार्गाने निघून गेला. त्या वृद्ध तपस्व्याने मला त्यांच्या गुहेत मोठ्या आग्रहाने नेले. गुहेत गेल्यावर त्यांनी केवळ संकल्पाने अग्नि प्रज्वलित केला.
[03:55.49] त्यात आहुती देण्या साठी लागणारे पवित्र साहित्य, मधुर फळे यांची निर्मिती केली. वैदिक मंत्रोच्चारासह या पदार्थांची अग्नित आहुती दिली.
[04:05.31]ते वृद्ध तपस्वी सांगू लगले, ''या कली युगात यज्ञ, याग सत्कर्मे सारे लुप्त झाले आहेत. पंचभुतात्मक सृष्टीतून सर्व लाभ करुन घ्यायचा, परंतु त्या दैवतांचे मात्र विस्मरण करायचे असा मानवाचा धर्म झाला आहे.
[04:20.98] देवांची प्रीति प्राप्त करण्यासाठी यज्ञ करावेत व त्यांना संतुष्ट करावे. त्यांच्या कृपाप्रसादानेच प्रकृती अनुकुल होते. प्रकृतीमधील कोणत्याही शक्तीचा प्रकोप मानव सहन करु शकत नाही.
[04:33.65] प्रकृतीमधील शक्तींची मानवाने यथायोग्य मार्गाने शांती करावी, नसता अनेक संकटे उद्भवतात. मानवाने धर्माचरण न केल्यास प्रकृति शक्ती त्याची शिक्षा यथाकाली देते.
[04:45.41] लोकहितासाठी मी हा यज्ञ केला आहे. या यज्ञाचे फल स्वरूप म्हणून तुला श्रीपाद श्रीवल्लभ स्वामींचे दर्शन होईल. जन्मजन्मांतरीचे पुण्य फळास आले म्हणजे असे लाभ घडतात.''
[04:56.84] त्या वृद्ध तपस्व्याच्या मुखातून वहाणाऱ्या या पवित्र वाक्गंगा प्रवाहाने मी अगदी भाराऊन गेलो आणि अत्यंत नम्रतेने त्यांना साष्टांग दंडवत घातले.
[05:06.93] मी त्या तपस्व्याच्या चरणी प्रार्थना केली ''हे ऋषिवर, मी पंडित नाही, योगी नाही, साधक नाही, मी एक अल्पज्ञ आहे. माझ्या मनातील संदेहाची निवृत्ती करुन आपण आपला वरदहस्त माझ्या मस्तकी ठेवावा .''
[05:22.08] त्या महापुरुषाने माझ्या शंकेचे समाधान करण्याचा मनोदय दर्शविला.
[05:26.25]मी म्हटले ''हे सिध्द मुनिवर्या, मी कन्यका देवीचे दर्शन घेताना देवीने सांगितले होते की कुरवपुरी जाऊन श्रीपाद श्रीवल्लभ स्वामींचे दर्शन घ्यावे.
[05:36.61] मी तेथे जाण्यासाठी निघालो असताना मार्गात आपले व व्याघ्ररूपी महात्म्याचे दर्शन झाले. ते कोण होते ? तसेच दत्तप्रभू म्हणजे कोण ?
[05:46.27] या विषयी कृपया विस्तारपूर्वक सांगावे '' तेव्हा त्या वृद्ध तपस्व्याने सांगण्यास सुरवात केली.
[05:52.37]या आंध्र प्रांतातील, गोदावरी मंडलातील अत्री मुनींची तपोभूमी अशा नांवाने प्रसिध्द असलेल्या आत्रेयपूर ग्रामात एक काश्यप गोत्रीय ब्राह्मण कुटुंब वास्तव्य करीत होते.
[06:03.52] त्यांना परमेश्वराच्या कृपा प्रसादाने एका पुत्राचा लाभ झाला. ब्राह्मण अत्यंत विद्वान, आचार संपन्न होता परंतु पुत्र मात्र मतिमंद होता. आई वडिलांनी त्याचे नांव व्याघ्रेश्वर असे ठेवले .
[06:17.87] व्याघ्रेश्वर मोठा होऊ लागला. परंतु त्याच्या बुध्दिची वाढ मात्र होत नव्हती. पित्याने त्याला शिकविण्याचे खूप प्रयत्न केले. परंतु त्यास संपूर्ण संध्यावंदन सुध्दा करता येत नसे.
[06:29.56] एवढया विद्वान ब्राह्मणाचा पुत्र असा अज्ञानी, अशी गावातील लोकांची सारखी टोचणी त्याला अत्यंत दु:खदायक वाटे. एका ब्रह्ममुहूर्तावर त्यास स्वप्न पडले, त्यात त्याला एका दिव्य बालकाचे दर्शन झाले.
[06:43.90] ते बालक आकाशातून खाली येत होते. त्याचे चरण कमल भूमीस लागताच भूमी सुध्दा दिव्य कांतीमान झाली. तो बालक हळू हळू पावले टाकीत व्याघ्रेश्वराकडे आला आणि म्हणाला,
[06:55.07] मी असताना तुला भय कशाचे ? या ग्रामाचे व माझे ऋणानुबंध आहेत. तू हिमालयातील बदरिकारण्यात जा. तेथे तुझे सारे शुभ होईल.
[07:05.96] एवढे सांगून तो बालक अंतर्धान पावला. त्या दिव्य बालकाच्या संदेशानुसार व्याघ्रेश्वर शर्मा हिमालयातील बदरिकारण्यात जाण्यास निघाला. मार्गात त्यास अन्नपाण्याची काहीच अडचण पडली नाही.
[07:18.17] श्रीदत्त कृपेने त्याला वेळेवर अन्नपाणी मिळे. मार्गात एक कुत्रा भेटला व तो त्याच्या बरोबर बदरीवनापर्यंत सोबत होता. या प्रवासात त्यांनी उर्वशी कुंडात स्नान केले.
[07:29.60] याच वेळी एक महात्मा आपल्या शिष्य समुदायासह उर्वशी कुंडात स्नाना साठी आले. व्याघ्रेश्वराने त्या गुरुवर्यांना साष्टांग नमस्कार केला आणि माझे शिष्यत्व स्विकारावे अशी नम्र प्रार्थना केली.
[07:42.36] त्या महान गुरुवर्याने शिष्य करुन घेण्याचे मान्य केले आणि आश्चर्य असे की तत्काळ बरोबर आलेले ते कुत्रे अंतर्धान पावले.
[07:51.40] त्यावेळी ते महात्मा म्हणाले ''हे व्याघ्रेश्वरा तुझ्याबरोबर आलेला तो श्वान तुझ्या पुर्वजन्मातील केलेल्या पुण्याचे द्योतक होते. त्याने तुला आमच्या स्वाधीन करून ते अंतर्धान पावले.
[08:04.15] श्रीपाद श्रीवल्लभ स्वामींच्या कृपे मुळेच तू येथे आलास आणि या पुण्यप्रद कुंडात स्नान करु शकलास. ही नरनारायणाच्या वास्तव्याने पुनीत झालेली तपोभूमी आहे.
[08:15.56] यावर व्याघ्रेश्वर म्हणाला "हे गुरुदेवा, श्रीपाद श्रीवल्लभ कोण आहेत ? त्यांनी माझ्यावर एवढी कृपा का केली ?"  गुरुदेव म्हणाले ''ते साक्षात दत्त प्रभूच आहेत.
[08:27.25] त्रेतायुगात भारद्वाज महर्षीनी ''सावित्र काठक चयन'' नावाचा महायज्ञ श्री क्षेत्र पीठिकापुरम येथे संपन्न केला होता. त्या यज्ञ प्रसंगी शिव पार्वतींना आमंत्रित केले होते.
[08:38.94] त्यावेळी शिवानी महर्षींना आशिर्वाद दिला की ''तुमच्या कुलामध्ये अनेक महात्मा, सिध्दपुरुष, योगीपुरुष अवतार घेतील''
[08:46.92] अनेक जन्मांच्या पुण्य कर्माने दत्तभक्तीचा अंकुर फुटतो व तो पुढे सातत्याने वाढत गेल्यास श्रीपाद श्रीवल्लभ स्वामींचे दर्शन होते. त्यांच्या चरण स्पर्शाचे, संभाषणाचे भाग्य लाभते.
[08:59.94] हे व्याघ्रेश्वरा तुझ्यावर स्वामींची कृपा झाली आहे. मी आता माझ्या गुरुदेवांच्या दर्शनास जात आहे. पुन: एक वर्षाने येईन. तुम्ही तुमच्या गुहेत आत्मज्ञान प्राप्तीसाठी तपश्चर्या करावी.''
[09:12.96] असे सांगून ते महान गुरुदेव द्रोणागिरी पर्वताकडे गेले. व्याघ्रेश्वर गुहेत ध्यान करु लागला परंतु त्याचे सारे ध्यान व्याघ्ररुपाकडेच असे.
[09:22.44] याचा असा परिणाम झाला की त्याला इच्छित असलेले वाघाचे रूपच प्राप्त झाले. एक वर्षाचा काळ लोटला. गुरुदेव यात्रा करुन परत आले. त्यांनी सर्व गुहा बघितल्या.
[09:34.13]प्रत्येक शिष्याच्या एका वर्षात झालेल्या प्रगतीचा ते आढावा घेत होते. एका गुहेच्या आत गेले, तेथे त्याना एक वाघ ध्यानस्थ बसलेला दिसला. त्यांना अत्यंत आश्चर्य वाटले.
[09:44.67] त्यांनी अंतर्ज्ञानाने ओळखले की तो वाघ दुसरा कोणी नसून व्याघ्रेश्वरच आहे. व्याघ्ररूपाचेच सतत ध्यान केल्याने त्याला व्याघ्ररूपच प्राप्त झाले, हे त्यांनी जाणले.
[09:55.19] त्यांनी त्याला आशिर्वाद देऊन ॐ काराचा मंत्र शिकविला व ''श्रीपाद राजं शरणं प्रपद्ये'' हा मंत्र जपण्यास सांगितला. गुरूआज्ञेनुसार व्याघ्रेश्वर त्या रूपातच मंत्राचा जप करू लागला.
[10:07.94] वाघाच्या रूपातच त्याने कुरवपूरला प्रयाण केले. यथाकाली तो कुरवपूर ग्रामाजवळ येऊन पोहोचला. मध्ये कृष्णा नदी वहात होती.
[10:16.71] तो अलिकडील तीरावर बसून ''श्रीपाद राजं शरणं प्रपद्ये'' या मंत्राचा जप करू लागला. श्रीपाद श्रीवल्लभ कुरवपूर ग्रामात आपल्या शिष्यासह बसले होते.
[10:28.12] ते एकदम उठले आणि माझा परम भक्त मला हाक मारतो आहे असे म्हणून नदीच्या पैलतीरास येण्यास निघाले.
[10:34.77] ते पाण्यातून चालतांना त्यांच्या पदकमलांची चिन्हे पाण्यावर उमटत होती व ती फारच सुंदर दिसत होती. स्वामी पैलतीरावर पोहोचल्यावर,
[10:44.33] व्याघ्रेश्वराने त्यांच्या दिव्य चरणांवर आपले मस्तक ठेवून अत्यंत भक्तीभावाने नमस्कार केला. स्वामींनी अत्यंत आनंदाने त्या वाघाचे मस्तक कुरवाळले व त्यावर स्वार होऊन पाण्यातून ते कुरवपूरला पोहोचले.
[10:57.07] वाघावर बसून आलेले बघून सर्वांना आश्चर्य वाटले. ते वाघावरुन उतरताच त्या वाघाच्या शरीरातून एक दिव्य पुरुष बाहेर आला.
[11:05.31] त्याने आपल्या देहाचे व्याघ्राजिन (वाघाचे कातडे) स्वामींनी आसन म्हणून स्वीकार करावा अशी विनंती केली.
[11:13.20] तो श्रींच्या चरणी अत्यंत भक्तीभावाने नतमस्तक झाला. त्याचे अष्टभाव जागृत होऊन प्रेमभावाने त्याने स्वामींच्या चरणांवर आपल्या नेत्रातील अश्रूंनी अभिषेक केला.
[11:24.62] मोठ्या प्रेमभराने स्वामींनी त्याला उठवले आणि म्हणाले, ''हे व्याघ्रेश्वरा ! तू एका जन्मात अत्यंत बलशाली असा मल्ल होतास. तेव्हा तू वाघांशी युध्द करून त्यांना अतिक्रूरतेने वागवीत होतास.
[11:37.64] त्यांना वेळेवर अन्न पाणी सुध्दा देत नव्हतास. त्यांना साखळीने बांधून लोकांच्या प्रदर्शनासाठी ठेवीत होतास.
[11:44.62] या दुष्कर्मामुळे तुला अनेक नीच जीव जंतुंच्या योनीत जन्म घ्यावा लागला असता परंतु माझ्या अनुग्रहाने ते सारे दुष्कर्म हरण झाले आहेत.
[11:54.20] तू दीर्घकाळ व्याघ्ररूपात राहिल्यामुळे तुला इच्छेनुसार वाघाचे रूप धारण करता येईल व सोडताही येईल.
[12:00.56] हिमालयात कित्येक वर्षापासून माझी तपश्चर्या करणाऱ्या महान सिध्दांचे तुला दर्शन होईल आणि आशिर्वादही मिळतील. योग मार्गात तू अत्यंत प्रज्ञावंत होशील.'' असा स्वामींनी आशिर्वाद दिला.
[12:13.05]स्वामी पुढे म्हणाले ''तू हिमालयात एक वाघ अत्यंत शांत असलेला पाहिला होतास ना ! तो एक महात्मा आहे.
[12:21.01] तपश्चर्या करणाऱ्या संत पुरुषांना सामान्य लोक व इतर वन्य प्राण्यांपासून त्रास होऊ नये म्हणून त्याने ते व्याघ्ररूप धारण केले होते व तो त्यांचे संरक्षण करीत होता.
[12:31.28] गुहेतील तपश्चर्या करणाऱ्या संतांचे परस्पर वर्तमान कळविण्याचे काम सुध्दा तो वाघ मोठ्या आनंदाने करीत असे, ही सगळी दत्त प्रभूंची लीलाच.''
[12:40.85]॥ श्रीपाद श्रीवल्लभांचा जयजयकार असो ॥
""";

  var lyricModel = LyricsModelBuilder.create()
      .bindLyricToMain(normalLyric0)
      .getModel();
  var lyricUI = UINetease();
  get totalDurationMilliseconds => null;
  bool buildContainerVisible = false;
  int currentStepIndex = 0; // Add this variable

  // Function to toggle the visibility of the buildContainer()
  bool showSkipButton = false;


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
  String getDayLabel(int index) {
    if (index < 6) {
      return 'पारायणाचा प्रथम दिवस';
    } else if (index < 12) {
      return 'पारायणाचा दूसरा  दिवस';
    } else if (index < 18) {
      return 'पारायणाचा तिसरा  दिवस';
    } else if (index < 22) {
      return 'पारायणाचा चौथा  दिवस';
    } else if (index < 34) {
      return 'पारायणाचा पाचवा  दिवस';
    } else if (index < 42) {
      return 'पारायणाचा सहावा  दिवस';
    } else {
      return 'पारायणाचा सातवा दिवस';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        leading: IconButton(
          focusNode: widget.focusNodes[1], // Focus on the leading icon
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),

        title: const Text(
          'श्रीपाद श्रीवल्लभ चरित्रामृत',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

      ),

      body:Focus(
        focusNode: widget.focusNodes[2],
        child: SizedBox(
          height: widget.currentStepIndex == 1 ? 400 : 900,
          child: Column(
            children: [
              if (widget.currentStepIndex <= 3)
                buildListViewWidget(),

              if (widget.currentStepIndex > 3)
                buildContainer(), // Remove Expanded
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        focusNode: widget.focusNodes[3],
        tooltip: 'text',
        backgroundColor: Colors.orange,
        onPressed: () {
        },
        child: const Icon(
          Icons.bookmark,
          color: Colors.white,
        ),
      ),

    );
  }
  Widget buildListViewWidget() {

    return Expanded(
      // child: SingleChildScrollView(
      // child: Focus(
      // focusNode: widget.focusNodes[2],
      child: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          String dayLabel = getDayLabel(index);

          bool startOfGroup = index == 0 || dayLabel != getDayLabel(index-2);
          FocusNode? focusNode;
          if (index == 3) {
            // Set focus node for the desired item in the second group
            focusNode = widget.focusNodes[4];
          }
          return Focus(
            focusNode: focusNode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (startOfGroup)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 8.0,
                      bottom: 4.0,
                      right: 10.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              children: [
                                const SizedBox(width: 8.0),
                                TweenAnimationBuilder<double>(
                                  duration: const Duration(seconds: 1),
                                  tween: Tween<double>(begin: 0.0, end: 1.0),
                                  builder: (context, value, child) {
                                    return Opacity(
                                      opacity: value,
                                      child: Text(
                                        dayLabel,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          foreground: Paint()
                                            ..shader = LinearGradient(
                                              colors: [
                                                Colors.deepOrange.shade900,
                                                Colors.deepOrange.shade900
                                              ],
                                            ).createShader(
                                              const Rect.fromLTWH(
                                                0.0,
                                                0.0,
                                                200.0,
                                                70.0,
                                              ),
                                            ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: List.generate(1, (i) {
                      int currentIndex = index + i;

                      return Container(
                        decoration: const BoxDecoration(),
                        child: Card(
                          surfaceTintColor: Colors.orangeAccent,
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              widget.todos[currentIndex].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Varun',
                              ),
                            ),
                            subtitle: Text(
                              widget.todos[currentIndex].subtitle,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent[700],
                                fontFamily: 'Varun',
                              ),
                            ),
                            onTap: () {},
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color:
                                    Colors.grey,
                                    size: 22.0,
                                  ),
                                  onPressed: () {

                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildReaderWidget(),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...buildPlayControl(), // Play controls placed at the bottom
              // Other UI control widgets can be added here if needed
            ],
          ),
        ),
      ],
    );
  }
  var lyricPadding = 40.0;

  Widget buildBookmarkButton() {
    // Determine the bookmark status based on the current slider progress
    return TextButton(
      onPressed: () {
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(3), // Adjust elevation for shadow effect
        shadowColor: MaterialStateProperty.all<Color>(Colors.grey), // Set shadow color
        minimumSize: MaterialStateProperty.all<Size>(const Size(40, 40)), // Set minimum button size
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(7)), // Adjust button padding
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            // Change button color based on states
            if (states.contains(MaterialState.pressed)) {
              // When pressed
              return Colors.orange[200]!;
            } else {
              // Default color
              return Colors.orange[50]!;
            }
          },
        ),
      ),
      child: Row(
        children: [
          // SizedBox(width: 3),
          Icon(
            Icons.audio_file_outlined, // You can use any audio-related icon here
            color: Colors.deepOrangeAccent.shade700,
            size: 20,
          ),
          // SizedBox(width: 8),
          Text(
            'बुकमार्क करा',
            style: TextStyle(
              color:Colors.deepOrangeAccent.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPlayBookmarkButton() {
    return TextButton(
      onPressed: () {

      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(3), // Adjust elevation for shadow effect
        shadowColor: MaterialStateProperty.all<Color>(Colors.grey), // Set shadow color
        minimumSize: MaterialStateProperty.all<Size>(const Size(40, 40)), // Set minimum button size
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(7)), // Adjust button padding
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            // Change button color based on states
            if (states.contains(MaterialState.pressed)) {
              // When pressed
              return Colors.orange[200]!;
            } else {
              // Default color
              return Colors.orange[50]!;
            }
          },
        ),
      ),

      child: Row(
        children: [
          Text(
            'बुकमार्क',
            style: TextStyle(
              color: Colors.deepOrangeAccent.shade700,
            ),
          ),
          // Adjust the space between the text and the icon
          Icon(
            Icons.play_arrow, // You can use any audio-related icon here
            color: Colors.deepOrangeAccent.shade700,
          ), // Adjust the space between the icon and the text "करा"
          Text(
            'करा',
            style: TextStyle(
              color: Colors.deepOrangeAccent.shade700,
            ),
          ),
        ],
      ),
    );
  }
  var extTextSize = 40.0;

  Stack buildReaderWidget() {
    return Stack(
      children: [
        ...buildReaderBackground(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.8,
          child: Focus(
            focusNode: widget.focusNodes[5],
            child: LyricsReader(
              padding: EdgeInsets.symmetric(horizontal: lyricPadding),
              model: lyricModel,
              position: playProgress,
              lyricUi: lyricUI,
              playing: playing,
              size: Size(double.infinity, MediaQuery.of(context).size.height / 1),
              emptyBuilder: () => Center(
                child: Text(
                  "No lyrics",
                  style: lyricUI.getOtherMainTextStyle(),
                ),
              ),
              selectLineBuilder: (progress, confirm) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.green),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.green),
                        height: 1,
                        width: double.infinity,
                      ),
                    ),
                    Text(
                      progress.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildPlayControl() {
    return [
      Container(
        height: 10,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, top: 15.0, bottom: 1.0), // Adjust the padding as needed
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0, top: 15.0, bottom: 1.0), // Adjust the padding as needed
          ),
        ],
      ),


      if (sliderProgress < max_value)

        Slider(
          min: 0,
          max: max_value,
          label: sliderProgress.toString(),
          value: sliderProgress,
          activeColor: Colors.deepOrangeAccent.shade700,
          inactiveColor: Colors.orange,
          onChanged: (double value) {
            setState(() {
              sliderProgress = value;
            });
          },
          onChangeStart: (double value) {
            isTap = true;

          },
          onChangeEnd: (double value) {

          },
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Focus(
            focusNode: widget.focusNodes[6], // Provide the focus node for the row
            child: TextButton(
              onPressed: () async {},
              child: Row(
                children: [
                  Icon(Icons.skip_previous, color: Colors.deepOrangeAccent.shade700, size: 40,),
                ],
              ),
            ),
          ),
          Container(width:40),
          Focus(
            focusNode: widget.focusNodes[7], // Provide the focus node for the row
            child:  ElevatedButton(
              onPressed: () async {},
              style:ButtonStyle(
                elevation: MaterialStateProperty.all<double>(3), // Adjust elevation for shadow effect
                shadowColor: MaterialStateProperty.all<Color>(Colors.grey), // Set shadow color
                minimumSize: MaterialStateProperty.all<Size>(const Size(40, 40)), // Set minimum button size
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(7)), // Adjust button padding
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    // Change button color based on states
                    if (states.contains(MaterialState.pressed)) {
                      // When pressed
                      return Colors.orange[200]!;
                    } else {
                      // Default color
                      return Colors.orange[50]!;
                    }
                  },
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    playing ? Icons.pause : Icons.play_arrow,
                    color: Colors.deepOrangeAccent[700],
                    size: 40,
                  ),
                ],
              ),
            ),
          ),

          Container(width:40),
          Focus(
            focusNode: widget.focusNodes[8], // Provide the focus node for the row
            child: TextButton(
              onPressed: () async {},
              child: Row(
                children: [
                  Icon(Icons.skip_next, color: Colors.deepOrangeAccent.shade700, size: 40),
                ],
              ),
            ),
          ),
        ],
      ),

      const SizedBox(height: 4),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Focus(
              // Assign a unique focus node to each widget
              focusNode: widget.focusNodes[10],
              child: buildBookmarkButton(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Focus(
              // Assign a unique focus node to each widget
              focusNode: widget.focusNodes[11],
              child: buildPlayBookmarkButton(),
            ),
          ),
        ],
      ),
    ];
  }

  var playing = false;

  List<Widget> buildReaderBackground() {
    return [
      Positioned.fill(
        child: Image.asset(
          'assets/audio/appicon1.png',
          fit: BoxFit.cover,
        ),
      ),
      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      )
    ];
  }

  var mainTextSize = 18.0;

  var lineGap = 16.0;
  var inlineGap = 10.0;
  var lyricAlign = LyricAlign.CENTER;
  var highlightDirection = HighlightDirection.LTR;

  void refreshLyric() {
    lyricUI = UINetease.clone(lyricUI);
  }
  var bias = 0.5;
  var lyricBiasBaseLine = LyricBaseLine.CENTER;

  Text buildTitle(String title) => Text(title,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green));

}
