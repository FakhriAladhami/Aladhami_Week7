import 'item.dart';

class GlobalItems {
  static final GlobalItems _item = GlobalItems._instance();
  List<Item> item = [
    Item(1, "Fakhri", "player"),
    Item(2, 'Ali', 'Ahmed'),
    Item(3, 'John', 'Laser'),
    Item(4, 'Seri', 'Done'),
    Item(5, 'Cris', 'Miler'),
    Item(6, 'Leo', 'messi'),
    Item(7, 'Elizabeth', 'Mopez'),
    Item(8, 'Derian', 'Dammon'),
    Item(9, 'Crown', 'Flower'),
    Item(10, 'Ronaldo', 'love'),
  ];

  factory GlobalItems() {
    return _item;
  }
  GlobalItems._instance();

  List<Item> items = [];
}
