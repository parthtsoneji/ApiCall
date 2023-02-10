import 'dart:convert';
import 'package:apicall/UserModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String? respomseString;
class _HomeScreenState extends State<HomeScreen> {

  List<UserData>? DecodeJson;

  @override
  void initState() {
    apicall();
    super.initState();
  }

  Future<void> apicall() async {
    String url = "https://jsonplaceholder.typicode.com/todos/";
    var FetchApi = await http.get(Uri.parse(url));
    DecodeJson = jsonDecode(FetchApi.body)
    .map((item) => UserData.fromJson(item)).toList()
    .cast<UserData>();
    setState(() {

    });
  }
    // final response = http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/"));
    // if(response.toString() == 200){
    //   setState(() {
    //     respomseString = response.toString();
    //   });
    // }

   // var api = await Dio().get("https://jsonplaceholder.typicode.com/todos/");
   //  print(api);
   //  // http.Response response;
   //  // response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/"));
   //  if(api.statusCode == 200){
   //    setState(() {
   //      respomseString = api.toString();
   //    });
   //  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("API Calling"),
          ),
        body: Column(
          children: [
            if (DecodeJson != null)
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: DecodeJson?.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),child: Center(child: Text(DecodeJson![index].id.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DecodeJson![index].userId.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                              const SizedBox(height: 4),
                              SizedBox(
                                  height: 55,
                                  width: 150,
                                  child: Text(DecodeJson![index].title.toString(),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 12),
                                      maxLines: 5)),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 50,

                                      decoration: BoxDecoration(
                                          color: (DecodeJson![index].completed == false)
                                              ? Colors.blue
                                              : Colors.deepPurpleAccent,
                                          borderRadius: BorderRadius.circular(8.0)),
                                      child: Center(
                                        child: Text(
                                          DecodeJson![index].completed.toString(),
                                          style: const TextStyle(
                                              color: Colors.white, fontSize: 13.5)
                                        ),
                                      ),
                                    ),
                                  ] ),
                              ),
                            ]),
                        ]),
                    ),
                  ),
                );
              }),
            ),
          ],
        )
        )
    );
  }
}

