class CardModel {
  CardModel({this.found = false, this.text = '', this.open = false});

  late String text;
  late bool found;
  late bool open;

  get textCard => text;
  get foundCard => found;
  get getOpen => this.open;

  set setFound(bool found) {
    this.found = found;
  }

  set setOpen(bool open) {
    this.open = open;
  }
}
