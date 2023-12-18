import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/wallpaper.dart';

class ShowImagesView extends StatefulWidget {
  final String img;
  ShowImagesView(this.img);

  @override
  _ShowImagesViewState createState() => _ShowImagesViewState();
}

class _ShowImagesViewState extends State<ShowImagesView> {
  RxString home = "Home Screen".obs,
      lock = "Lock Screen".obs,
      both = "Both Screen".obs;
  // system = "System".obs;

  // late Stream<String> progressString;
  // late RxString res;
  RxBool downloading = false.obs;

  RxBool _isDisable = true.obs;

  Future<void> dowloadImage() async {
    final progressString = Wallpaper.imageDownloadProgress(widget.img);

    progressString.listen(
      (data) {
        // res.value = data;
        downloading.value = true;
      },
      onDone: () async {
        downloading.value = false;
        _isDisable.value = false;
      },
      onError: (error) {
        downloading.value = false;
        _isDisable.value = true;
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: screenSize.height * 0.2,
                  ),
                  Container(
                    width: screenSize.width * 0.4,
                    height: screenSize.height * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: downloading.value
                          ? imageDownloadDialog()
                          : Image.network(
                              widget.img,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      return await dowloadImage();
                    },
                    child: Text("please download the image"),
                  ),
                  ElevatedButton(
                    onPressed: _isDisable.value
                        ? null
                        : () async {
                            var width = MediaQuery.of(context).size.width;
                            var height = MediaQuery.of(context).size.height;
                            home.value = (await Wallpaper.homeScreen(
                                options: RequestSizeOptions.RESIZE_FIT,
                                width: width,
                                height: height));

                            downloading.value = false;
                            home = home;
                          },
                    child: Text(home.value),
                  ),
                  ElevatedButton(
                    onPressed: _isDisable.value
                        ? null
                        : () async {
                            lock.value = await Wallpaper.lockScreen();

                            downloading.value = false;
                            lock = lock;
                          },
                    child: Text(lock.value),
                  ),
                  ElevatedButton(
                    onPressed: _isDisable.value
                        ? null
                        : () async {
                            both.value = await Wallpaper.bothScreen();

                            downloading.value = false;
                            both = both;
                          },
                    child: Text(both.value),
                  ),
                  // ElevatedButton(
                  //   onPressed: _isDisable.value
                  //       ? null
                  //       : () async {
                  //           system.value = await Wallpaper.systemScreen();

                  //           downloading.value = false;
                  //           system = system;
                  //         },
                  //   child: Text(system.value),
                  // ),
                ],
              ),
            )),
      ),
    );
  }

  Widget imageDownloadDialog() {
    return Container(
      height: 120.0,
      width: 200.0,
      child: Card(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 20.0),
            Text(
              "Downloading File : ",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
