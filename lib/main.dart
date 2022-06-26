import 'package:flutter/material.dart';

// https://flutter.ctrnost.com/layout/body/grid/
// https://github.com/flutter/gallery/blob/main/lib/demos/material/grid_list_demo.dart
// https://api.flutter.dev/flutter/widgets/GridView-class.html
// https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2?hl=ja#6
// https://www.kindacode.com/article/flutter-gridtile-examples/
// https://github.com/flutter/gallery/blob/main/lib/demos/material/bottom_app_bar_demo.dart
// https://www.youtube.com/watch?v=4YGMGNWqhe8

// https://www.youtube.com/watch?v=0gbFNFA1Lzs
// https://sanjibsinha.com/gridtile-flutter/
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: ListTileSelectExample(),
    );
  }
}

var ttl = [
  'Duke',
  'elePHPant',
  'gopher',
  'Moby Dock',
  'octocat',
  'Tax',
  'Wilber',
  'Dash'
];
final sub = ['Java', 'PHP', 'Go', 'Docker', 'GitHub', 'Linux', 'GIMP', 'Dart'];

var fav = false;

class ListTileSelectExample extends StatefulWidget {
  const ListTileSelectExample({super.key});

  @override
  ListTileSelectExampleState createState() => ListTileSelectExampleState();
}

class ListTileSelectExampleState extends State<ListTileSelectExample> {
  final int listLength = 30;
  late List<bool> _selected;
  bool _isGridMode = true;

  @override
  void initState() {
    super.initState();
    initializeSelection();
  }

  void initializeSelection() {
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  void dispose() {
    _selected.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'マスコット一覧',
        ),
        actions: <Widget>[
          if (_isGridMode)
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                setState(() {
                  _isGridMode = false;
                });
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.grid_view),
              onPressed: () {
                setState(() {
                  _isGridMode = true;
                });
              },
            ),
        ],
      ),
      body: _isGridMode
          ? GridBuilder(
              selectedList: _selected,
            )
          : ListBuilder(
              selectedList: _selected,
            ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.search), onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.list),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: null,
                ),
              ],
            )),
      ),
    );
  }
}

class GridBuilder extends StatefulWidget {
  const GridBuilder({
    super.key,
    required this.selectedList,
  });

  final List<bool> selectedList;

  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // itemCount: widget.selectedList.length,
        itemCount: ttl.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, int index) {
          // return const InkWell(
          //   child: GridTile(child: Icon(Icons.image)),
          // );
          return GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black,
              title: Text(ttl[index]),
              subtitle: Text(sub[index]),
              trailing: fav
                  ? IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        setState(() {
                          fav = !fav;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        setState(() {
                          fav = !fav;
                        });
                      },
                    ),
            ),
            child: Image.asset(
              "assets/images/pic$index.png",
              // "https://raw.githubusercontent.com/ravi84184/ravi84184/master/Minions/${index + 1}.jpg",
              fit: BoxFit.cover,
            ),
          );
        });
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    super.key,
    required this.selectedList,
  });

  final List<bool> selectedList;

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: widget.selectedList.length,
        itemCount: ttl.length,
        itemBuilder: (_, int index) {
          return ListTile(
            title: Text(sub[index]),
            subtitle: Text(ttl[index]),
          );
        });
  }
}
