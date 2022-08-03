import 'package:calculator/modules/home/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

AppOpenAd? openAd;
Future<void> loadAd() async {
  await AppOpenAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/3419835294',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          print('ad loader');
          openAd = ad;
          openAd!.show();
        },
        onAdFailedToLoad: (error) {
          print('ad load failer $error');
        },
      ),
      orientation: AppOpenAd.orientationPortrait);
}

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await loadAd();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Revamph Calculator',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
