import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../models/articles.dart';
import 'spacing.dart';
import 'url_laucher_widget.dart';

class NewsWidget extends StatelessWidget {
  final Article article;
  const NewsWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        LaunchUrl.openUrl(article.url),
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl: article.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('EEEE, d MMM, yyyy').format(
                      DateTime.parse(article.publishedAt),
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.thumb_up_sharp,
                        size: 17,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('400'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.message,
                        size: 17,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('220'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.forward_sharp,
                        size: 17,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('102'),
                    ],
                  )
                ],
              ),
              const Spacing(
                height: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
