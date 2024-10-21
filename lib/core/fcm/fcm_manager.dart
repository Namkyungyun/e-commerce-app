// init firebase cloud messaging
// 1. connect firebase console, if you don't have firebase console project, you create project first.
// 2. set up firebaase CLI at your dev environment.
// 3. connect firebase login
// 4. active flutterfire_cli :: command :: $ dart pub global activate flutterfire_cli
// 5. automative enrollment your app to firebase and create lib/firbase_options.dart :: command :: flutterfire configure --project=e-commerce-app-81dd5 //firebase project id
// * flutterfire is comfortable package setup of firebase

// 6. set up android application id :: com.dev.e_commerce_app
// * Platform  Firebase App Id
// android   1:397186320225:android:e801e9c7190f72a7192720
// ios       1:397186320225:ios:4a17d891a8c37366192720

// 7. add to package :: command :: flutter pub add firebase_message
// * docs : firebase messaaging section in flutterfire docs

import 'package:firebase_messaging/firebase_messaging.dart';

class FcmManager {
  // 내부적으로는 필드를 들고 있지 않고 초기화만 해주면 된다.
  static void requestPermission() {
    FirebaseMessaging.instance.requestPermission();
  }

  // 사용자의 토큰 가져오기
  static void initialize() async {
    final token = await FirebaseMessaging.instance.getToken();
    print(token);
  }
}
