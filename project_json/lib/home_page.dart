import 'package:flutter/material.dart';
import 'package:project_json/album.dart';
import 'package:project_json/network_manager.dart';

class MyHomePageState extends StatefulWidget {
  const MyHomePageState({super.key});

  @override
  State<MyHomePageState> createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<MyHomePageState> {
  late Future<Album> album;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    album = NetworkManager().fetchAlbum();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Flutter Http Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter Title'),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  album = NetworkManager().createAlbum(_controller.text);
                });
              },
              child: const Text('Create Data'),
            ),
            const SizedBox(height: 10),
            FutureBuilder(
              future: album,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(child: Text(snapshot.data!.title));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ));
  }
}
