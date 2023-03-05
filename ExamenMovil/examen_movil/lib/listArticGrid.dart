import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListArticGrid extends StatefulWidget {
  const ListArticGrid({Key? key}) : super(key: key);

  @override
  _ListArticGridState createState() => _ListArticGridState();
}

class _ListArticGridState extends State<ListArticGrid> {
  var status = 0;
  List<dynamic> productss = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Articulos"),
          backgroundColor:   Color.fromARGB(255, 140, 0, 255),
          actions: [
            IconButton(
              //if 0 then display icon list if other than zero display icon grid
              icon: status == 0 ? Icon(Icons.list) : Icon(Icons.grid_on_outlined),
              tooltip: 'Escoger',
              onPressed: () {
                //required to add state,
                //setstate is used to change the state,
                //when the status variable is changed, the whole page will be re-rendered automatically
                setState(() {
                  if (status == 0) {
                    status = 1;
                  } else {
                    status = 0;
                  }
                });
              },
            ),
          ],
        ),
        // if status 0 then show lisview if status other than 0 show grid view
        body: status == 0
            ? ListView.builder(
                itemCount: productss.length,
                itemBuilder: (context, index) {
                  final product = productss[index];
                  final nombreArticle = product['nombreart'];
                  final nombreVendedor = product['nombreven'];
                  final calificacion = product['rate'];
                  final favorito = product['favorite'];
                  final image = product['imagen'];
                  return Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(111, 34, 33, 33),
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        nombreArticle + "\n" + nombreVendedor,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black87,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(
                        calificacion,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black87,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      leading: Container(
                          height: 60,
                          width: 60,

                          // fixed width and height
                          child: Image.network(image)),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite_border, size: 20),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
              )
              
              
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (_, index) {
                  final product = productss[index];
                  final nombreArticle = product['nombreart'];
                  final nombreVendedor = product['nombreven'];
                  final calificacion = product['rate'];
                  final favorito = product['favorite'];
                  final image = product['imagen'];
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Card(
                      //add shadow
                      elevation: 5,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover)),
                          ),
                          ListTile(
                            title: Text(
                              nombreArticle + "\n" + nombreVendedor,
                              style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.black87,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            subtitle: Text(
                              calificacion,
                              style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.black87,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.favorite_border, size: 20),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: productss.length,
              ),
               floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        backgroundColor: Color.fromARGB(31, 206, 100, 255),
      ),);
  }

  void fetchUsers() async {
    print('llamando');
    const url = 'https://api.npoint.io/1705c1d0425eed01306c';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      productss = json['articles'];
    });

    print('completado');
    print(productss);
  }
}

final List<IconData> icons = <IconData>[
  Icons.favorite,
  Icons.favorite,
  Icons.favorite,
  Icons.favorite,
  Icons.favorite,
  Icons.favorite,
];

/*List ima = [
  "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/airpods/airpods-pro-2gen-front-case.png", //airp
  "https://support.apple.com/content/dam/edam/applecare/images/en_US/psp_content/content-block-md-apple-tv_2x.png", //tele
  "https://support.apple.com/content/dam/edam/applecare/images/es_CO/psp_content/content-block-md-safety-SOS_2x.png", //celu
  "https://support.apple.com/content/dam/edam/applecare/images/en_US/psp_content/content-block-md-new-in-macos_2x.png", //compu
  "https://support.apple.com/content/dam/edam/applecare/images/en_US/psp_content/content-block-md-watch-ultra_2x.png", //reloj
  "https://help.apple.com/assets/61AFEC45FA5233173908347B/61B0509E1BF38548362237B5/es_419/b9f519195f84950573eea5088a49b964.png", //audifo

];*/

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}
