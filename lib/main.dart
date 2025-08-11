import 'package:flutter/material.dart';
import 'package:app_rick_and_morty/pages/details_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Rick & Morty App',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeId:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const HomePage(),
            );
            case DetailsPage.routeId:
              int characterId = settings.arguments as int;
              return MaterialPageRoute(
                settings: settings,
                builder: (context) => DetailsPage(characterId: characterId),
              );
            default:
              return null;  
        }
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
      ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';  
// import 'package:app_rick_and_morty/pages/details_page.dart';
// import 'pages/home_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Rick & Morty App',
//       onGenerateRoute: (settings) {
//         switch (settings.name) {
//           case HomePage.routeId:
//             return MaterialPageRoute(
//               settings: settings,
//               builder: (context) => const HomePage(),
//             );
//           case DetailsPage.routeId:
//           int characterId = settings.arguments as int;
//             return MaterialPageRoute(
//               settings: settings,
//               builder: (context) => DetailsPage(characterId: characterId),
//             );
//             default:
//               return null;
//         }
//       },
//        theme: ThemeData(
//         textTheme: GoogleFonts.latoTextTheme(
//           Theme.of(context).textTheme,
//         ),
//       ),
//     );
//         }
//       }
      

     
