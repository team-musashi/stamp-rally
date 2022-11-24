import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../component/m3/card.dart';
import 'header.dart';

class CardSection extends StatelessWidget {
  const CardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SectionHeader(title: 'Card'),
        Gap(20),
        _CardBox(
          child: Card(
            child: _Body(
              title: 'Elevated',
            ),
          ),
        ),
        Gap(20),
        _CardBox(
          child: FilledCard(
            child: _Body(
              title: 'Filled',
            ),
          ),
        ),
        Gap(20),
        _CardBox(
          child: OutlinedCard(
            child: _Body(
              title: 'Outlined',
            ),
          ),
        ),
        Gap(20),
      ],
    );
  }
}

class _CardBox extends StatelessWidget {
  const _CardBox({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: child,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(title),
        ),
      ],
    );
  }
}
