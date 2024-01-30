import 'package:flutter/material.dart';
import 'package:expanse_tracker/widgets/expenses.dart';

// this variable is a "seed" or "root" color for my theme...and it's easier to manage all the propreties further
var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 154, 33, 230));

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark, // this parameter adjust the brightness of the dark theme, it looks nice
  seedColor: const Color.fromARGB(255, 24, 48, 114),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          elevation: 10,
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          elevation: 10,
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            elevation: 12,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
              ),
            ),
      ),
      home: const Expenses(),
      themeMode: ThemeMode.dark,
    ),
  );
}
