import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class App1 extends StatefulWidget {
  const App1({super.key});

  @override
  State<App1> createState() => _App1State();
}

class _App1State extends State<App1> {
  final TextEditingController _data =
      TextEditingController(text: 'Текст для проверки записи');

  final _fileName = 'temp_file.txt';

  final _formKey = GlobalKey<FormState>();

  /// Temporary directory. Временный каталог (кеш)
  Future<String> get _tempPath async {
    final directory = await getTemporaryDirectory();

    return directory.path;
  }

  /// Documents directory.  Каталог, в котором приложение может хранить файлы, доступ к которым есть только у него
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _getFile async {
    final path = await _localPath;

    return File('$path/$_fileName');
  }

  Future<File> writeData(String data) async {
    final file = await _getFile;

    // Write the file
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await _getFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return empty string
      return '';
    }
  }

  Future<void> onSubmit() async {
    if (_formKey.currentState!.validate()) {
      writeData(_data.text);

      setState(() {});
    }
  }

  Future<void> onDeleteFile() async {
    final file = await _getFile;

    if (file.existsSync()) {
      file.deleteSync();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                FutureBuilder(
                  future: _tempPath,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    return Text('Temp folder: ${snapshot.data}');
                  },
                ),
                const SizedBox(height: 16.0),
                FutureBuilder(
                  future: _localPath,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    return Text('Document folder: ${snapshot.data}');
                  },
                ),
                const SizedBox(height: 16.0),
                FutureBuilder(
                  future: readData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    if (snapshot.data!.isEmpty) {
                      return const SizedBox();
                    }

                    return Text('Data from file: ${snapshot.data}');
                  },
                ),
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
                    onPressed: onDeleteFile, child: const Text('Delete file')),
              ],
            ),
          ),
        ));
  }
}
