// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'material_demo_types.dart';
import 'grid_list_demo.dart';

// BEGIN listDemo

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

List<_Photo> _photos = [
  _Photo(
    assetName: 'assets/images/pic0.png',
    title: 'Duke',
    subtitle: 'Java',
  ),
  _Photo(
      assetName: 'assets/images/pic1.png', title: 'elePHPant', subtitle: 'PHP'),
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

class ListDemo extends StatelessWidget {
  const ListDemo({super.key, required this.type});

  final ListDemoType type;

  @override
  Widget build(BuildContext context) {
    final localizations = GalleryLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(localizations.demoListsTitle),
      ),
      body: Scrollbar(
        child: ListView(
          restorationId: 'list_demo_list_view',
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            // for (int index = 1; index < 21; index++)
            //   ListTile(
            //     leading: ExcludeSemantics(
            //       child: CircleAvatar(child: Text('$index')),
            //     ),
            //     title: Text(
            //       localizations.demoBottomSheetItem(index),
            //     ),
            //     subtitle: type == ListDemoType.twoLine
            //         ? Text(localizations.demoListsSecondary)
            //         : null,
            //   ),
            for (_Photo photo in _photos)
              ListTile(
                title: Text(photo.title),
                subtitle: Text(photo.subtitle),
              )
          ],
        ),
      ),
    );
  }
}

// END