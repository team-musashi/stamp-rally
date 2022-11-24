import 'package:flutter/material.dart';

import 'header.dart';

class ListSection extends StatelessWidget {
  const ListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SectionHeader(title: 'List'),
        ListTile(
          leading: CircleAvatar(
            child: Text('A'),
          ),
          title: Text('Headline'),
          trailing: Text('100+'),
          subtitle: Text('Supporting text'),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Text('B'),
          ),
          title: Text('Headline 2'),
          trailing: Text('32'),
          subtitle: Text('Supporting text'),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Text('C'),
          ),
          title: Text('Headline 3'),
          trailing: Text('57'),
          subtitle: Text('Supporting text'),
        ),
      ],
    );
  }
}
