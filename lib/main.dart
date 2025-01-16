import 'package:flutter/material.dart';
import 'package:paw_world/network/http_client.dart';
import 'package:paw_world/provider/adoption_form_provider.dart';
import 'package:paw_world/provider/category_pets_provider.dart';
import 'package:paw_world/provider/favourite_pets_provider.dart';
import 'package:paw_world/provider/login_provider.dart';
import 'package:paw_world/provider/pet_provider.dart';
import 'package:paw_world/provider/search_provider.dart';
import 'package:paw_world/provider/signup_provider.dart';
import 'package:paw_world/provider/theme_provider.dart';
import 'package:paw_world/screens/app_color.dart';
import 'package:paw_world/screens/login_signup/login.dart';
import 'package:paw_world/services/adoption_form_services.dart';
import 'package:paw_world/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'services/search_service.dart';

void main() {
  final PawWorldHttpClient httpClient = PawWorldHttpClient();
  final AuthService authService = AuthService(client: httpClient);
  final SearchService searchService = SearchService();
  final AdoptionFromService adoptionFromService =
      AdoptionFromService(client: httpClient);
  runApp(MyApp(
    authService: authService,
    httpClient: httpClient,
    searchService: searchService,
    adoptPet: adoptionFromService,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.authService,
    required this.searchService,
    required this.httpClient,
    required this.adoptPet,
  });

  final AuthService authService;
  final SearchService searchService;
  final PawWorldHttpClient httpClient;
  final AdoptionFromService adoptPet;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpProvider>(
          create: (context) => SignUpProvider(authService: authService),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(
            authService: authService,
          ),
        ),
        ChangeNotifierProvider<PetProvider>(
          create: (context) => PetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(
            searchPet: searchService,
          ),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(ThemeMode.light),
        ),
        ChangeNotifierProvider<CategoryPetsProvider>(
          create: (context) => CategoryPetsProvider(httpClient),
        ),
        ChangeNotifierProvider<FavoritePetsProvider>(
          create: (context) => FavoritePetsProvider(),
        ),
        ChangeNotifierProvider<AdoptionFromProvider>(
          create: (context) => AdoptionFromProvider(adoptPet: adoptPet),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.primary,
          ),
          scaffoldBackgroundColor: AppColor.primaryTextColor,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: const LoginPage(),
      ),
    );
  }
}
