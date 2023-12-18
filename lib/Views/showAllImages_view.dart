import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_pro_wallpaper/Controllers/theme_controller.dart';
import 'package:hd_pro_wallpaper/Views/showImges_view.dart';

class ShowAllImagesView extends StatefulWidget {
  @override
  State<ShowAllImagesView> createState() => _ShowAllImagesViewState();
}

class _ShowAllImagesViewState extends State<ShowAllImagesView> {
  final themeController = Get.put(ThemeController());

  int num = 0;
  final List<Map<String, String>> items = [
    {
      'item1':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'item2':
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'item3':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    },
    {
      'item1':
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'item2':
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'item3':
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    },
    {
      'item1':
          "https://images.pexels.com/photos/10069890/pexels-photo-10069890.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      'item2':
          "https://images.pexels.com/photos/8803905/pexels-photo-8803905.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      'item3':
          "https://images.pexels.com/photos/9556451/pexels-photo-9556451.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    },
    {
      'item1':
          "https://images.pexels.com/photos/10050591/pexels-photo-10050591.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      'item2':
          "https://images.pexels.com/photos/9000160/pexels-photo-9000160.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      'item3':
          "https://images.pexels.com/photos/9676202/pexels-photo-9676202.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: screenSize.width * 0.3,
                          height: screenSize.height * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              Get.to(ShowImagesView(
                                items[index]['item1']!,
                              ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                items[index]['item1']!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width / 60,
                        ),
                        Container(
                          width: screenSize.width * 0.3,
                          height: screenSize.height * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              Get.to(ShowImagesView(items[index]['item2']!));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                items[index]['item2']!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width / 60,
                        ),
                        Container(
                          width: screenSize.width * 0.3,
                          height: screenSize.height * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              Get.to(ShowImagesView(
                                items[index]['item3']!,
                              ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                items[index]['item3']!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height / 300,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
