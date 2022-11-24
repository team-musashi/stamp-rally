import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'common.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Text Field'),
        const Gap(contentPadding),
        _TextFieldBox(
          child: TextField(
            decoration: InputDecoration(
              label: const Text('Username'),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.clear),
              ),
            ),
            onChanged: (text) {},
          ),
        ),
        const Gap(contentPadding),
        _TextFieldBox(
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Password'),
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {},
            obscureText: true,
          ),
        ),
        const Gap(contentPadding),
      ],
    );
  }
}

class _TextFieldBox extends StatelessWidget {
  const _TextFieldBox({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: child,
    );
  }
}
