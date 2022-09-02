import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:almadalla/screens/LoginPage.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
//import 'package:flutter_webview_pro/webview_flutter.dart';

//import 'package:webview_flutter_upload/webview_flutter.dart';
// Chnages have been done by me on location C:\src\flutter\.pub-cache\hosted\pub.dartlang.org\webview_pro_android-2.8.3+2\android\src\main\java\io\flutter\plugins\webviewflutter\WebChromeClientHostApiImpl.java
// on line No :-249 to 275
// earlier this code was like below replace it once the take picture issue is solved
// private static void takePhotoOrOpenGallery() {
//   if (WebViewFlutterPlugin.activity==null||!FileUtil.checkSDcard(WebViewFlutterPlugin.activity)) {
//     return;
//   }
//   String[] selectPicTypeStr = {WebViewFlutterPlugin.activity.getString(R.string.take_photo),
//           WebViewFlutterPlugin.activity.getString(R.string.photo_library)};
//   new AlertDialog.Builder(WebViewFlutterPlugin.activity)
//           .setOnCancelListener(new ReOnCancelListener())
//           .setItems(selectPicTypeStr,
//                   new DialogInterface.OnClickListener() {
//                     @Override
//                     public void onClick(DialogInterface dialog, int which) {
//                       switch (which) {
//                         // 相机拍摄
//                         case 0:
//                           openCamera();
//                           break;
//                         // 手机相册
//                         case 1:
//                           openImageChooserActivity();
//                           break;
//                         default:
//                           break;
//                       }
//                     }
//                   }).show();
// }
class webpage extends StatefulWidget {
  const webpage({Key? key}) : super(key: key);

  @override
  State<webpage> createState() => _webpageState();
}

class _webpageState extends State<webpage> {
  @override
  Widget build(BuildContext context) {
    late WebViewController controller;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Theemall",
      home: WillPopScope(
        onWillPop: () async {
          String? url = await controller.currentUrl();
          if (url == "https://payer.almadallah.ae/w1.aspx") {
            return true;
          } else {
            controller.goBack();
            return false;
          }
        },
        child: Scaffold(
          //below start code of app bar i.e only for ios build
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('   Welcome To Insurance Portal'),
              // centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
              backgroundColor: Color(0xFFeeede7),
              elevation: 0,
              actions: <Widget>[
                FlatButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage(
                                  title: '',
                                )));
                  },
                  textColor: Colors.black,
                  child: Text(
                    "Go to \nSelf Funded Portal",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                )
              ]
              // iconTheme: IconThemeData(color: Colors.black),
              // leading: IconButton(
              //     icon: Icon(Icons.arrow_back_ios),
              //     color: Colors.black87,
              //     onPressed: () async {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => LoginPage(
              //                     title: '',
              //                   )));
              //     }
              //     // {
              //     //   Navigator.of(context).pop();
              //     // },

              //     // leading: Icon(Icons.arrow_back_ios,color: Colors.white,
              //     // ),
              //     ),
              ),
          // app bar code ends
          body: Container(
            child: SafeArea(
              child: WebView(
                userAgent: "mobile", //Add this to resolve issue
                initialUrl: 'https://payer.almadallah.ae/w1.aspx',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController wc) {
                  controller = wc;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
