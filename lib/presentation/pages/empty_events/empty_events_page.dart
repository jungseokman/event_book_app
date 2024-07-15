import 'package:event_book_app/common/styles.dart';
import 'package:flutter/material.dart';

class EmptyEventsPage extends StatefulWidget {
  const EmptyEventsPage({super.key});

  @override
  State<EmptyEventsPage> createState() => _EmptyEventsPageState();
}

class _EmptyEventsPageState extends State<EmptyEventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmptyEventsPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EmptyEventsPage is working',
          style: TextStyles.title1,
        ),
      ),
    );
  }
}
