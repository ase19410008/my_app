import 'package:flutter/material.dart';

import 'models/mascot.dart';

class MascotSearch extends SearchDelegate<Mascot?> {
  List<Mascot> mascots;
  Mascot? result;

  MascotSearch(this.mascots);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, result);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggetstions = mascots.where((name) {
      return name.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggetstions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggetstions.elementAt(index).name),
          onTap: () {
            result = suggetstions.elementAt(index);
            print("##################");
            print(result);
            print("####################");
            close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggetstions = mascots.where((mascot) {
      return mascot.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggetstions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggetstions.elementAt(index).name),
          onTap: () {
            query = suggetstions.elementAt(index).name;
          },
        );
      },
    );
  }
}