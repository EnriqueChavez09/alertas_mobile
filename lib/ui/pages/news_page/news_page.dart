import 'package:alertas/models/models.dart';
import 'package:alertas/services/services.dart';
import 'package:alertas/theme/theme.dart';
import 'package:alertas/ui/common/common.dart';
import 'package:alertas/ui/pages/news_page/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsModel>? listNews;

  getListNews() async {
    listNews = await NewsService.geListNews();
    if (listNews != null) {
      listNews = listNews!.reversed.toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getListNews();
  }

  @override
  Widget build(BuildContext context) {
    return listNews != null
        ? Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "formPage").then((value) {
                  setState(() {});
                });
              },
              backgroundColor: AppTheme.secondaryColor,
              child: const Icon(
                Icons.add,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Noticias",
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: listNews!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemNewsWidget(
                            model: listNews![index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : LoadingWidget();
  }
}
