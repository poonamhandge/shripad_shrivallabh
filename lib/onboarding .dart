import 'dart:ui';
import 'package:charitramrut/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lyric/lyric_ui/lyric_ui.dart';
import 'package:flutter_lyric/lyric_ui/ui_netease.dart';
import 'package:flutter_lyric/lyrics_model_builder.dart';
import 'package:flutter_lyric/lyrics_reader_widget.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
class App extends StatefulWidget {
  final GlobalKey<OnboardingState> onboardingKey = GlobalKey<OnboardingState>();

  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}
class _AppState extends State<App> {
  final GlobalKey closeKey = GlobalKey();
  late List<FocusNode> focusNodes;
  int currentStepIndex = 0;
  @override
  void initState() {
    super.initState();


    focusNodes = List<FocusNode>.generate(
      20, // Number of onboarding steps
          (int i) => FocusNode(debugLabel: 'Onboarding Focus Node $i'),
      growable: false,
    );

    // Show onboarding steps when the page is opened
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      widget.onboardingKey.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
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
            color:Colors.orange[50],
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
          titleText: 'बुकमार्क केलेला अध्याय उघडा.',
          bodyText: 'सुरू ठेवण्यासाठी टॅप करा',

        ),
        OnboardingStep(
          focusNode: focusNodes[4],
          titleText: 'अध्याय वाचण्यासाठी अध्ययावर टॅप करा',
          bodyText: 'सुरू ठेवण्यासाठी टॅप करा',
        ),

        OnboardingStep(
          focusNode: focusNodes[5],
          titleText: ' वाचले म्हणून चिन्हांकित करा/न वाचलेले म्हणून चिन्हांकित करा',
          bodyText: 'सुरू ठेवण्यासाठी टॅप करा',


        ),
        //
        // OnboardingStep(
        //   focusNode: focusNodes[6],
        //   titleText: 'आधीचा अध्याय ऐकण्यासाठी या बटणावर टॅप करा',
        //   bodyText: 'सुरू ठेवण्यासाठी टॅप करा',
        // ),
        // OnboardingStep(
        //   focusNode: focusNodes[7],
        //   titleText: 'अध्याय प्ले/पॉज करा',
        //   bodyText: 'सुरू ठेवण्यासाठी टॅप करा',
        // ),
        // OnboardingStep(
        //   focusNode: focusNodes[8],
        //   titleText: 'पुढील अध्याय ऐकण्यासाठी या बटणावर टॅप करा',
        //   bodyText: 'सुरू ठेवण्यासाठी टॅप करा',
        // ),
        //
        // OnboardingStep(
        //   focusNode: focusNodes[10],
        //   titleText: 'अध्याय बुकमार्क करा',
        //   bodyText: 'ऐकायचे आहे त्या अध्यायाचा ओळी आणि ऑडिओ टाइमिंग सेव्ह करा\nसुरू ठेवण्यासाठी टॅप करा',
        // ),
        //
        // OnboardingStep(
        //   focusNode: focusNodes[11],
        //   titleText: 'बुकमार्क केलेले अध्याय प्ले करा ',
        //   bodyText: 'अध्यायाचा ओळी आणि ऑडिओ सेव्ह केला होता तेथून ऑडिओ प्ले करा\nसुरू ठेवण्यासाठी टॅप करा',
        // ),
        OnboardingStep(
          focusNode: focusNodes[6],
          titleText: 'अँप सुरुवात करा',
          bodyText: 'सुरू करण्याासाठी टॅप करा',
          textAlign: TextAlign.center,
          titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color:Colors.orange[50],
          ),
        ),

      ],
      onChanged: (stepIndex) {
        setState(() {
          currentStepIndex = stepIndex;
        });
        if (stepIndex == widget.onboardingKey.currentState!.widget.steps.length - 1) {
          // Navigate to the MainPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
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
  const OnboardingPage({Key? key, required this.focusNodes, required this.currentStepIndex}) : super(key: key);




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
  final pageController = PageController();
  late SharedPreferences prefs;
  Map<int, bool> readState = {};
  late List<Todo> todos;
  int currentStepIndex = 0;
 // Add this variable
  // Function to toggle the visibility of the buildContainer()
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
        leading: IconButton(
          focusNode: widget.focusNodes[1], // Focus on the leading icon
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text('श्रीपाद श्रीवल्लभ चरित्रामृत',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Focus(
        focusNode: widget.focusNodes[2],
        child: SizedBox(
          height: widget.currentStepIndex == 1 ? 500 : 900,
          child: ListView.builder(
            itemCount: widget.todos.length,
            itemBuilder: (context, index) {
              bool isRead = readState[index] ?? false;
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: Card(
                  surfaceTintColor: Colors.orangeAccent,
                  color: Colors.orange[50],
                  child: Focus( // Apply focus to the whole ListTile
                    focusNode: index == 3 ? widget.focusNodes[4] : null, // Use the specified focus node only for the desired item
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
                        ),
                      ),
                      onTap: () {
                        // Add onTap logic here
                      },
              trailing: Focus( // Apply focus to the IconButton
              focusNode: index == 3 ? widget.focusNodes[5] : null, // Use the specified focus node only for the desired item
              child: IconButton(
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
                ),
                ),
              );
            },
          ),
        ),
      ),



      floatingActionButton: FloatingActionButton(
          focusNode: widget.focusNodes[3],
          tooltip: ('बुकमार्क केलेला अध्याय उघडा'),
          backgroundColor: Colors.orange,
          child: const Icon(
            Icons.bookmark,
            color: Colors.white,
          ),
          onPressed: () async {
            SharedPreferences prefs1 = await SharedPreferences.getInstance();
            // ignore: use_build_context_synchronously
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
