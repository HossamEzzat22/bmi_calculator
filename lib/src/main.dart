import 'package:flutter/material.dart';
import 'package:session5_task/services/sharedpreferences_helper.dart';

import 'app_root.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrenceHelper.init();
  runApp(AppRoot());
}