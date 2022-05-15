import 'package:dogify/ui/dev.dart';
import 'package:dogify/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
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
  void launchEmail() async {
    String url = 'https://github.com/Karumaidoi/dogify';

    await canLaunch(url) ? launch(url) : print('Unable');
  }

  int index = 0;
  // ignore: non_constant_identifier_names
  final Screens = [
    HomeDog(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dog\'s API 🐕 🐕 🐕',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                launchEmail();
              },
              icon: const Icon(
                Icons.source,
                color: Colors.white,
              ))
        ],
      ),
      body: Screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          // indicatorColor: Colors.blue.shade200,
          labelTextStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          )),
        ),
        child: NavigationBar(
            selectedIndex: index,
            height: 80,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                  selectedIcon: Icon(Icons.home_filled)),
              NavigationDestination(
                  icon: Icon(Icons.code),
                  label: 'Dev',
                  selectedIcon: Icon(Icons.code)),
            ]),
      ),
    );
  }
}
