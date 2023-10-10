import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App2 extends StatefulWidget {
  const App2({super.key});

  @override
  State<App2> createState() => _App2State();
}

class _App2State extends State<App2> {
  bool isLoading = true;

  late SharedPreferences prefs;

  final TextEditingController _data = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      isLoading = false;
    });
  }

  Future<void> onSubmit() async {
    if (_formKey.currentState!.validate()) {
      // Obtain shared preferences.

      await prefs.setInt('counter', int.tryParse(_data.text) ?? 0);

      // await prefs.setBool('repeat', true);

      // await prefs.setDouble('decimal', 1.5);

      await prefs.setString('action', _data.text);

      // await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);

      setState(() {});
    }
  }

  Future<void> onDeleteFile() async {
    // prefs.clear();
    prefs.remove('counter');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Text(
                          '${prefs.getInt('counter') ?? 'No data in counter'}'),
                      Text(prefs.getString('action') ?? 'No data in action'),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _data,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter data';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text('Data'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                          onPressed: onSubmit, child: const Text('Submit')),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                          onPressed: onDeleteFile,
                          child: const Text('Delete file')),
                    ],
                  ),
                ),
              ));
  }
}
