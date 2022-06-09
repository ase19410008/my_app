import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'マスコット一覧',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var mascots = <String>[
    'Duke',
    'elePHPant',
    'gopher',
    'Moby Dock',
    'octocat',
    'Tax',
    'Wilber',
    'Dash'
  ];

  var projects = <String>[
    'Java',
    'PHP',
    'Go',
    'Docker',
    'GitHub',
    'Linux',
    'GIMP',
    'Dart'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マスコット一覧'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: mascots.length,
          itemBuilder: (BuildContext ctx, index) {
            return GridTile(
              child: Image.asset(
                'assets/images/pic$index.png',
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  mascots[index],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(projects[index].toString()),
              ),
            );
          }),
    );
  }
}
