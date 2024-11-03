import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget
{
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  // Sample list of items
  List<String> items = List<String>.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible ListView Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item), // Unique key for each Dismissible item
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.check, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });

              // Show a snackbar with undo option
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$item dismissed'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Undo deletion by adding the item back at the original position
                      setState(() {
                        items.insert(index, item);
                      });
                    },
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}
