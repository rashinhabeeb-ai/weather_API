  import 'package:apiweatherapp/screens/home_page.dart';
import 'package:apiweatherapp/servieces/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) => LocationProvider(),)

     ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',

        theme: ThemeData(

          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

          iconTheme: IconThemeData(
            color: Colors.white
          ),

          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
          home:HomePage()
      ),
    );
  }
}