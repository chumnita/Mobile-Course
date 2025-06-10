import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/student.dart';
import '../services/db_helper.dart';
import '../utils/validators.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Student> students = [];

  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final classCtrl = TextEditingController();
  final deptCtrl = TextEditingController();
  final genderCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final data = await DBHelper().getStudents();
    setState(() => students = data);
  }

  Future<void> _addStudent() async {
    if (_formKey.currentState!.validate()) {
      final student = Student(
        name: nameCtrl.text,
        email: emailCtrl.text,
        phone: phoneCtrl.text,
        className: classCtrl.text,
        department: deptCtrl.text,
        gender: genderCtrl.text,
        dateRegistered: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        present: false,
      );

      await DBHelper().insertStudent(student);
      Navigator.pop(context);
      _clearForm();
      _loadStudents();
    }
  }

  void _clearForm() {
    nameCtrl.clear();
    emailCtrl.clear();
    phoneCtrl.clear();
    classCtrl.clear();
    deptCtrl.clear();
    genderCtrl.clear();
  }

  void _showAddForm() {
    _clearForm();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Student'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextFormField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name'), validator: Validators.validateName),
              TextFormField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email'), validator: Validators.validateEmail),
              TextFormField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Phone'), validator: Validators.validatePhone),
              TextFormField(controller: classCtrl, decoration: const InputDecoration(labelText: 'Class')),
              TextFormField(controller: deptCtrl, decoration: const InputDecoration(labelText: 'Department')),
              TextFormField(controller: genderCtrl, decoration: const InputDecoration(labelText: 'Gender')),
            ]),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(onPressed: _addStudent, child: const Text('Save')),
        ],
      ),
    );
  }

  void _showUpdateForm(Student student) {
    nameCtrl.text = student.name;
    emailCtrl.text = student.email;
    phoneCtrl.text = student.phone;
    classCtrl.text = student.className;
    deptCtrl.text = student.department;
    genderCtrl.text = student.gender;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Update Student'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextFormField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name'), validator: Validators.validateName),
              TextFormField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email'), validator: Validators.validateEmail),
              TextFormField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Phone'), validator: Validators.validatePhone),
              TextFormField(controller: classCtrl, decoration: const InputDecoration(labelText: 'Class')),
              TextFormField(controller: deptCtrl, decoration: const InputDecoration(labelText: 'Department')),
              TextFormField(controller: genderCtrl, decoration: const InputDecoration(labelText: 'Gender')),
            ]),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final updated = Student(
                  id: student.id,
                  name: nameCtrl.text,
                  email: emailCtrl.text,
                  phone: phoneCtrl.text,
                  className: classCtrl.text,
                  department: deptCtrl.text,
                  gender: genderCtrl.text,
                  dateRegistered: student.dateRegistered,
                  present: student.present,
                );
                await DBHelper().updateStudent(updated);
                Navigator.pop(context);
                _clearForm();
                _loadStudents();
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  void _toggleAttendance(Student student) async {
    student.present = !student.present;
    await DBHelper().updateStudent(student);
    _loadStudents();
  }

  void _deleteStudent(int id) async {
    await DBHelper().deleteStudent(id);
    _loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Class Manager')),
      body: students.isEmpty
          ? const Center(child: Text('No students yet'))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final s = students[index];
                return ListTile(
                  title: Text(s.name),
                  subtitle: Text('${s.email} - ${s.className}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showUpdateForm(s),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteStudent(s.id!),
                      ),
                      IconButton(
                        icon: Icon(s.present ? Icons.check_box : Icons.check_box_outline_blank),
                        onPressed: () => _toggleAttendance(s),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
