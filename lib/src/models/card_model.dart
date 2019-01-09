class CardModel<T> {

  int id;
  String url;
  String title;

  CardModel(this.id, this.url, this.title);

  CardModel.fromJson(parsedJson){
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }

}