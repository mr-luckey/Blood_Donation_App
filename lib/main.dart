// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:monex/Components/Onbording/View/splash/Splash_Screen.dart';
// import 'package:theme_manager/theme_manager.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MainApp());
// }

// class MainApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ThemeManager(
//       // backgroundColor: Colors.white,
//       // defaultBrightnessPreference: BrightnessPreference.light,
//       data: (Brightness brightness) => ThemeData(
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(
//             color: Colors.black,
//             fontStyle: GoogleFonts.poppins().fontStyle,
//           ),
//           bodyMedium: TextStyle(
//             color: Colors.black,
//             fontStyle: GoogleFonts.poppins().fontStyle,
//           ),
//           bodySmall: TextStyle(
//             color: Colors.black,
//             fontStyle: GoogleFonts.poppins().fontStyle,
//           ),
//         ),

//         primarySwatch: Colors.blue,
//         // primaryColorDark: Colors.purple,
//         brightness: brightness,
//       ),
//       themedBuilder: (BuildContext context, ThemeState theme) {
//         return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Monex',
//           theme: theme.themeData,
//           home: const splashScreen(),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monex/Components/Onbording/View/splash/Splash_Screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monex',
      themeMode: ThemeMode.system, // Use system setting
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const splashScreen(),
    );
  }
}
