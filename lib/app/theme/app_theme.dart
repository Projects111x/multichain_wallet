import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6552FE);
  static const Color secondary = Color(0xFF48D49E);
  static const Color orange = Color(0xFFFF8266);
  static const Color green = Color(0xFF4CAF50); // green

  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFF6C757D);

  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkGray = Color(0xFFB0B0B0);
}

class AppTheme {
  static const _baseTextTheme = TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontWeight: FontWeight.w700),
    bodyLarge: TextStyle(fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontWeight: FontWeight.w400),
    labelLarge: TextStyle(fontWeight: FontWeight.w600),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      surface: AppColors.white,
      onSurface: AppColors.gray,
      background: AppColors.white,
      onBackground: AppColors.gray,
      error: AppColors.orange,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.white,
    textTheme: _baseTextTheme.copyWith(
      headlineLarge: const TextStyle(color: AppColors.primary),
      headlineMedium: const TextStyle(color: AppColors.gray),
      headlineSmall: const TextStyle(color: Colors.black87),
      titleLarge: const TextStyle(color: Colors.black87),
      bodyLarge: const TextStyle(color: Colors.black87),
      bodyMedium: const TextStyle(color: AppColors.gray),
      bodySmall: const TextStyle(color: AppColors.gray),
      labelLarge: const TextStyle(color: AppColors.secondary),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(color: Colors.black87, width: 1.5),
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.black87),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black.withOpacity(0.04),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      hintStyle: const TextStyle(color: AppColors.gray),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin: EdgeInsets.zero,
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0x1F000000),
      thickness: 1,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black87,
      textColor: Colors.black87,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.gray,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
    chipTheme: ChipThemeData(
      color: WidgetStatePropertyAll(Colors.black.withOpacity(0.05)),
      labelStyle: const TextStyle(color: Colors.black87),
      shape: const StadiumBorder(side: BorderSide.none),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      surface: Colors.black,
      onSurface: Colors.white70,
      background: Colors.black,
      onBackground: Colors.white70,
      error: AppColors.orange,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: _baseTextTheme.copyWith(
      headlineLarge: const TextStyle(color: Colors.white),
      headlineMedium: const TextStyle(color: Colors.white70),
      headlineSmall: const TextStyle(color: Colors.white),
      titleLarge: const TextStyle(color: Colors.white),
      bodyLarge: const TextStyle(color: Colors.white),
      bodyMedium: const TextStyle(color: Colors.white70),
      bodySmall: const TextStyle(color: Colors.white70),
      labelLarge: const TextStyle(color: AppColors.secondary),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(color: Colors.white, width: 1.5),
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.06),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      hintStyle: const TextStyle(color: Colors.white70),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.black,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin: EdgeInsets.zero,
    ),
    dividerTheme: DividerThemeData(
      color: Colors.white.withOpacity(0.08),
      thickness: 1,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.white70,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
    chipTheme: ChipThemeData(
      color: WidgetStatePropertyAll(Colors.white.withOpacity(0.06)),
      labelStyle: const TextStyle(color: Colors.white),
      shape: const StadiumBorder(side: BorderSide.none),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
  );
}
