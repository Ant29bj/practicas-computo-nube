class CardModel {
  CardModel({this.found = false, this.text = ''});

  late String text;
  late bool found;

  get textCard => text;
  get foundCard => found;
}
