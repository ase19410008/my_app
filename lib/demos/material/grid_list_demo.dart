// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// BEGIN gridListsDemo

class GridListDemo extends StatelessWidget {
  const GridListDemo({super.key});

  List<_Photo> _photos(BuildContext context) {
    return [
      _Photo(
        assetName: 'assets/images/pic0.png',
        title: 'Duke',
        subtitle: 'Java',
      ),
      _Photo(
          assetName: 'assets/images/pic1.png',
          title: 'elePHPant',
          subtitle: 'PHP'),
      _Photo(
        assetName: 'assets/images/pic2.png',
        title: 'gopher',
        subtitle: 'Go',
      ),
      _Photo(
        assetName: 'assets/images/pic3.png',
        title: 'Moby Dock',
        subtitle: 'Docker',
      ),
      _Photo(
        assetName: 'assets/images/pic4.png',
        title: 'octocat',
        subtitle: 'GitHub',
      ),
      _Photo(
        assetName: 'assets/images/pic5.png',
        title: 'Tax',
        subtitle: 'Linux',
      ),
      _Photo(
        assetName: 'assets/images/pic6.png',
        title: 'Wilber',
        subtitle: "GIMP",
      ),
      _Photo(
        assetName: 'assets/images/pic7.png',
        title: 'Dash',
        subtitle: 'Dart',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('マスコット一覧'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1,
        children: _photos(context).map<Widget>((photo) {
          return _GridDemoPhotoItem(
            photo: photo,
          );
        }).toList(),
      ),
    );
  }
}

class _Photo {
  _Photo({
    required this.assetName,
    required this.title,
    required this.subtitle,
  });

  final String assetName;
  final String title;
  final String subtitle;
}

/// Allow the text size to shrink to fit in the space
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  const _GridDemoPhotoItem({
    required this.photo,
  });

  final _Photo photo;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      child: Image.asset(
        photo.assetName,
        fit: BoxFit.cover,
      ),
    );

    return GridTile(
      footer: Material(
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: _GridTitleText(photo.title),
          subtitle: _GridTitleText(photo.subtitle),
        ),
      ),
      child: image,
    );
  }
}

// END
