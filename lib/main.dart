import 'package:favorite_places/pages/add_new_place_page.dart';
import 'package:favorite_places/pages/home_page.dart';
import 'package:favorite_places/providers/favorite_places_provider.dart';
import 'package:favorite_places/providers/selected_image_provider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: const Color.fromARGB(255, 56, 49, 66),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritePlacesProvider()),
        ChangeNotifierProvider(create: (context) => SelectedImageProvider())
      ],
      child: const MyApp(),
    ),
  );
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/addNewPlacePage': (context) => const AddNewPlacePage(),
      },
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      title: 'Great Places',
      theme: theme,
      home: const HomePage(),
    );
  }
}
