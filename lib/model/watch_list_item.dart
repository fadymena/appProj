class WatchlistItem {
  String name;
  double price;
  WatchlistItem(this.name, this.price);
}

get wListItemsDemo {
  List<WatchlistItem> list = [];
  for (var i = 0; i < 10; i++) {
    var v = WatchlistItem('name$i', i * 10);
    list.add(v);
  }
  return list;
}
