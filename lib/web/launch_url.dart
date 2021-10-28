import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

//このモジュールを用いるときは
//android/app/src/main/AndroidManifest.xmlの最後の</manifest>の前に
//    <queries>
//        <intent>
//            <action android:name="android.intent.action.VIEW" />
//            <data android:scheme="https" />
//        </intent>
//        <intent>
//            <action android:name="android.intent.action.DIAL" />
//            <data android:scheme="tel" />
//        </intent>
//        <intent>
//            <action android:name="android.intent.action.SEND" />
//            <data android:mimeType="*/*" />
//        </intent>
//    </queries>
//を挿入する必要があることに注意

const _url = 'https://www.google.com/';

void launchURL({String url = _url}) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

Future<String> request(String url) async {
  Uri uri = Uri.parse(url);
  http.Response res = await http.get(uri);
  return res.body;
}
