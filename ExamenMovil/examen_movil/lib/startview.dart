import 'package:examen_movil/products.dart';
import 'package:flutter/material.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(body: SingleChildScrollView(
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
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
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
              flex: 19,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                    color: Color.fromARGB(0, 150, 149, 156),
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
                     
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                        Navigator.pushNamed(context, '/listGrid');
                            },
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 255, 1, 234)),
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
                                "Ver Todos los Articulos",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 86, 28, 180),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                            SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                            Navigator.pushNamed(context, '/listGrid');
                            },
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 255, 1, 234)),
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
                                "Ver Articulos Favoritos",
                                style: TextStyle(
                                  color:  Color.fromARGB(255, 86, 28, 180),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                            Navigator.pushNamed(context, '/listGrid');
                            },
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 255, 1, 234)),
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
                                "Cerrar Sesion",
                                style: TextStyle(
                                  color:  Color.fromARGB(255, 86, 28, 180),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    )),
              ),
            ),
          ]),
    ))
       );
  }
}
