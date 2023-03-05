import 'package:container_bloc/bloc/student_bloc.dart';
import 'package:container_bloc/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => StudentBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController rollNoController;
  late TextEditingController nameController;
  late Bloc bloc;
  @override
  Widget build(BuildContext context) {
    rollNoController = TextEditingController();
    nameController = TextEditingController();
    bloc = context.read<StudentBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: rollNoController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nameController,
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Student student = Student(
                      rollNo: int.parse(rollNoController.text),
                      name: nameController.text);
                  bloc.add(AddStudenEevnt(student: student));
                },
                child: const Text('Add')),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                List<Student> list = state as List<Student>;
                return Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text(list[index].rollNo.toString()),
                      ),
                      title: Text(list[index].name),
                      trailing: IconButton(
                          onPressed: () {
                            Student student = Student(rollNo: int.parse(rollNoController.text), name: nameController.text);
                            //EditStudenEvent(index: index, name: 'Changed Name');
                            bloc.add(AddStudenEevnt(student: student));
                          },
                          icon: const Icon(Icons.edit)),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
     
    );
  }
}
