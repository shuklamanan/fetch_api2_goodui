import 'dart:convert';

// import 'package:fetch_api2_goodui/detailing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class newscreen extends StatefulWidget {
  const newscreen({super.key});

  @override
  State<newscreen> createState() => _firstscreen();
}

// ignore: camel_case_types
class _firstscreen extends State<newscreen> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api UI'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            final user = users[index];
            final namefirst = user['name']['first'];
            // final namelast = user['name']['last'];
            // final email = user['email'];
            // final phoneno = user['phone'];
            // final age = user['dob']['age'];
            // final city = user['location']['city'];
            // final state = user['location']['state'];
            // final postcode = user['location']['postcode'];
            // final country = user['location']['country'];
            // final streetno = user['location']['street']['number'];
            // final streetname = user['location']['street']['name'];
            final photo = user['picture']['large'];
            // final photo = user['picture']['thumbnail'];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160,
                          height: 180,
                          color: const Color.fromARGB(255, 42, 44, 46),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(photo),
                              Text(
                                namefirst,
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        // onTap: () {
                        //   details(
                        //       photo,
                        //       namefirst,
                        //       namelast,
                        //       email,
                        //       phoneno,
                        //       age,
                        //       city,
                        //       state,
                        //       postcode,
                        //       country,
                        //       streetno,
                        //       streetname);
                        // },
                      ),
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160,
                          height: 180,
                          color: const Color.fromARGB(255, 42, 44, 46),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                photo,
                                // width: 130,
                              ),
                              Text(
                                namefirst,
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        // onTap: () {
                        //   details(
                        //       photo,
                        //       namefirst,
                        //       namelast,
                        //       email,
                        //       phoneno,
                        //       age,
                        //       city,
                        //       state,
                        //       postcode,
                        //       country,
                        //       streetno,
                        //       streetname);
                        // },
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: fetchuser),
    );
  }

  void fetchuser() async {
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  }
}
