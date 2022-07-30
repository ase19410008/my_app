import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/mascot.dart';
import 'package:my_app/details_screen.dart';

class MascotItem extends StatelessWidget {
  const MascotItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contText = "";
    var iconLabel = "";
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
                    contText = "${mascot.name}がお気に入りに追加されました";
                    iconLabel = "お気に入り追加";
                  } else {
                    contText = "${mascot.name}がお気に入りから削除されました";
                    iconLabel = "お気に入り削除";
                  }
                  final snackBar = SnackBar(
                    content: Text(contText),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: Icon(
                  mascot.isFav ? Icons.favorite : Icons.favorite_border,
                  semanticLabel: iconLabel,
                ),
                color: Colors.pink,
                tooltip: iconLabel,
              ),
            )),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                // MaterialPageRoute(
                //     builder: (context) => DetailsScreen(mascot: mascot)));
                MaterialPageRoute(
                    builder: (context) =>
                        CarouselWithIndicator(mascot: mascot, index: mascot.id)));
          },
          child: Image.asset(
            mascot.imageUrl,
            fit: BoxFit.cover,
          ),
        ));
  }
}
