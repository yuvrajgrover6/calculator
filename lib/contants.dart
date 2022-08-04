import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const kPrimaryColor = Colors.purple;
const kSecondaryColor = Color.fromARGB(255, 243, 210, 249);
const kThirdColor = Color.fromARGB(255, 218, 217, 217);
final hiveBox = Hive.box('exchange_rates');