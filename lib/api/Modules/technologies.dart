
class Technologies {
  final int id;
  final String label;
  final String src;

  const Technologies({
    required this.id,
    required this.label,
    required this.src,
  });

  factory Technologies.fromJson(Map<String, dynamic> json) {
    return Technologies(
      id: json['id'],
      label: json['label'],
      src: json['src'],
    );
  }
}
