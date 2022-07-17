import 'package:flutter/material.dart';
import 'package:my_app/models/mascots.dart';

import 'models/mascot.dart';

class MascotSearch extends SearchDelegate<Mascot?> {
  List<Mascot> mascots;
  String result = "";

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
    final suggetstions = mascots.where((mascot) {
      return mascot.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggetstions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggetstions.elementAt(index).toString()),
          onTap: () {
            result = suggetstions.elementAt(index).toString();
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
          title: Text(suggetstions[index].toString()),
          onTap: () {
            query = suggetstions.elementAt(index).toString();
          },
        );
      },
    );
  }
}