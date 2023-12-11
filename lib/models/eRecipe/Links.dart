import 'Next.dart';

class Links {
  Next next;

  Links({
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: Next.fromJson(json["next"]),
  );

  Map<String, dynamic> toJson() => {
    "next": next.toJson(),
  };
}