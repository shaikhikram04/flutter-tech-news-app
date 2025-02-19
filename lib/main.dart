import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tech_news/pages/home.dart';
import 'package:tech_news/utils/colors.dart';

void main() {
  runApp(kIsWeb
      ? DevicePreview(
          backgroundColor: Colors.white,
          enabled: true,
          defaultDevice: Devices.ios.iPhone13ProMax,
          isToolbarVisible: true,
          availableLocales: const [Locale('en', 'US')],
          tools: const [
            DeviceSection(
              model: true,
              orientation: false,
              frameVisibility: false,
              virtualKeyboard: false,
            ),
          ],
          devices: [
            Devices.android.samsungGalaxyA50,
            Devices.android.samsungGalaxyNote20,
            Devices.android.samsungGalaxyS20,
            Devices.android.samsungGalaxyNote20Ultra,
            Devices.android.onePlus8Pro,
            Devices.android.sonyXperia1II,
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone12,
            Devices.ios.iPhone12Mini,
            Devices.ios.iPhone12ProMax,
            Devices.ios.iPhone13,
            Devices.ios.iPhone13ProMax,
            Devices.ios.iPhone13Mini,
            Devices.ios.iPhoneSE,
          ],
          builder: (context) => const MyApp(),
        )
      : const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.primary,
      ),
      home: Home(),
    );
  }
}
