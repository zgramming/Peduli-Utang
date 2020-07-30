import 'package:flutter/material.dart';

class TestFcmScreen extends StatefulWidget {
  final String dataFCM;
  TestFcmScreen({this.dataFCM});
  static const routeNamed = '/test-fcm-screen';
  @override
  _TestFcmScreenState createState() => _TestFcmScreenState();
}

class _TestFcmScreenState extends State<TestFcmScreen> {
  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: Text('Data dari FCM : ${route ?? 'ga ada isinya'}'),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   String _message = '';
//   String _tokenFCM = '';
//   String _errorGoogleSignIn = '';
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<FirebaseUser> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;

//       final AuthCredential credential = GoogleAuthProvider.getCredential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       final AuthResult authResult = await _auth.signInWithCredential(credential);
//       final FirebaseUser user = authResult.user;

//       assert(!user.isAnonymous);
//       assert(await user.getIdToken() != null);

//       final FirebaseUser currentUser = await _auth.currentUser();
//       assert(user.uid == currentUser.uid);

//       // return 'signInWithGoogle succeeded: $user';
//       return user;
//     } on PlatformException catch (err) {
//       print("${err.message} Error Platform Coy");
//       throw err;
//     } catch (e) {
//       print("$e Error Unknown Coy");
//       throw e;
//     }
//   }

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   _register() {
//     firebaseMessaging.getToken().then((token) {
//       setState(() => _tokenFCM = token);
//       print(token);
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     var android = AndroidInitializationSettings('mipmap/ic_launcher');
//     var ios = IOSInitializationSettings();
//     var platform = InitializationSettings(android, ios);
//     flutterLocalNotificationsPlugin.initialize(platform, onSelectNotification: selectNotification);
//     getMessage();
//   }

// void getMessage() {
//   firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print('on message $message');
//         showNotification(message);
//         setState(() => _message = message["notification"]["title"]);
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print('on resume $message');
//         setState(() => _message = message["notification"]["title"]);
//         Navigator.of(context)
//             .pushNamed(message['data']['screen'], arguments: message['data']['body']);
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print('on launch $message');
//         setState(() => _message = message["notification"]["title"]);
//         Navigator.of(context)
//             .pushNamed(message['data']['screen'], arguments: message['data']['body']);
//       },
//       onBackgroundMessage: Fcm.myBackgroundMessageHandler);
// }

//   showNotification(Map<String, dynamic> msg) async {
//     var android = AndroidNotificationDetails(
//       'sdffds dsffds',
//       "CHANNLE NAME",
//       "channelDescription",
//     );
//     var iOS = IOSNotificationDetails();
//     var platform = NotificationDetails(android, iOS);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       "Disini Local Title",
//       "Disini Local Body",
//       platform,
//     );
//   }

//   Future selectNotification(String payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: ' + payload);
//     }
//     await Navigator.of(context).pushNamed(TestFcmScreen.routeNamed, arguments: payload);

//     // await Navigator.push(
//     //   context,
//     //   MaterialPageRoute(builder: (context) => SecondScreen(payload)),
//     // );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title ?? ""),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: SingleChildScrollView(
//           child: Column(
//             // Column is also a layout widget. It takes a list of children and
//             // arranges them vertically. By default, it sizes itself to fit its
//             // children horizontally, and tries to be as tall as its parent.
//             //
//             // Invoke "debug painting" (press "p" in the console, choose the
//             // "Toggle Debug Paint" action from the Flutter Inspector in Android
//             // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//             // to see the wireframe for each widget.
//             //
//             // Column has various properties to control how it sizes itself and
//             // how it positions its children. Here we use mainAxisAlignment to
//             // center the children vertically; the main axis here is the vertical
//             // axis because Columns are vertical (the cross axis would be
//             // horizontal).
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Text(
//                 'You have pushed the button this many times:',
//               ),
//               Text(
//                 '$_counter',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//               QrImage(size: 200, data: "123456789"),
//               Center(
//                 child: FlatButton(
//                   onPressed: scan,
//                   child: Text('Scan'),
//                 ),
//               ),
//               SelectableText("Message: $_message"),
//               SelectableText("Token FCM: $_tokenFCM"),
//               FlatButton(onPressed: _register, child: Text('Token FCM')),
//               SelectableText('Error Google SignIn : $_errorGoogleSignIn'),
//               FlatButton(
//                 child: const Text('Coba Login Google'),
//                 onPressed: () {
//                   signInWithGoogle()
//                       .then(
//                     (value) => Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: (context) => FirstScreen(user: value),
//                       ),
//                     ),
//                   )
//                       .catchError((onError) {
//                     setState(() => _errorGoogleSignIn = onError);
//                   });
//                   // signInWithGoogle().whenComplete(() => Navigator.of(context)
//                   //     .push(MaterialPageRoute(builder: (ctx) => FirstScreen())));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   Future scan() async {
//     final result = await BarcodeScanner.scan();
//     print(result.format);
//     print(result.formatNote);
//     print(result.rawContent);
//     print(result.type);
//     throw "errorrr";
//   }
// }

// class FirstScreen extends StatelessWidget {
//   final FirebaseUser user;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   FirstScreen({this.user});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('${user.email} || ${user.photoUrl} || ${user.displayName}'),
//             Image.network(
//               user.photoUrl,
//               height: 100,
//               width: 100,
//             ),
//             FlatButton(
//               onPressed: () => signOutGoogle(context),
//               child: Text('lOGOUT'),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> signOutGoogle(BuildContext context) async {
//     await googleSignIn.signOut().whenComplete(() =>
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => MyHomePage())));

//     print("User Sign Out");
//   }
// }

// class Fcm {
// static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
//   print("onBackgroundMessage: $message");
//   //_showBigPictureNotification(message);
//   return Future<void>.value();
// }
// }
