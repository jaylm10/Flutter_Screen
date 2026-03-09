import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen1/bloc/bloc/form_bloc.dart';

class Form1 extends StatefulWidget {
  const Form1({super.key});

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  final _fomrkey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  // final List<Map<String, String>> _submittedUsers = [];

  @override
  void dispose() {
    _username.dispose();
    _mobile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form'), backgroundColor: Colors.white),
      body: BlocListener<FormBloc, FormBlocState>(
        listener: (context, state) {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Form(
            key: _fomrkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _username,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                  validator: (value) {
                    return (value == null || value.isEmpty) ? 'Field can not be null' : null;
                  },
                ),
            
                const SizedBox(height: 15),
            
                TextFormField(
                  controller: _mobile,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your mobile',
                  ),
                  validator: (value) {
                    return (value == null || value.isEmpty) ? 'Field can not be null' : null;
                  },
                ),
            
                const SizedBox(height: 15),
            
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if(_fomrkey.currentState!.validate()){
                        
                      final username = _username.text.trim();
                      final mobile = _mobile.text.trim();
            
            
            
                      
                      context.read<FormBloc>().add(
                        SubmitEvent(name: username, mobile: mobile),
                      );
            
                      _username.clear();
                      _mobile.clear();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
            
                const SizedBox(height: 15),
            
                Expanded(
                  child: BlocBuilder<FormBloc, FormBlocState>(
                    builder: (context, state) {
                      if (state is FormInitial) {
                        return const Center(child: Text('No submissions yet'));
                      }
            
                      if (state is FormLoaded) {
                        final users = state.users;
            
                        return ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
            
                            return Card(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: ListTile(
                                title: Text(user.name),
                                subtitle: Text(user.mobile),
                                trailing: TextButton(
                                  onPressed: () {
                                    _username.text = user.name;
                                    _mobile.text = user.mobile;
            
                                    context.read<FormBloc>().add(
                                      EditEvent(index: index),
                                    );
                                  },
                                  child: Icon(Icons.edit),
                                ),
                              ),
                            );
                          },
                        );
                      }
            
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
