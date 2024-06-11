import 'package:hive_flutter/hive_flutter.dart';

import '../models/employee.dart';

class HiveBoxes {
  static const employees = "employees";

  static Box employeesBox() => Hive.box(employees);

  static initialize() async {
    await Hive.openBox(employees);
  }

  static clearAllBox() async {
    await HiveBoxes.employeesBox().clear();
  }
}

class LocalDB {
  static Iterable<Map> getEmployees() => HiveBoxes.employeesBox().values.cast();

  static dynamic getEmployee(int id) => HiveBoxes.employeesBox().get(id);

  static Future<void> updateEmployee(Employee employee) => HiveBoxes.employeesBox().put(employee.id, employee.toJson());

  static Future<void> deleteEmployee(Employee employee) => HiveBoxes.employeesBox().delete(employee.id);
}
