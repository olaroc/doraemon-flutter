import 'package:flutter/material.dart';

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu,color: Colors.white,),
          onPressed: null,
          tooltip: 'Navigation menu',
        ),
        title: const Text('Tutorial home'),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search,color: Colors.white,),
            tooltip: 'Search',
          ),
        ],
      ),
      body: const Center(
        child: Text('hello world'),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add',
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
