import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/providers/category_provider.dart';
import 'package:store_api_flutter_course/providers/product_provider.dart';
import 'package:store_api_flutter_course/providers/users_provider.dart';

import 'consts/global_colors.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => UsersProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter 3.0.4 ',
        theme: ThemeData(
          scaffoldBackgroundColor: lightScaffoldColor,
          primaryColor: lightCardColor,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: lightIconsColor,
            ),
            backgroundColor: lightScaffoldColor,
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
            elevation: 0,
          ),
          iconTheme: IconThemeData(
            color: lightIconsColor,
          ),
    
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.black,
            selectionColor: Colors.blue,
    
            // selectionHandleColor: Colors.blue,
          ),
    
          // textTheme: TextTheme()
          // textTheme: Theme.of(context).textTheme.apply(
          //       bodyColor: Colors.black,
          //       displayColor: Colors.black,
          //     ),
          cardColor: lightCardColor,
          brightness: Brightness.light, colorScheme: ThemeData().colorScheme.copyWith(
                secondary: lightIconsColor,
                brightness: Brightness.light,
              ).copyWith(background: lightBackgroundColor),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
