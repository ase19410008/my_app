import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/mascot.dart';
import 'package:my_app/details_screen.dart';

class MascotItem extends StatelessWidget {
  const MascotItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cont_text = "";
    var icon_label = "";
    final mascot = Provider.of<Mascot>(context, listen: false);
    return GridTile(
        footer: GridTileBar(
            backgroundColor: Colors.black,
            title: Text(mascot.name),
            subtitle: Text(mascot.serviceName),
            trailing: Consumer<Mascot>(
              builder: (ctx, mascot, _) => IconButton(
                onPressed: () {
                  mascot.toggleFavoriteStatus();
                  if (mascot.isFav) {
                    cont_text = "${mascot.name}がお気に入りに追加されました";
                    icon_label = "お気に入り追加";
                  } else {
                    cont_text = "${mascot.name}がお気に入りから削除されました";
                    icon_label = "お気に入り削除";
                  }
                  final snackBar = SnackBar(
                    content: Text(cont_text),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: Icon(
                  mascot.isFav ? Icons.favorite : Icons.favorite_border,
                  semanticLabel: icon_label,
                ),
                color: Colors.pink,
                tooltip: icon_label,
              ),
            )),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(mascot: mascot)));
          },
          child: Image.asset(
            mascot.imageUrl,
            fit: BoxFit.cover,
          ),
        ));
  }
}
