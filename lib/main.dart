import 'package:flutter/material.dart';
import 'package:my_app/controllers/mascot_item.dart';
import 'package:my_app/models/mascots.dart';
import 'package:provider/provider.dart';
import 'mascot_search.dart';
import 'package:my_app/details_screen.dart';

// https://flutter.ctrnost.com/layout/body/grid/
// https://github.com/flutter/gallery/blob/main/lib/demos/material/grid_list_demo.dart
// https://api.flutter.dev/flutter/widgets/GridView-class.html
// https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2?hl=ja#6
// https://www.kindacode.com/article/flutter-gridtile-examples/
// https://github.com/flutter/gallery/blob/main/lib/demos/material/bottom_app_bar_demo.dart
// https://www.youtube.com/watch?v=4YGMGNWqhe8

// https://www.youtube.com/watch?v=0gbFNFA1Lzs
// https://sanjibsinha.com/gridtile-flutter/

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => Mascots(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'マスコットサッチャー';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: ListTileSelectExample(),
    );
  }
}

enum FilterOptions {
  favorite,
  all,
}

class ListTileSelectExample extends StatefulWidget {
  const ListTileSelectExample({super.key});

  @override
  ListTileSelectExampleState createState() => ListTileSelectExampleState();
}

class ListTileSelectExampleState extends State<ListTileSelectExample> {
  final int listLength = 30;
  late List<bool> _selected;
  bool _isGridMode = true;
  bool showFavs = false;
  bool isSearch = false;
  var _showOnlyFavs = false;
  Mascots? mascots;

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
          IconButton(
            icon: const Icon(
              Icons.favorite,
              semanticLabel: "お気に入り一覧表示",
            ),
            onPressed: () {
              setState(() {
                _showOnlyFavs = !_showOnlyFavs;
              });
            },
            tooltip: "お気に入り一覧表示",
          ),
          if (_isGridMode)
            IconButton(
              icon: const Icon(
                Icons.list,
                semanticLabel: "リスト表示",
              ),
              onPressed: () {
                setState(() {
                  _isGridMode = false;
                });
              },
              tooltip: "リスト表示",
            )
          else
            IconButton(
              icon: const Icon(
                Icons.grid_view,
                semanticLabel: "グリッド表示",
              ),
              onPressed: () {
                setState(() {
                  _isGridMode = true;
                });
              },
              tooltip: "グリッド表示",
            ),
        ],
      ),
      body: _isGridMode
          ? GridBuilder(
              selectedList: _selected,
              showFavs: _showOnlyFavs,
            )
          : ListBuilder(
              selectedList: _selected,
              showFavs: _showOnlyFavs,
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(50),
        child: FloatingActionButton(
            child: const Icon(Icons.search),
            onPressed: () async {
              final mascotsData = Provider.of<Mascots>(context, listen: false);
              final mascots = mascotsData.items;
              final mascot = await showSearch(
                  context: context,
                  delegate: MascotSearch(
                    mascots
                  ));
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) =>
                      CarouselWithIndicator(mascot: mascot, index: mascot!.id))
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class GridBuilder extends StatefulWidget {
  final bool showFavs;

  const GridBuilder({
    super.key,
    required this.selectedList,
    required this.showFavs,
  });

  final List<bool> selectedList;

  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {
  @override
  Widget build(BuildContext context) {
    final mascotsData = Provider.of<Mascots>(context);
    final mascots = widget.showFavs ? mascotsData.favItems : mascotsData.items;
    return GridView.builder(
      itemCount: mascots.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: mascots[i],
        child: const MascotItem(),
      ),
    );
  }
}

class ListBuilder extends StatefulWidget {
  final bool showFavs;

  const ListBuilder({
    super.key,
    required this.selectedList,
    required this.showFavs,
  });

  final List<bool> selectedList;

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    final mascotsData = Provider.of<Mascots>(context);
    final mascots = widget.showFavs ? mascotsData.favItems : mascotsData.items;
    return ListView.builder(
        itemCount: mascots.length,
        itemBuilder: (_, int index) {
          return ListTile(
            title: Text(mascots[index].name),
            subtitle: Text(mascots[index].serviceName),
          );
        });
  }
}
