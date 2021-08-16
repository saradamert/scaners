import 'dart:convert';

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

// import 'dart:convert';

// import 'dart:js_util';


// List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String productToJson(List<Product> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Product {
//   Product({
//     required this.response,
//   });

//   Response response;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         response: json["response"] == null ? "" : json["response"],
//       );

//   Map<String, dynamic> toJson() => {
//         "response": response == null ? null : response.toJson(),
//       };
// }

// class Response {
//   Response({
//     required this.numFound,
//     required this.start,
//     required this.maxScore,
//     required this.docs,
//   });

//   int numFound;
//   int start;
//   double maxScore;
//   List<Doc> docs;

//   factory Response.fromJson(Map<String, dynamic> json) => Response(
//         numFound: json["numFound"] == null ? null : json["numFound"],
//         start: json["start"] == null ? null : json["start"],
//         maxScore: json["maxScore"] == null ? null : json["maxScore"].toDouble(),
//         docs: json["docs"] == null
//             ? []
//             : List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "numFound": numFound == null ? null : numFound,
//         "start": start == null ? null : start,
//         "maxScore": maxScore == null ? null : maxScore,
//         "docs": docs == null
//             ? null
//             : List<dynamic>.from(docs.map((x) => x.toJson())),
//       };
// }

// class Doc {
//   Doc({
//     required this.id,
//     required this.journal,
//     required this.eissn,
//     required this.publicationDate,
//     required this.articleType,
//     required this.authorDisplay,
//     required this.docAbstract,
//     required this.titleDisplay,
//     required this.score,
//   });

//   String id;
//   String journal;
//   Eissn eissn;
//   DateTime publicationDate;
//   ArticleType articleType;
//   List<String> authorDisplay;
//   List<String> docAbstract;
//   String titleDisplay;
//   double score;

//   factory Doc.fromJson(Map<String, dynamic> json) => Doc(
//         id: json["id"] == null ? "" : json["id"],
//         journal: json["journal"] == null ? "" : json["journal"],
//         eissn: json["eissn"] == null
//             ? newObject()
//             : eissnValues.map[json["eissn"]],
//         publicationDate: json["publication_date"] == null
//             ? DateTime.now()
//             : json["publication_date"],
//         articleType: json["article_type"] == null
//             ? newObject()
//             : articleTypeValues.map[json["article_type"]],
//         authorDisplay: json["author_display"] == null
//             ? []
//             : List<String>.from(json["author_display"].map((x) => x)),
//         docAbstract: json["abstract"] == null
//             ? []
//             : List<String>.from(json["abstract"].map((x) => x)),
//         titleDisplay:
//             json["title_display"] == null ? null : json["title_display"],
//         score: json["score"] == null ? null : json["score"].toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "journal": journal == null ? null : journal,
//         "eissn": eissn == null ? null : eissnValues.reverse[eissn],
//         "publication_date":
//             publicationDate == null ? null : publicationDate.toIso8601String(),
//         "article_type":
//             articleType == null ? null : articleTypeValues.reverse[articleType],
//         "author_display": authorDisplay == null
//             ? null
//             : List<dynamic>.from(authorDisplay.map((x) => x)),
//         "abstract": docAbstract == null
//             ? null
//             : List<dynamic>.from(docAbstract.map((x) => x)),
//         "title_display": titleDisplay == null ? null : titleDisplay,
//         "score": score == null ? null : score,
//       };
// }

// enum ArticleType { RESEARCH_ARTICLE, CORRECTION }

// final articleTypeValues = EnumValues({
//   "Correction": ArticleType.CORRECTION,
//   "Research Article": ArticleType.RESEARCH_ARTICLE
// });

// enum Eissn { THE_19326203, THE_15457885, THE_15537404 }

// final eissnValues = EnumValues({
//   "1545-7885": Eissn.THE_15457885,
//   "1553-7404": Eissn.THE_15537404,
//   "1932-6203": Eissn.THE_19326203
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
