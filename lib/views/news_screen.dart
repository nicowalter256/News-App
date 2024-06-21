import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../controllers/home_controller.dart';
import '../widgets/loading_widget.dart';
import '../widgets/news_widget.dart';
import '../widgets/sources_widget.dart';
import '../widgets/spacing.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  HomeController homeController = HomeController();

  Future<dynamic> doRefresh() async {
    homeController.fetchMore();
  }

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    homeController.fetchNews();
    homeController.fetchNewsSources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: homeController,
      child: Consumer<HomeController>(
        builder: (_, model, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Icon(Icons.more_vert)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  model.loading
                      ? const LoadingWidget()
                      : SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.sources.length,
                            itemBuilder: (context, index) {
                              var data = model.sources[index];
                              return GestureDetector(
                                onTap: () => {
                                  model.fetchNews(source: data.id),
                                },
                                child: SourcesWidget(
                                  source: data,
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
                  model.loading
                      ? const LoadingWidget()
                      : SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          child: RefreshIndicator(
                            onRefresh: doRefresh,
                            child: CustomScrollView(
                                reverse: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                slivers: [
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        var data = model.articles[index];
                                        return NewsWidget(
                                          article: data,
                                        );
                                      },
                                      childCount: model.articles.length,
                                    ),
                                  )
                                ]),
                          ),
                        )

                  // : SmartRefresher(
                  //     controller: RefreshController(),
                  //     enablePullDown: false,
                  //     enablePullUp: true,
                  //     physics: const BouncingScrollPhysics(),
                  //     onLoading: () => model.fetchMore(),
                  //     footer: CustomFooter(builder: (context, mode) {
                  //       if (mode == LoadStatus.idle) {
                  //         return Container();
                  //       } else if (mode == LoadStatus.loading) {
                  //         return const LoadingWidget();
                  //       } else if (mode == LoadStatus.failed) {
                  //         return GestureDetector(
                  //           child: const Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: <Widget>[
                  //                 Icon(
                  //                   Icons.error,
                  //                   color: Constants.errorColor,
                  //                 ),
                  //                 SizedBox(width: 20),
                  //                 Text(
                  //                   'Retry',
                  //                   style: TextStyle(
                  //                       fontSize: 16, color: Colors.black),
                  //                 )
                  //               ]),
                  //           onTap: () {
                  //             model.fetchMore();
                  //           },
                  //         );
                  //       } else if (mode == LoadStatus.canLoading) {
                  //         return Container();
                  //       } else {
                  //         return Container();
                  //       }
                  //     }),
                  //     child: Column(
                  //       children:
                  //           List.generate(model.articles.length, (index) {
                  //         var data = model.articles[index];
                  //         return NewsWidget(
                  //           article: data,
                  //         );
                  //       }),
                  //     ),
                  //   ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
