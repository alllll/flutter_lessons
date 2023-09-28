// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:fl_lesson8/album_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumHttpProvider {
  Future<List<AlbumModel>> fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    final list = jsonDecode(response.body);

    return (list as List).map((e) => AlbumModel.fromJson(e)).toList();
  }

  Future<int> createAlbum(AlbumModel model) async {
    final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/albums'),
        body: jsonEncode(model));

    return response.statusCode;
  }
}

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  late final AlbumHttpProvider albumHttpProvider;

  Future<List<AlbumModel>>? future;

  @override
  void initState() {
    super.initState();
    albumHttpProvider = AlbumHttpProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          future = albumHttpProvider.fetchAlbums();
                        });
                      },
                      child: const Text('Получить альбомы')),
                  ElevatedButton(
                      onPressed: () async {
                        final result = await albumHttpProvider.createAlbum(
                            const AlbumModel(userId: 1, id: 1, title: 'Test'));
                        if (mounted) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title:
                                      Text('Запрос выполнен с кодом $result'),
                                );
                              });
                        }
                      },
                      child: const Text('Создать альбом')),
                ],
              ),
              FutureBuilder(
                  future: future,
                  builder: ((context, snapshot) {
                    if (snapshot.data != null && snapshot.hasData) {
                      return Column(
                        children: [
                          ...snapshot.data?.map((e) => Row(
                                    children: [
                                      Text('ID: ${e.id}'),
                                      Expanded(
                                          child: Text('Title: ${e.title} '))
                                    ],
                                  )) ??
                              []
                        ],
                      );
                    }

                    return const Text('No albums');
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
