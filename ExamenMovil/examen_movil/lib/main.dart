import 'package:examen_movil/controllers/auth_controller.dart';
import 'package:examen_movil/listArticFavorit.dart';
import 'package:examen_movil/listArticView.dart';
import 'package:examen_movil/products.dart';
import 'package:examen_movil/startview.dart';
import 'package:flutter/material.dart';

import 'listArticGrid.dart';




void main() {
  runApp(
  const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     
   

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    
      initialRoute: "/startView",
      routes: {
        "/main": (context) => const MyHomePage(title: 'Flutter Demo Home Page'),    
        "/products": (context) => const ListArticView(),  
        "/listGrid": (context) => const ListArticGrid(), 
        "/startView": (context) => const StartView(),     
        "/listarticfav": (context) => const ListArticFavoritGrid(),     

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    AuthController authController = AuthController();
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/backExam.png"), fit: BoxFit.cover)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/loginoptions');
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 207, 207, 207)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(231, 237, 235, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                          ))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17),
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.grey[600],
                          size: 23.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                    color: Color.fromARGB(137, 150, 149, 156),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Color.fromARGB(255, 140, 0, 255),
                            fontSize: 45,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: authController.usernameController,
                          //keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(26),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Color(0xFFe7edeb),
                              hintText: "Username",
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey[600],
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                         controller: authController.passwordController,
                          //keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(26),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Color.fromRGBO(231, 237, 235, 1),
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.grey[600],
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 180,
                          child: ElevatedButton(
                            onPressed: () {
                            authController.loginUser();
                            },
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 207, 207, 207)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(231, 237, 235, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                ))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ]),
    ))
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
