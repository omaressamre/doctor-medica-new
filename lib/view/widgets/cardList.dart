import 'package:flutter/material.dart';
import 'package:medica/view/widgets/slider_para.dart';

class CardList extends StatelessWidget {
  List<Widget> cardList = [
    const sliderCard(
        text: 'Great',
        graph:
            'The point of using Lorem Ipsum is that it has a more-or-less no distribution of look like readable english.'),
    const sliderCard(
        text: 'Instant',
        graph:
            'The point of using Lorem Ipsum is that it has a more-or-less no distribution of look like readable english.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
