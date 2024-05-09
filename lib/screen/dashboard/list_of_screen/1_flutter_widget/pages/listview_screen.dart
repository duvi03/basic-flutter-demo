import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/core/constant/int_extension_file.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Simple Listview"),
                  10.kH,
                  MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (int index = 0; index < 5; index++)
                          Container(
                            color: Colors.yellowAccent,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Text("List $index"),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            20.kH,
            Container(

              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Listview using builder"),
                  10.kH,
                  MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.purpleAccent,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Text("List $index"),
                          );
                        },
                        itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),
            20.kH,
            Container(

              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Listview using separated"),
                  10.kH,
                  MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.yellowAccent,
                          padding: const EdgeInsets.all(12),
                          child: Text("List $index"),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 20.kH;
                      },
                      itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
