import 'package:codemagic/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter File Upload Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  static const platform = const MethodChannel("toast.flutter.io/toast");
  
  StartPage(){
    platform.invokeMethod("showToast");
  }

  void switchScreen(str, context) =>
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => UploadPage(url: str)
    ));
  @override
  Widget build(context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter File Upload Example')
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("Insert the URL that will receive the Multipart POST request (including the starting http://)", style: Theme.of(context).textTheme.headline),
            TextField(
              controller: controller,
              onSubmitted: (str) => switchScreen(str, context),
            ),
            FlatButton(
              child: Text("Take me to the upload screen"),
              onPressed: () => switchScreen(controller.text, context),
            )
          ],
        ),
      )
    );
  }
}