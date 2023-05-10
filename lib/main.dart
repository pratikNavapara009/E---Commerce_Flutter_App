import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/helpers/theme_helpers.dart';
import 'package:e_commerce/screens/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart_model.dart';

Future<void> main() async {
  runApp(
    kIsWeb
        ? DevicePreview(
            enabled: !kReleaseMode,
            builder: (context) => MyApp(),
          )
        : MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CartItems()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context,_){
        return MaterialApp(
          title: 'Super Store',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode:
          (Provider.of<ThemeProvider>(context).themeModel.isDark == false)
              ? ThemeMode.light
              : ThemeMode.dark,
          home: Splash(),
        );
      },
    );
  }
}
