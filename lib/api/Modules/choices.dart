class Choices {
  final int id;
  final String label;
  final int idQ;
  final bool isCorrect;

  const Choices(
      {required this.id,
      required this.label,
      required this.idQ,
      required this.isCorrect});

  factory Choices.fromJson(Map<String, dynamic> json) {
    return Choices(
      id: json['id'],
      label: json['label'],
      idQ: json['id_q'],
      isCorrect: json['is_correct'] == 1 ? true : false,
    );
  }

  String ToString() {
    return ("id is : ${this.id} \nlabel is : $label \nid Question : ${this.idQ} \nis correct : ${this.isCorrect}");
  }
}
