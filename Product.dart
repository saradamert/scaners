import 'dart:convert';
//http://api.plos.org/search?q=title%3ADNA&fbclid=IwAR2dqgj6nVFHmbzhhe1JVrmz-gE5q6xcsrZ5quEK6ZaYSL1XAzcbCufA1G4  => API

import 'dart:ffi';

List<Product> productFromJson(String str) => List<Product>.from(
    json.decode(str)["response"]["docs"].map((x) => Product.fromJson(x)));

class Product {
  Product({
    required this.id,
    required this.journal,
    required this.eissn,
    required this.publicationDate,
    required this.articleType,
    required this.authorDisplay,
    required this.productAbstract,
    required this.titleDisplay,
    required this.score,
  });

  String id;
  String journal;
  String eissn;
  DateTime publicationDate;
  String articleType;
  List<String> authorDisplay;
  List<String> productAbstract;
  String titleDisplay;
  double score;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? "" : json["id"],
        journal: json["journal"] == null ? "" : json["journal"],
        eissn: json["eissn"] == null ? "" : json["eissn"],
        publicationDate: json["publication_date"] == null
            ? DateTime.now()
            : json["publication_date"],
        articleType: json["article_type"] == null ? "" : json["article_type"],
        authorDisplay: json["author_display"] == null
            ? []
            : json["author_display"].map((x) => x),
        productAbstract:
            json["abstract"] == null ? [] : json["abstract"].map((x) => x),
        titleDisplay:
            json["title_display"] == null ? "" : json["title_display"],
        score: json["score"] == null ? 0 : json["score"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? "" : id,
        "journal": journal == null ? "" : journal,
        "eissn": eissn == null ? "" : eissn,
        "publication_date":
            publicationDate == null ? "" : publicationDate.toIso8601String(),
        "article": articleType == null ? "" : articleType,
        "author_display": authorDisplay == null
            ? ""
            : List<dynamic>.from(authorDisplay.map((x) => x)),
        "abstract": productAbstract == null
            ? ""
            : List<dynamic>.from(productAbstract.map((x) => x)),
        "title_display": titleDisplay == null ? "" : titleDisplay,
        "score": score == null ? "" : score,
      };
}
