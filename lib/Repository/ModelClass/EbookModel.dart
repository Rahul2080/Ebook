
class EbookModel {
  String? bookTitle;
  String? bookImage;
  String? bookDescription;
  String? bookAuthor;
  String? bookPublisher;
  String? amazonBookUrl;
  String? bookIsbn;
  int? bookRank;

  EbookModel({this.bookTitle, this.bookImage, this.bookDescription, this.bookAuthor, this.bookPublisher, this.amazonBookUrl, this.bookIsbn, this.bookRank});

  EbookModel.fromJson(Map<String, dynamic> json) {
    if(json["bookTitle"] is String) {
      bookTitle = json["bookTitle"];
    }
    if(json["bookImage"] is String) {
      bookImage = json["bookImage"];
    }
    if(json["bookDescription"] is String) {
      bookDescription = json["bookDescription"];
    }
    if(json["bookAuthor"] is String) {
      bookAuthor = json["bookAuthor"];
    }
    if(json["bookPublisher"] is String) {
      bookPublisher = json["bookPublisher"];
    }
    if(json["amazonBookUrl"] is String) {
      amazonBookUrl = json["amazonBookUrl"];
    }
    if(json["bookIsbn"] is String) {
      bookIsbn = json["bookIsbn"];
    }
    if(json["bookRank"] is num) {
      bookRank = (json["bookRank"] as num).toInt();
    }
  }

  static List<EbookModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => EbookModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["bookTitle"] = bookTitle;
    _data["bookImage"] = bookImage;
    _data["bookDescription"] = bookDescription;
    _data["bookAuthor"] = bookAuthor;
    _data["bookPublisher"] = bookPublisher;
    _data["amazonBookUrl"] = amazonBookUrl;
    _data["bookIsbn"] = bookIsbn;
    _data["bookRank"] = bookRank;
    return _data;
  }
  static List<EbookModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => EbookModel.fromJson(value)).toList();
  }
  EbookModel copyWith({
    String? bookTitle,
    String? bookImage,
    String? bookDescription,
    String? bookAuthor,
    String? bookPublisher,
    String? amazonBookUrl,
    String? bookIsbn,
    int? bookRank,
  }) => EbookModel(
    bookTitle: bookTitle ?? this.bookTitle,
    bookImage: bookImage ?? this.bookImage,
    bookDescription: bookDescription ?? this.bookDescription,
    bookAuthor: bookAuthor ?? this.bookAuthor,
    bookPublisher: bookPublisher ?? this.bookPublisher,
    amazonBookUrl: amazonBookUrl ?? this.amazonBookUrl,
    bookIsbn: bookIsbn ?? this.bookIsbn,
    bookRank: bookRank ?? this.bookRank,
  );
}