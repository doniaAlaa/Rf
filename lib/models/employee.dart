class Employee {
  static const String idKey = "id";
  static const String nameKey = "name";
  static const String arrayKey = "array";

  int id;
  String name;
  List<double> array;

  Employee({required this.id, required this.name, required this.array});

  factory Employee.fromJson(Map<dynamic, dynamic> json, {bool? synced}) => Employee(
        id: json[idKey],
        name: json[nameKey],
        array: json[arrayKey],
      );

  Map<String, dynamic> toJson() => {
        idKey: id,
        nameKey: name,
        arrayKey: array,
      };
}
