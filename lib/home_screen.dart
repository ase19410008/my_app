import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final ttl = ['A', 'B', 'C'];
final sub = ['a', 'b', 'c'];

class _HomeScreenState extends State<HomeScreen> {
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
        title: const Text("Hero animation"),
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
      itemCount: 20,
      padding: EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(index: index)));
          },
          child: Image.network(
              'https://raw.githubusercontent.com/ravi84184/ravi84184/master/Minions/${index + 1}.jpg'),
        );
      },
    );
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
