import 'package:bloc_practice2/common/service/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

class Global{
  static late StorageService storageService;
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(

    );
    storageService = await StorageService().init();
  }
}