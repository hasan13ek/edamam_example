// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
  FoodModel({
    required this.text,
    required this.parsed,
    required this.hints,
    required this.links,
  });

  String text;
  List<Parsed> parsed;
  List<Hint> hints;
  Links links;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    text: json["text"],
    parsed: List<Parsed>.from(json["parsed"].map((x) => Parsed.fromJson(x))),
    hints: List<Hint>.from(json["hints"].map((x) => Hint.fromJson(x))),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "parsed": List<dynamic>.from(parsed.map((x) => x.toJson())),
    "hints": List<dynamic>.from(hints.map((x) => x.toJson())),
    "_links": links.toJson(),
  };
}

class Hint {
  Hint({
    required this.food,
    required this.measures,
  });

  Food food;
  List<Measure> measures;

  factory Hint.fromJson(Map<String, dynamic> json) => Hint(
    food: Food.fromJson(json["food"]),
    measures: List<Measure>.from(json["measures"].map((x) => Measure.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "food": food.toJson(),
    "measures": List<dynamic>.from(measures.map((x) => x.toJson())),
  };
}

class Food {
  Food({
    required this.foodId,
    required this.label,
    required this.knownAs,
    // required this.nutrients,
    required this.category,
    required this.categoryLabel,
    this.image,
  });

  String foodId;
  String label;
  String knownAs;
  // Nutrients nutrients;
  String category;
  String categoryLabel;
  String? image;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    foodId: json["foodId"],
    label: json["label"],
    knownAs: json["knownAs"],
    // nutrients: Nutrients.fromJson(json["nutrients"]),
    category: json["category"],
    categoryLabel: json["categoryLabel"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "foodId": foodId,
    "label": label,
    "knownAs": knownAs,
    // "nutrients": nutrients.toJson(),
    "category": category,
    "categoryLabel": categoryLabel,
    "image": image,
  };
}

// class Nutrients {
//   Nutrients({
//     required this.enercKcal,
//     // required this.procnt,
//     // required this.fat,
//     // required this.chocdf,
//     required this.fibtg,
//   });
//
//   int enercKcal;
//   // double procnt;
//   // double fat;
//   // double chocdf;
//   int fibtg;
//
//   factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
//     enercKcal: json["ENERC_KCAL"],
//     // procnt: json["PROCNT"]?.toDouble(),
//     // fat: json["FAT"]?.toDouble(),
//     // chocdf: json["CHOCDF"]?.toDouble(),
//     fibtg: json["FIBTG"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "ENERC_KCAL": enercKcal,
//     // "PROCNT": procnt,
//     // "FAT": fat,
//     // "CHOCDF": chocdf,
//     "FIBTG": fibtg,
//   };
// }

class Measure {
  Measure({
    required this.uri,
    required this.label,
    // required this.weight,
    // this.qualified,
  });

  String uri;
  String label;
  // int weight;
  // List<Qualified>? qualified;

  factory Measure.fromJson(Map<String, dynamic> json) => Measure(
    uri: json["uri"],
    label: json["label"],
    // weight: json["weight"]?.toDouble(),
    // qualified: json["qualified"] == null ? [] : List<Qualified>.from(json["qualified"]!.map((x) => Qualified.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "label": label,
    // "weight": weight,
    // "qualified": qualified == null ? [] : List<dynamic>.from(qualified!.map((x) => x.toJson())),
  };
}

// class Qualified {
//   // Qualified({
//   //   // required this.qualifiers,
//   //   // required this.weight,
//   // });
//
//   // List<Qualifier> qualifiers;
//   // double weight;
//
//   factory Qualified.fromJson(Map<String, dynamic> json) => Qualified(
//     // qualifiers: List<Qualifier>.from(json["qualifiers"].map((x) => Qualifier.fromJson(x))),
//     // weight: json["weight"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     // "qualifiers": List<dynamic>.from(qualifiers.map((x) => x.toJson())),
//     // "weight": weight,
//   };
// }

class Qualifier {
  Qualifier({
    required this.uri,
    required this.label,
  });

  String uri;
  String label;

  factory Qualifier.fromJson(Map<String, dynamic> json) => Qualifier(
    uri: json["uri"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "label": label,
  };
}

class Links {
  Links({
    required this.next,
  });

  Next next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: Next.fromJson(json["next"]),
  );

  Map<String, dynamic> toJson() => {
    "next": next.toJson(),
  };
}

class Next {
  Next({
    required this.title,
    required this.href,
  });

  String title;
  String href;

  factory Next.fromJson(Map<String, dynamic> json) => Next(
    title: json["title"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "href": href,
  };
}

class Parsed {
  Parsed({
    required this.food,
  });

  Food food;

  factory Parsed.fromJson(Map<String, dynamic> json) => Parsed(
    food: Food.fromJson(json["food"]),
  );

  Map<String, dynamic> toJson() => {
    "food": food.toJson(),
  };
}
