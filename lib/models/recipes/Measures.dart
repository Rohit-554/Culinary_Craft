import 'Metric.dart';

class Measures {
  Metric us;
  Metric metric;

  Measures({
    required this.us,
    required this.metric,
  });

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
    us: Metric.fromJson(json["us"]),
    metric: Metric.fromJson(json["metric"]),
  );

  Map<String, dynamic> toJson() => {
    "us": us.toJson(),
    "metric": metric.toJson(),
  };
}

