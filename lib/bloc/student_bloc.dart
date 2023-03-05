import 'package:bloc/bloc.dart';
import 'package:container_bloc/models/student.dart';
import 'package:meta/meta.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, List<Student>> {
  //Student student = Student(rollNo: 4, name: 'Nasir');
  StudentBloc() : super(studentList) {
    on<StudentEvent>((event, emit) {
      if (event is AddStudenEevnt) {
        // state.add(event.student);
        emit(state..add(event.student));
      } else if (event is EditStudenEvent) {
        state[event.index] = Student(rollNo: 1, name: event.name);
        emit(state);
      } else if (event is DeleteStudentEvent) {
        state.removeAt(event.index);
        emit(state);
      }
    });
  }
}
