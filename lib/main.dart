import 'package:flutter/material.dart';
import 'package:week/item.dart';

import 'editItemPage.dart';
import 'GlobalItems.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Aladhami Week 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get item => GlobalItems().item;

  void _handleButtonPress() {
    setState(() {
      Navigator.push(context,
              MaterialPageRoute(builder: (context) => editItemPage(item: item)))
          .then(((value) => {setState(() => {})}));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: GlobalItems().item.length,
        itemBuilder: (context, index) {
          Item item = GlobalItems().item[index];
          return ListTile(
            title: Text("ID: ${item.Id}"),
            subtitle: Text("Item Name: ${item.name}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => editItemPage(item: item),
                ),
              );
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  GlobalItems().item.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
