// 
class AllCategory {
  final int id;
  final String name;

  AllCategory({required this.id, required this.name});

  factory AllCategory.fromJson(Map<String, dynamic> json) {
    return AllCategory(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String toString() {
    return 'AllCategory(id: $id, name: $name)';
  }
}