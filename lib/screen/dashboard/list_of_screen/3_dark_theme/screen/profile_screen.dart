import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        buildProfile(context),
        const Divider(),
        buildPhotos(context),
      ],
    );
  }

  buildPhotos(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "PHOTO",
              style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          buildPhotoGrid()
        ],
      ),
    );
  }

  buildPhotoGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: List.generate(11, (index) {
        final urlImage = 'https://picsum.photos/200/300?random=$index';
        final aspectRatio = index.isEven ? 1.0 : 0.5;
        return AspectRatio(
          aspectRatio: aspectRatio,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(urlImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }),
    );
  }

  buildProfile(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 46,
          backgroundColor: Theme.of(context).iconTheme.color,
          child: CircleAvatar(
            radius: 44,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: ClipOval(
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 40,
                child: Image.network('https://randomuser.me/api/portraits/men/75.jpg'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Jane Doe',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 4),
            Text('New York, USA'),
          ],
        ),
        // SizedBox(height: 16),
        const Text('Photography is the story I fail to put into words'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildCounters(context, '36', 'Posts'),
            buildCounters(context, '3.5K', 'Following'),
            buildCounters(context, '15K', 'Followers'),
          ],
        ),
      ],
    );
  }

  buildCounters(BuildContext context, String firstLine, String secondLine) {
    return Column(
      children: [
        Text(
          firstLine,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(secondLine),
      ],
    );
  }
}
