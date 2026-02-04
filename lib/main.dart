import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monex/Components/Onbording/View/splash/Splash_Screen.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      defaultBrightnessPreference: BrightnessPreference.light,

      data: (Brightness brightness) => ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black,
            fontStyle: GoogleFonts.poppins().fontStyle,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontStyle: GoogleFonts.poppins().fontStyle,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontStyle: GoogleFonts.poppins().fontStyle,
          ),
        ),

        primarySwatch: Colors.blue,
        primaryColorDark: Colors.purple,
        brightness: brightness,
      ),
      themedBuilder: (BuildContext context, ThemeState theme) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Monex',
          theme: theme.themeData,
          home: const splashScreen(),
        );
      },
    );
  }
}
