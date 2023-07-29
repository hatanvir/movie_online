import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:movie_online/app/core/base/base_screen_size.dart';
import 'package:movie_online/app/core/values/app_colors.dart';
import 'package:movie_online/app/core/widgets/no_data_found_widget.dart';
import 'package:movie_online/app/data/models/movie_response.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_online/app/extensions/space_extension.dart';
import 'package:movie_online/app/routes/app_pages.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../controllers/movie_controller.dart';

class MovieView extends GetView<MovieController> {
  MovieView({Key? key}) : super(key: key);

  Function? hp;
  Function? wp;

  @override
  Widget build(BuildContext context) {
    hp = Screen(MediaQuery.of(context).size).hp;
    wp = Screen(MediaQuery.of(context).size).wp;

    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: customAppbar(title: "MovieOnline"),
        body: Obx(
          () => controller.isLoadingData.value
              ? const Center(child: CircularProgressIndicator())
              : controller.movieListTemp.isEmpty
                  ? const NoDataFound()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        movieTypeWidget(),
                        15.height,
                        totalMovieWidget(),
                        15.height,
                        movieListWidget(),
                      ],
                    ),
        ));
  }

  ///movie type widget to filter movies by categories
  Widget movieTypeWidget() => Container(
        height: 40,
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Obx(() => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.movieTypeList.length,
              itemBuilder: (ctx, i) =>
                  movieTypeItem(controller.movieTypeList[i]),
            )),
      );

  ///movie type item
  Widget movieTypeItem(String name) => InkWell(
        onTap: () {
          controller.selectedMovieType.value = name;
          controller.getMovieByType();
        },
        borderRadius: BorderRadius.circular(20),
        child: Obx(
          () => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColor.whitGrey),
                color: controller.selectedMovieType.value == name
                    ? AppColor.blackColor
                    : AppColor.whiteColor),
            child: Text(
              name,
              style: TextStyle(
                  color: controller.selectedMovieType.value == name
                      ? AppColor.whiteColor
                      : AppColor.grey),
            ),
          ),
        ),
      );

  Widget totalMovieWidget() => Obx(() => Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Text(
          '${controller.movieListTemp.length} ${controller.selectedMovieType.value} movies')));

  ///movie list widget to show movie
  Widget movieListWidget() => Expanded(
        child: Obx(() => ListView.separated(
            controller: controller.scrollController,
            itemCount: controller.movieListTemp.value.length,
            itemBuilder: (ctx, i) => movieItem(controller.movieListTemp[i]),
            separatorBuilder: (ctx, i) => 10.height)),
      );

  ///movie item
  Widget movieItem(Movies movie) => InkWell(
        onTap: () {
          Get.toNamed(Routes.MOVIE_DETAILS, arguments: {'movie': movie});
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColor.whitGrey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl: movie.posterUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      alignment: Alignment.center,
                      height: hp!(18),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      alignment: Alignment.center,
                      height: hp!(18),
                      child: const Text('Not found'),
                    ),
                  ),
                ),
              ),
              10.width,
              Expanded(
                flex: 6,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      10.height,
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Year: ',
                            style: TextStyle(color: AppColor.grey)),
                        TextSpan(
                            text: movie.year,
                            style: const TextStyle(color: AppColor.blackColor))
                      ])),
                      10.height,
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Director: ',
                            style: TextStyle(color: AppColor.grey)),
                        TextSpan(
                            text: movie.director,
                            style: const TextStyle(color: AppColor.blackColor))
                      ])),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
