import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

Future<Dog> getCountries() async {
  const url = 'https://dog.ceo/api/breeds/image/random';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return Dog.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('An error occured');
  }
}

class Dog {
  final String image;

  Dog({required this.image});

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      image: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dogify',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.green,
      ),
      home: const Dogify(),
    );
  }
}

class Dogify extends StatefulWidget {
  const Dogify({Key? key}) : super(key: key);

  @override
  State<Dogify> createState() => _DogifyState();
}

class _DogifyState extends State<Dogify> {
  late Future<Dog> myData;

  @override
  void initState() {
    myData = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog\'s API 🐕 🐕 🐕', style: TextStyle(fontSize: 14,),),
      ),
      body: FutureBuilder<Dog>(
          future: myData,
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Stack(
                children: [
                  Image(image: NetworkImage(snapshot.data!.image)),
                  Positioned(top: 10, right: 15,child: Container( decoration: BoxDecoration(color: Colors.purple,borderRadius: BorderRadius.circular(12)), padding: EdgeInsets.all(12),child: Text(snapshot.data!.image.split('breeds\/')[1].split('/')[0])),)
                ],
              ),
             
            );
          })),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myData = getCountries();
          setState(() { });
        },
        child: const Icon(Icons.swap_vert_circle, color: Colors.white,),
      ),
    );
  }
}
