class Contractee {
  final String id;
  final String name;
  final String validTill;
  final int projectCount;
  final String status; // active | expired | pending

  Contractee({
    required this.id,
    required this.name,
    required this.validTill,
    required this.projectCount,
    required this.status,
  });
}
