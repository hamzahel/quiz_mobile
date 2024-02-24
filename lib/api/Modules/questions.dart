class Questions {
  final int id;
  final String label;
  final int idTech;
  final String more;

  const Questions(
      {required this.id,
      required this.label,
      required this.idTech,
      required this.more});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      id: json['id'],
      label: json['label'],
      idTech: json['id_tech'],
      more: json['more'] ?? "",
    );
  }
}
