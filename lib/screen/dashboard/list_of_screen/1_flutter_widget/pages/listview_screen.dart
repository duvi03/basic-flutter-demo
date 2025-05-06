import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/1_flutter_widget/data/model/picsum_model.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/1_flutter_widget/data/services/api_services.dart';

// class ListViewScreen extends StatelessWidget {
//   const ListViewScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//              Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Simple Listview"),
//                   10.kH,
//                   MediaQuery.removePadding(
//                     context: context,
//                     removeBottom: true,
//                     child: ListView(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       children: [
//                         for (int index = 0; index < 5; index++)
//                           Container(
//                             color: Colors.yellowAccent,
//                             padding: const EdgeInsets.all(12),
//                             margin: const EdgeInsets.only(bottom: 20),
//                             child: Text("List $index"),
//                           )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             20.kH,
//             Container(
//
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Listview using builder"),
//                   10.kH,
//                   MediaQuery.removePadding(
//                     context: context,
//                     removeBottom: true,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           return Container(
//                             color: Colors.purpleAccent,
//                             padding: const EdgeInsets.all(12),
//                             margin: const EdgeInsets.only(bottom: 20),
//                             child: Text("List $index"),
//                           );
//                         },
//                         itemCount: 5,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             20.kH,
//             Container(
//
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Listview using separated"),
//                   10.kH,
//                   MediaQuery.removePadding(
//                     context: context,
//                     removeBottom: true,
//                     child: ListView.separated(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         return Container(
//                           color: Colors.yellowAccent,
//                           padding: const EdgeInsets.all(12),
//                           child: Text("List $index"),
//                         );
//                       },
//                       separatorBuilder: (context, index) {
//                         return 20.kH;
//                       },
//                       itemCount: 5,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ListviewStaticScreen()));
              },
              child: const Text('Static ListView'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ListviewBuilderScreen()));
              },
              child: const Text('ListView Builder'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ListviewSeparatedScreen()));
              },
              child: const Text('ListView Separated'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ListviewHorizontalScreen()));
              },
              child: const Text('ListView Horizontal'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const GridViewScreen()));
              },
              child: const Text('GridView Internet Data'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListviewStaticScreen extends StatelessWidget {
  const ListviewStaticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = List.generate(10, (index) => "Simple List Data ${index + 1}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Static'),
      ),
      body: ListView(
        children: list
            .map((value) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(value),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class ListviewBuilderScreen extends StatelessWidget {
  const ListviewBuilderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = List.generate(20, (index) => "ListView Builder ${index + 1}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Builder'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(list[index]),
              ));
            }),
      ),
    );
  }
}

class ListviewSeparatedScreen extends StatelessWidget {
  const ListviewSeparatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = List.generate(20, (index) => "ListView Separated ${index + 1}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Separated'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(list[index]),
            );
          },
          separatorBuilder: (context, index) => const Divider(
                color: Colors.green,
                thickness: 2,
                indent: 4,
                endIndent: 5,
              ),
          itemCount: list.length),
    );
  }
}

class ListviewHorizontalScreen extends StatelessWidget {
  const ListviewHorizontalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Horizontal'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        height: 150,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return const Card(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: FlutterLogo(size: 100),
              ));
            }),
      ),
    );
  }
}

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<Picsum> list = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: list
              .map(
                (e) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(children: [
                    Image.network(e.thumbnail()),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 32,
                        width: 1000,
                        color: Colors.black45,
                      ),
                    ),
                    Positioned(
                      left: 8,
                      bottom: 8,
                      child: Text(
                        e.author,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  fetchData() async {
    final response = await ApiService().get();
    list.addAll(response);
    setState(() {});
  }
}
