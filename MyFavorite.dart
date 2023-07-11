import 'package:flutter/material.dart';
import 'package:flutter_application_3/MyBloggerData.dart';
import 'package:flutter_application_3/MyDetail.dart';
import 'package:flutter_application_3/MyDetailBlogger.dart';
import 'package:flutter_application_3/Provider.dart';
import 'package:provider/provider.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({super.key});

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  late Blogger blogPosts;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favoriteProvider, _) {
        final favoritePosts = favoriteProvider.favoritePosts;

        return Scaffold(
          body: _buildFavoriteList(favoritePosts, favoriteProvider),
        );
      },
    );
  }

  Widget _buildFavoriteList(
    List<BlogPost> favoritePosts,
    FavoriteProvider favoriteProvider,
  ) {
    if (favoritePosts.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 48.0,
            ),
            SizedBox(height: 16.0),
            Text(
              "Belum ada favorite yang tersimpan",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoritePosts.length,
        itemBuilder: (BuildContext context, int index) {
          final blogPost = favoritePosts[index];

          return Dismissible(
            key: Key(blogPost.title),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              favoriteProvider.removeFromFavorite(blogPost);
            },
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16.0),
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                _navigateToDetailPage(context, blogPost);
              },
              child: Card(
                margin: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        blogPost.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              blogPost.title,
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void _navigateToDetailPage(BuildContext context, BlogPost blogPost) {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => blogPost is Blogger ? MyDetailBlogger(blogPosts) : MyDetail(blogPosts: blogPost),
    ),
  );
  }
}