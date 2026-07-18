import 'package:flutter/material.dart';

// ── 1. Named colors — one source of truth (from your design palette [17]) ──
class AppColors {
  static const surface = Color(0xFFF7F6F5); // light background
  static const surfaceDark = Color(0xFF161514); // dark background
  static const ink = Color(0xFF201E1D); // main text
  static const accent = Color(0xFFEC3013); // the red
  static const muted = Color(0xFF8B8785); // secondary text
  static const divider = Color(0xFFE0E0EE);
}

// A flat, zero-radius button/FAB shape — the "Modernist" look, reused in both themes.
const _flatShape = RoundedRectangleBorder(borderRadius: BorderRadius.zero);

class AppTheme {
  // ── 2. LIGHT theme ──
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor:
        AppColors.surface, // every Scaffold gets this bg for free
    // colorScheme derives a full palette from one seed color:
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      primary: AppColors.accent,
      surface: AppColors.surface,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.ink, // title/icon color
      elevation: 0, // flat, no shadow
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 2,
      space: 5,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        shape: _flatShape,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
      shape: _flatShape,
    ),
  );

  // ── 3. DARK theme (same recipe, dark surfaces) ──
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.surfaceDark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      brightness: Brightness.dark,
      primary: AppColors.accent,
      surface: AppColors.surfaceDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.white24,
      thickness: 2,
      space: 5,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        shape: _flatShape,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
      shape: _flatShape,
    ),
  );
}
