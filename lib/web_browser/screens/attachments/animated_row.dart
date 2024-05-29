import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedRow extends StatefulWidget {
  int currentIndex;
  AnimatedRow({required this.currentIndex, super.key});

  @override
  State<AnimatedRow> createState() => _AnimatedRowState();
}

class _AnimatedRowState extends State<AnimatedRow> {
  final List<int> _indexes = List.generate(3, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _indexes
          .map(
            (int index) => AnimatedContainer(
              duration: const Duration(
                milliseconds: 1000,
              ),
              height: index == widget.currentIndex ? 12 : 10,
              width: index == widget.currentIndex ? 12 : 10,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color:
                    index == widget.currentIndex ? Colors.black : Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          )
          .toList(),
    );
  }
}
