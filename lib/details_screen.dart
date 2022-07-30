import 'package:flutter/material.dart';
import 'package:my_app/models/mascot.dart';
import 'package:my_app/models/mascots.dart';
import 'package:carousel_slider/carousel_slider.dart';
import "package:provider/provider.dart";

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.mascot});

  final Mascot mascot;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mascot.name),
      ),
      body: Center(
          child: Column(
        children: [
          Image.asset(widget.mascot.imageUrl),
        ],
      )),
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  const CarouselDemoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key, required this.mascot}) : super(key: key);

  final Mascot mascot;
  @override
  Widget build(BuildContext context) {
    final mascotsData = Provider.of<Mascots>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image slider demo'),
      ),
      body: CarouselSlider(
        options: CarouselOptions(),
        items: mascotsData.items
            .map((e) => Center(
              child: Image.asset(e.imageUrl),
            ))
            .toList(),
      ),
    );
  }
}

class CarouselWithIndicator extends StatefulWidget {
  final int index;
  // const CarouselWithIndicator({Key? key}) : super(key: key);
  const CarouselWithIndicator({Key? key, required this.mascot, required this.index})
      : super(key: key);

  final Mascot? mascot;

  @override
  State<CarouselWithIndicator> createState() => _CarouselWithIndicatorState(index);
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int index;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  _CarouselWithIndicatorState(this.index) {
    _current = index;
  }

  @override
  Widget build(BuildContext context) {
    final mascotsData = Provider.of<Mascots>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('マスコット詳細')),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: mascotsData.items
                .map((e) => Center(
                  child: Image.asset(e.imageUrl),
                ))
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
              initialPage: widget.index,
              onPageChanged: (index, reaason) {
                setState(() {
                  _current = index;
                });
            }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: mascotsData.items.asMap().entries.map((e) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(e.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == e.key ? .9 : .4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
