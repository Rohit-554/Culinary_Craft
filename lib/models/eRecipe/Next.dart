class Next {
  String title;
  String href;

  Next({
    required this.title,
    required this.href,
  });

  factory Next.fromJson(Map<String, dynamic> json) => Next(
    title: json["title"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "href": href,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
