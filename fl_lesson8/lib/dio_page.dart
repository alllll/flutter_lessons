// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:fl_lesson8/album_model.dart';
import 'package:fl_lesson8/rest_album_provider.dart';
import 'package:flutter/material.dart';

class AlbumDioProvider {
  final Dio dio = Dio();

  Future<List<AlbumModel>> fetchAlbums(CancelToken cancelToken) async {
    final response = await dio.get(
        'https://jsonplaceholder.typicode.com/albums',
        cancelToken: cancelToken);

    return (response.data as List).map((e) => AlbumModel.fromJson(e)).toList();
  }

  Future<int> createAlbum(AlbumModel model) async {
    final response = await dio
        .post('https://jsonplaceholder.typicode.com/albums', data: model);

    return response.statusCode ?? 0;
  }
}

class DioPage extends StatefulWidget {
  const DioPage({super.key});

  @override
  State<DioPage> createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  Future<List<AlbumModel>>? future;

  late final AlbumDioProvider albumDioProvider;
  late final RestAlbumProvider restAlbumProvider;

  @override
  void initState() {
    super.initState();
    albumDioProvider = AlbumDioProvider();
    restAlbumProvider = RestAlbumProvider(Dio());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // final cancelToken = CancelToken();
                        // future = albumDioProvider.fetchAlbums(cancelToken);
                        future = restAlbumProvider.fetchAlbums();
                      });
                    },
                    child: const Text('Получить альбом')),
                ElevatedButton(
                    onPressed: () async {
                      /* final result = await albumDioProvider.createAlbum(
                          const AlbumModel(userId: 1, id: 5, title: 'Test'));*/
                      final result = await restAlbumProvider.createAlbum(
                          const AlbumModel(userId: 1, id: 5, title: 'Test'));

                      if (mounted) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    'Запрос выполнен с кодом ${result.response.statusCode}'),
                              );
                            });
                      }
                    },
                    child: const Text('Создать альбом')),
              ],
            ),
            FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.data != null && snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...snapshot.data?.map((e) => Row(
                                  children: [
                                    Text('Id: ${e.id}  '),
                                    Expanded(child: Text('Title: ${e.title}')),
                                  ],
                                )) ??
                            []
                      ],
                    );
                  }
                  return const Text('No albums');
                })
          ],
        ),
      ),
    );
  }
}
