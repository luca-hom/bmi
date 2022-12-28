import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../BaseAppBar.dart';


class Settings_Users extends StatefulWidget{
  const Settings_Users({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsUserState();

}

class _SettingsUserState extends State<Settings_Users> {
  List<String>? _userList;
  String? _activeUser = "placeholder";

  @override
  void initState() {
    super.initState();
    _loadUsers();
    _loadActiveUser();

  }

  Future<void> _loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userList = prefs.getStringList('users');
    });
  }

  _saveUsers(String name) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      var value = prefs.getStringList('users');
      value ??= ['']; //check if list is null
      if (!value.contains(name)) {
        value.add(name);
      }
      prefs.setStringList('users', value);
      print(value);
      });
  }

  Future<void> _loadActiveUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _activeUser = prefs.getString('active_user');
      print('active User: $_activeUser');
    });
  }
  _saveActiveUser(String value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('active_user', value);
      print('saved as active user in method: $value');

    });
  }


  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    return Scaffold(
        appBar: BaseAppBar(
          title: Text('User Settings'),
          appBar: AppBar(),
        ), // body is the majority of the screen.
        body: Container(
            alignment: Alignment.center,
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Active User: '),
                        SizedBox(width: 20),
                        DropdownButton(
                            value: _activeUser,
                            items: _userList?.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String> (
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _saveActiveUser(value!);
                                _loadActiveUser();
                              });
                            }),
                      ]

                    ),
                    SizedBox(height: 50),
                    ElevatedButton(onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Add User'),
                          content: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a name')
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel') ,
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () => [_saveUsers(nameController.text),Navigator.pop(context, 'OK')],
                                child: const Text('OK'))
                          ],
                        )),
                        child: Text('Add User', style: TextStyle(fontSize: 20)))
                  ],
                )
            )
        )
    );
  }

}







