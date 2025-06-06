import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../utilities/users_service.dart';
import 'app_drawer_widget.dart';
import 'user_form.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bitcoin App Users")),
      drawer: const AppDrawerWidget(),
      body: FutureBuilder<List<dynamic>>(
        future: UsersService.instance.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(child: Text("No users found."));
          }

          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final user = data[index];

              final fullName =
                  "${user['firstName'] ?? ''} ${user['lastName'] ?? ''}".trim();
              final displayName =
                  fullName.isEmpty ? user['name'] ?? 'No Name' : fullName;

              return ListTile(
                leading:
                    user['avatar'] != null
                        ? CircleAvatar(
                          backgroundImage: NetworkImage(user['avatar']),
                        )
                        : const CircleAvatar(child: Icon(Icons.person)),
                title: Text(displayName),
                subtitle: Text("${user['gender'] ?? 'Unknown'}"),
                trailing: PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder:
                      (_) => [
                        PopupMenuItem(
                          child: const Text('Update'),
                          onTap: () async {
                            final formKey = GlobalKey<FormBuilderState>();
                            Future.delayed(Duration.zero, () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (_) => UserForm(
                                        formKey: formKey,
                                        initialValue: user,
                                        titleText: 'Update User',
                                        onSubmit: () async {
                                          if (formKey.currentState
                                                  ?.saveAndValidate() ??
                                              false) {
                                            await UsersService.instance
                                                .updateUser(
                                                  user['id'].toString(),
                                                  formKey.currentState!.value,
                                                );
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          }
                                        },
                                      ),
                                ),
                              );
                            });
                          },
                        ),
                        PopupMenuItem(
                          child: const Text('Delete'),
                          onTap: () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder:
                                  (_) => AlertDialog(
                                    content: Text(
                                      'Delete user "${user['firstName']} ${user['lastName']}"?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed:
                                            () => Navigator.of(
                                              context,
                                            ).pop(false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed:
                                            () =>
                                                Navigator.of(context).pop(true),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                            );
                            if (confirm ?? false) {
                              await UsersService.instance.deleteUser(
                                user['id'].toString(),
                              );
                              setState(() {});
                            }
                          },
                        ),
                      ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final formKey = GlobalKey<FormBuilderState>();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder:
                  (_) => UserForm(
                    formKey: formKey,
                    titleText: 'Create User',
                    onSubmit: () async {
                      if (formKey.currentState?.saveAndValidate() ?? false) {
                        await UsersService.instance.createUser(
                          formKey.currentState!.value,
                        );
                        Navigator.of(context).pop();
                        setState(() {});
                      }
                    },
                  ),
            ),
          );
        },
      ),
    );
  }
}
