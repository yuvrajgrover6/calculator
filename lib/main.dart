import 'package:calculator/modules/home/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

AppOpenAd? openAd;
Future<void> loadAd() async {
  await AppOpenAd.load(
      adUnitId: 'ca-app-pub-2232158818732423/1187709886',
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
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await dotenv.load(fileName: ".env");
  Hive.init((await getApplicationDocumentsDirectory()).path);

  var box = await Hive.openBox('exchange_rates');
  await loadAd();
  runApp(const MyApp());
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
