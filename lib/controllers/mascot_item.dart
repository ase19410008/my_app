import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/mascot.dart';

class MascotItem extends StatelessWidget {
  const MascotItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mascot = Provider.of<Mascot>(context, listen: false);
    return GridTile(
      child: Image.asset(mascot.imageUrl),
      footer: GridTileBar(
        backgroundColor: Colors.black,
        leading: Consumer<Mascot>(
          builder: (ctx, mascot, _) => IconButton(
            onPressed: () {
              mascot.toggleFavoriteStatus();
            },
            icon: Icon(
              mascot.isFav ? Icons.favorite : Icons.favorite_border,
            ),
            color: Colors.red,
          ),
        ),
        title: Text(mascot.name),
        subtitle: Text(mascot.serviceName),
      ),
    );
  }
}
