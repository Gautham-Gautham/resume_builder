import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder/Features/home_screen.dart';
import 'package:resume_builder/Resume/Screens/create_resume.dart';

final experienceDetailsProvider = StateProvider<List<ExperienceData>>(
  (ref) => [],
);
final skillDetailsProvider = StateProvider<List<Language>>(
  (ref) => [],
);
final educationDetailsProvider = StateProvider<List<Education>>(
  (ref) => [],
);
final hobbiesDetailsProvider = StateProvider<List<String>>(
  (ref) => [],
);
double w = 0.0;
double h = 0.0;
void main() {
  runApp(const MyApp());
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   late TemplateTheme theme = TemplateTheme.modern;
//   List<TemplateTheme> list = [
//     TemplateTheme.classic,
//     TemplateTheme.modern,
//     TemplateTheme.technical,
//     TemplateTheme.business,
//   ];
//   TemplateData data = TemplateData(
//       fullName: 'Alicia Smith',
//       currentPosition: 'Flutter Developer',
//       street: 'Curvy Str. 53',
//       address: 'Berlin, 14568',
//       country: 'Germany',
//       email: 'aliciasmith@wuerth.com',
//       phoneNumber: '+ 49 (106)341 753 12',
//       bio: "bio",
//       experience: [
//         ExperienceData(
//           experienceTitle: 'Software Engineer',
//           experienceLocation: ' Mindable Health',
//           experiencePeriod: 'Aug 2021 - Dec 2023',
//           experiencePlace: 'Berlin',
//           experienceDescription: "workExperienceCompany1",
//         ),
//         ExperienceData(
//           experienceTitle: 'Product Design',
//           experienceLocation: 'Uk . London',
//           experiencePeriod: 'Aug 2021 - Dec 2023',
//           experiencePlace: 'London',
//           experienceDescription: "workExperienceCompany2",
//         ),
//         ExperienceData(
//           experienceTitle: 'Flutter Developer',
//           experienceLocation: 'Uk . London',
//           experiencePeriod: 'Aug 2021 - Dec 2023',
//           experiencePlace: 'London',
//           experienceDescription: "workExperienceCompany3",
//         ),
//       ],
//       educationDetails: [
//         Education('Bachelor Degree', 'Oxford University'),
//         Education('Post Graduate Degree', 'Oxford University'),
//       ],
//       languages: [
//         Language('English', 5),
//         Language('French', 4),
//         Language('Spanish', 3),
//         Language('Mandarin', 2),
//         Language('Russian', 1),
//       ],
//       hobbies: [
//         'Bungee jumping',
//         'Fitness Studio',
//         'Martial Art',
//         'Vintage Art Collection'
//       ],
//       image:
//           'https://images.pexels.com/photos/3768911/pexels-photo-3768911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//       backgroundImage:
//           'https://images.pexels.com/photos/3768911/pexels-photo-3768911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
//   void getRandomItem(BuildContext context) {
//     final random = Random();
//     final index = random.nextInt(4);
//     theme = list[index];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         key: _scaffoldKey,
//         drawer: Drawer(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     getRandomItem(context);
//                     _scaffoldKey.currentState?.closeDrawer();
//                   });
//                 },
//                 child: const Text('Change Theme'),
//               )
//             ],
//           ),
//         ),
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: FlutterResumeTemplate(
//             data: data,
//             imageHeight: 100,
//             imageWidth: 100,
//             emailPlaceHolder: 'Email:',
//             telPlaceHolder: 'No:',
//             experiencePlaceHolder: 'Past',
//             educationPlaceHolder: 'School',
//             languagePlaceHolder: 'Skills',
//             aboutMePlaceholder: 'Me',
//             hobbiesPlaceholder: 'Past Times',
//             mode: TemplateMode.onlyEditableMode,
//             showButtons: true,
//             imageBoxFit: BoxFit.fitHeight,
//             enableDivider: false,
//             //backgroundColorLeftSection: Colors.amber,
//             templateTheme: theme),
//       ),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CreateResume(),
      debugShowCheckedModeBanner: false,
    );
  }
}

///sdjjnsjcnsnsnlsnsl

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
