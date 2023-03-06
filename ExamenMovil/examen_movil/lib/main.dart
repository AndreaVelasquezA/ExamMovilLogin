import 'package:examen_movil/config.dart';
import 'package:examen_movil/controllers/auth_controller.dart';
import 'package:examen_movil/listArticFavorit.dart';
import 'package:examen_movil/listArticView.dart';
import 'package:examen_movil/models/login_request_model.dart';
import 'package:examen_movil/models/login_response_model.dart';
import 'package:examen_movil/pages/login_page.dart';
import 'package:examen_movil/products.dart';
import 'package:examen_movil/services/api_service.dart';
import 'package:examen_movil/startview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';

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
    
      initialRoute: "/",
      routes: {
        "/" :(context) => const LoginPage(),
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

  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String?  username;
  String?  password;

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

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormHelper.inputFieldWidget(
                            context,
                            "username", 
                            "UserName", 
                            (onValidateVal){
                              if(onValidateVal.isEmpty){
                                return "Username Can \'t be empty";
                              }
                              return null;
                            }, 
                            (onSavedVal){
                              username = onSavedVal;
                            },
                            borderFocusColor: Colors.white,
                            prefixIconColor: Colors.white,
                            borderColor: Colors.white,
                            textColor: Colors.white,
                            hintColor: Colors.white,
                            borderRadius: 10 ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormHelper.inputFieldWidget(
                            context,
                            "password", 
                            "Password", 
                            (onValidateVal){
                              if(onValidateVal.isEmpty){
                                return "Password Can \'t be empty";
                              }
                              return null;
                            }, 
                            (onSavedVal){
                              password = onSavedVal;
                            },
                            borderFocusColor: Colors.white,
                            prefixIconColor: Colors.white,
                            borderColor: Colors.white,
                            textColor: Colors.white,
                            hintColor: Colors.white,
                            borderRadius: 10,
                            obscureText: hidePassword,
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  hidePassword = !hidePassword;
                                });          
                              }, 
                              color: Colors.white.withOpacity(0.7),
                              icon: Icon(
                                hidePassword ? Icons.visibility_off : Icons.visibility
                              ),
                              ) ),

                        ),

                        Center(
                          child: FormHelper.submitButton(
                            "Login",
                            (){
                              if(validateAndSave()){
                                setState(() {
                                  isAPIcallProcess = true;
                                });
                        
                                LoginRequestModel model = LoginRequestModel(username: username!, password: password!);
                        
                                APIService.login(model).then((response) {
                        
                                  setState(() {
                                    isAPIcallProcess = false;
                                  });
                        
                                  if(response){
                                    Navigator.pushNamedAndRemoveUntil(
                                      context, 
                                      '/startView', 
                                      (route) => false,
                                      );
                                  }
                                  else{
                                    FormHelper.showSimpleAlertDialog(
                                    context, 
                                    Config.appName, 
                                    "Invalid Username/password", 
                                    "ok", 
                                    (){
                                      Navigator.pop(context);
                                    }
                                    );
                                  }
                                });
                              }
                            },
                            btnColor: HexColor("#283B71"),
                            borderColor: Colors.white,
                            txtColor: Colors.white,
                            borderRadius: 10,
                            ),
                        ),
                        
                      ],
                    )),
              ),
            ),
          ]),
    ))
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  bool validateAndSave(){
    final form = globalFormKey.currentState;

    print(form);

    if (form!.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }

}
