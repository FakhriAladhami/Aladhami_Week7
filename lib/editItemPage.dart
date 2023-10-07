import 'package:flutter/material.dart';


import 'item.dart';

class editItemPage extends StatefulWidget {
  final Item item;

  const editItemPage({Key? key, required this.item}) : super(key: key);

  @override
  _editItemPageState createState() => _editItemPageState(item);
}

class _editItemPageState extends State<editItemPage> {
  late Item item;
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();

  _editItemPageState(this.item);

  @override
  void initState() {
    super.initState();
    itemNameController.text = item.name;
    itemDescriptionController.text = item.Description;
  }

  void updateItemPressed() {
    setState(() {
      item.name = itemNameController.text;
      item.Description = itemDescriptionController.text;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Edit Item ${item.Id}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: itemNameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: itemDescriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            ElevatedButton(
              onPressed: updateItemPressed,
              child: Text("Update Item"),
            ),
          ],
        ),
      ),
    );
  }
}