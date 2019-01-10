
class CardModel<T> {

  int _id;
  String _title;
  String _imageUrl;

  int get id => _id;
  String get title => _title;
  String get imageUrl => _imageUrl;

  CardModel(this._title, this._imageUrl);

  CardModel.map(dynamic obj) {
    this._id = obj['id'];
    this._title = obj['title'];
    this._imageUrl = obj['_imageUrl'];
  }

  CardModel.fromJson(parsedJson){
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _imageUrl = parsedJson['url'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['imageUrl'] = _imageUrl;

    return map;
  }



  CardModel.fromMap(Map<dynamic, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._imageUrl = map['url'];
  }


}