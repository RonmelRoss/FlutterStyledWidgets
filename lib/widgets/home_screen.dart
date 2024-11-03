import 'package:flutter/material.dart';
import 'package:flutter_styled_widgets/widgets/list_view_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome to the Home Screen!'),
            const SizedBox(height: 20.0),
            _contentBody()
          ],
        )
      ),
    );
  }

  Widget _contentBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => Get.to(const ListViewScreen()),
            child: const Text('List View')
          ),
        ],
      )
    );
  }
}
