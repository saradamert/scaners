import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scaner/Model.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  DetailsPage(this.id);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Product> product = [];

  Future<List<Product>> getProduct() async {
    var response = await http
        .get(Uri.parse("http://api.plos.org/search?q=id:${widget.id}"));
    product = productFromJson(json.decode(response.body)["response"]["docs"]);
    return product;
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getProduct(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var result = snapshot.data;
          return Scaffold(
            // ignore: unrelated_type_equality_checks
            body: result == null
                ? Center(
                    child: Text(
                      "Value : ${widget.id}",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Text(
                          "CODE: ${result.eissn}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          "ID: ${result.id}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          "NAME: ${result.journal}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          "COST: ${result.score}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
          );
        }
        return CircularProgressIndicator();
      },
    ));
}
