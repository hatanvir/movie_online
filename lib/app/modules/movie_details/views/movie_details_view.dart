import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_online/app/extensions/space_extension.dart';

import '../../../core/base/base_screen_size.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/movie_details_controller.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  MovieDetailsView({Key? key}) : super(key: key);

  Function? hp;
  Function? wp;

  @override
  Widget build(BuildContext context) {
    hp = Screen(MediaQuery.of(context).size).hp;
    wp = Screen(MediaQuery.of(context).size).wp;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _topImageWidget(),

            _backButtonWidget(),

            _movieDetailsWidget()

          ],
        )
        ),
    );
  }

  ///top image
  Widget _topImageWidget()=> Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
          height: hp!(55),
          child: CachedNetworkImage(
            imageUrl: controller.movies?.posterUrl??'',
            imageBuilder: (context, imageProvider) => Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            errorWidget: (context, url, error) => Container(
              alignment: Alignment.center,
              child: const Text('Not found'),
            ),
          )
        // ApiConstant.IMAGE_ORIG_POSTER + data.posterPath.toString()),
      )
  );

  ///back button
  Widget _backButtonWidget()=> Positioned(
    top: 10,
    left: 0,
    right: wp!(85),
    child: InkWell(
      onTap: ()=> Get.back(),
      child: CircleAvatar(
        backgroundColor: Colors.grey[700],
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    ),
  );


  ///movie details
  Widget _movieDetailsWidget()=> Positioned(
    top: hp!(55)-20,
    left: 0,
    right: 0,
    child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          color: Colors.white
      ),

      child: Container(
        margin: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.movies?.genres.length,
                itemBuilder: (ctx,i)=> movieTypeItem(controller.movies?.genres[i]??''),
              ),
            ),

            10.height,

            Text(controller.movies?.title??'',
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),),

            5.height,

            RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: 'Year: ',
                      style: TextStyle(color: AppColor.grey)),
                  TextSpan(
                      text: controller.movies?.year??'',
                      style: const TextStyle(color: AppColor.blackColor))
                ])),

            15.height,

            const Text('Director:',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),),

            5.height,

            Text(controller.movies?.director??'',style: const TextStyle(
                fontSize: 13
            ),),

            15.height,

            const Text('Actors:',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),),

            5.height,

            Text(controller.movies?.actors??'',style: const TextStyle(
                fontSize: 13
            ),),

            15.height,


            const Text('Plot:',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),),

            5.height,

            Text(controller.movies?.plot??'',style: const TextStyle(
                fontSize: 13
            ),)

          ],
        ),
      ),
    ),
  );

  movieTypeItem(String s) => Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(left: 5, right: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColor.whitGrey),
        color: AppColor.whiteColor),
    child: Text(
      s,
      style: const TextStyle(
          color: AppColor.grey),
    ),
  );
}
