import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFF8F8F8),
    primarySwatch: _createMaterialColor(Color(0xFFD32F2F)),
    primaryColor: Color(0xFFD32F2F),
    primaryColorLight: Color(0xFFFF6659),
    primaryColorDark: Color(0xFF9A0007),
    hintColor: Color(0xFF1976D2),
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: ColorScheme.light(
      primary: Color(0xFFD32F2F),
      secondary: Color(0xFF1976D2),
      surface: Colors.white,
      background: Color(0xFFF8F8F8),
      error: Color(0xFFD32F2F),
    ),

    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2E2E2E),
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFFD32F2F), // Red for headings
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF2E2E2E),
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFFD32F2F), // Red for headlines
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xFF424242),
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF2E2E2E),
      ),
      bodyLarge: GoogleFonts.poppins(fontSize: 16, color: Color(0xFF424242)),
      bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF616161)),
      bodySmall: GoogleFonts.poppins(fontSize: 12, color: Color(0xFF757575)),
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFD32F2F), // Red app bar
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      elevation: 2,
      shadowColor: Color(0xFFD32F2F).withOpacity(0.3),
    ),

    // Input Fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFE0E0E0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFD32F2F)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFD32F2F),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        shadowColor: Color(0xFFD32F2F).withOpacity(0.3),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFFD32F2F),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xFFD32F2F),
        side: BorderSide(color: Color(0xFFD32F2F)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: Colors.white,
      shadowColor: Color(0x1A000000),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.all(8),
      surfaceTintColor: Colors.white,
    ),

    // Dialogs
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFFD32F2F),
      ),
      contentTextStyle: GoogleFonts.poppins(
        fontSize: 16,
        color: Color(0xFF424242),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // Bottom Sheets
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      modalBackgroundColor: Colors.white,
      modalElevation: 8,
    ),

    // Switch
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.selected)) {
          return Color(0xFFD32F2F);
        }
        return Color(0xFFBDBDBD);
      }),
      trackColor: MaterialStateProperty.resolveWith<Color>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.selected)) {
          return Color(0xFFD32F2F).withOpacity(0.5);
        }
        return Color(0xFFE0E0E0);
      }),
    ),

    // Slider
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xFFD32F2F),
      inactiveTrackColor: Color(0xFFD32F2F).withOpacity(0.3),
      thumbColor: Color(0xFFD32F2F),
      overlayColor: Color(0xFFD32F2F).withOpacity(0.2),
      valueIndicatorColor: Color(0xFFD32F2F),
      valueIndicatorTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Progress Indicator
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color(0xFFD32F2F),
      circularTrackColor: Color(0xFFD32F2F).withOpacity(0.2),
    ),

    // Icons
    iconTheme: IconThemeData(color: Color(0xFF424242), size: 24),

    // SnackBars
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Color(0xFF323232),
      contentTextStyle: GoogleFonts.poppins(color: Colors.white),
      actionTextColor: Color(0xFFFF6659),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

    // Divider
    dividerTheme: DividerThemeData(
      color: Color(0xFFEEEEEE),
      thickness: 1,
      space: 0,
    ),

    // Bottom Navigation Bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFFD32F2F),
      unselectedItemColor: Color(0xFF9E9E9E),
      selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
      unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
      elevation: 4,
      type: BottomNavigationBarType.fixed,
    ),

    // Floating Action Button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFD32F2F),
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF121212),
    primarySwatch: _createMaterialColor(Color(0xFFEF5350)),
    primaryColor: Color(0xFFEF5350),
    primaryColorLight: Color(0xFFFF8A80),
    primaryColorDark: Color(0xFFB61827),
    hintColor: Color(0xFFEF5350),
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFFEF5350),
      secondary: Color(0xFFEF5350),
      surface: Color(0xFF1E1E1E),
      background: Color(0xFF121212),
      error: Color(0xFFEF5350),
    ),

    // Text Themes
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFFEF5350),
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFFEF5350),
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.poppins(fontSize: 16, color: Color(0xFFE0E0E0)),
      bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFB0B0B0)),
      bodySmall: GoogleFonts.poppins(fontSize: 12, color: Color(0xFF9E9E9E)),
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.5),
    ),

    // Input Fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF2A2A2A),
      hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFF404040)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFF404040)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFEF5350), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFEF5350)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFEF5350), width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFEF5350),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFFEF5350),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xFFEF5350),
        side: BorderSide(color: Color(0xFFEF5350)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: Color(0xFF1E1E1E),
      shadowColor: Colors.black.withOpacity(0.5),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.all(8),
      surfaceTintColor: Color(0xFF1E1E1E),
    ),

    // Dialogs
    dialogTheme: DialogThemeData(
      backgroundColor: Color(0xFF2A2A2A),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFFEF5350),
      ),
      contentTextStyle: GoogleFonts.poppins(
        fontSize: 16,
        color: Color(0xFFE0E0E0),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // Bottom Sheets
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Color(0xFF2A2A2A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      modalBackgroundColor: Color(0xFF2A2A2A),
      modalElevation: 8,
    ),

    // Switch
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.selected)) {
          return Color(0xFFEF5350);
        }
        return Color(0xFF757575);
      }),
      trackColor: MaterialStateProperty.resolveWith<Color>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.selected)) {
          return Color(0xFFEF5350).withOpacity(0.5);
        }
        return Color(0xFF424242);
      }),
    ),

    // Slider
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xFFEF5350),
      inactiveTrackColor: Color(0xFFEF5350).withOpacity(0.3),
      thumbColor: Color(0xFFEF5350),
      overlayColor: Color(0xFFEF5350).withOpacity(0.2),
      valueIndicatorColor: Color(0xFFEF5350),
      valueIndicatorTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Progress Indicator
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color(0xFFEF5350),
      circularTrackColor: Color(0xFFEF5350).withOpacity(0.2),
    ),

    // Icons
    iconTheme: IconThemeData(color: Color(0xFFE0E0E0), size: 24),

    // SnackBars
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Color(0xFF323232),
      contentTextStyle: GoogleFonts.poppins(color: Colors.white),
      actionTextColor: Color(0xFFFF8A80),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

    // Divider
    dividerTheme: DividerThemeData(
      color: Color(0xFF404040),
      thickness: 1,
      space: 0,
    ),

    // Bottom Navigation Bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFFEF5350),
      unselectedItemColor: Color(0xFF9E9E9E),
      selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
      unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
      elevation: 4,
      type: BottomNavigationBarType.fixed,
    ),

    // Floating Action Button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFEF5350),
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  // Helper function to create MaterialColor from a single color
  static MaterialColor _createMaterialColor(Color color) {
    List<double> strengths = [.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}

// Custom color extensions for easy access
extension BloodDonationColors on ColorScheme {
  Color get bloodRed =>
      brightness == Brightness.light ? Color(0xFFD32F2F) : Color(0xFFEF5350);

  Color get emergencyRed =>
      brightness == Brightness.light ? Color(0xFFC62828) : Color(0xFFE53935);

  Color get bloodTypeO =>
      brightness == Brightness.light ? Color(0xFFD32F2F) : Color(0xFFEF5350);

  Color get bloodTypeA =>
      brightness == Brightness.light ? Color(0xFF1976D2) : Color(0xFFEF5350);

  Color get bloodTypeB =>
      brightness == Brightness.light ? Color(0xFF388E3C) : Color(0xFF81C784);

  Color get bloodTypeAB =>
      brightness == Brightness.light ? Color(0xFF7B1FA2) : Color(0xFFBA68C8);

  Color get successGreen =>
      brightness == Brightness.light ? Color(0xFF43A047) : Color(0xFF66BB6A);

  Color get warningYellow =>
      brightness == Brightness.light ? Color(0xFFFFA000) : Color(0xFFFFB74D);

  Color get infoBlue =>
      brightness == Brightness.light ? Color(0xFF1976D2) : Color(0xFFEF5350);
}
