// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  int rollNo;
  String name;
  Student({
    required this.rollNo,
    required this.name,
  });
}

List<Student> studentList = [
  Student(rollNo: 1, name: 'Chan'),
  Student(rollNo: 2, name: 'Faizan'),
  Student(rollNo: 3, name: 'Haji')
];
