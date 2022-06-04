class Predictions {
  const Predictions(this.veracity, this.probability);

  final int veracity;
  final double probability;

  factory Predictions.fromJson(Map<String, dynamic> json) =>
      Predictions(json['veracity'], json['probability']);
}
