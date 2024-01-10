import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../data/json_data.dart';
import '../widgets/spacing.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
                Text(
                  Constants.headerTitles,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Icon(Icons.more_vert)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newsOutLets.length,
              itemBuilder: (context, index) {
                var data = newsOutLets[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: Constants.primaryColor,
                      ),
                    ),
                    child: Image.asset(data['image']),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Spacing(
            height: 1.2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Premier league updates and reactions to wales draw in the Euros',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2024/01/04/16/48/landscape-8487906_1280.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('08 Hours ago'),
                      Row(
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
                  )
                ],
              ),
            ),
          ),
          const Spacing(
            height: 0.5,
          ),
        ],
      ),
    );
  }
}
