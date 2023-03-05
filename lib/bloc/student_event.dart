// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'student_bloc.dart';

@immutable
abstract class StudentEvent {}

@immutable
class AddStudenEevnt extends StudentEvent {
  Student student;
  AddStudenEevnt({
    required this.student,
  });
}
@immutable
class EditStudenEvent extends StudentEvent {
  int index;
  String name;
  EditStudenEvent({
    required this.index,
    required this.name,
  });
}
class DeleteStudentEvent extends StudentEvent {
  int index;
  DeleteStudentEvent({
    required this.index,
  });
}
