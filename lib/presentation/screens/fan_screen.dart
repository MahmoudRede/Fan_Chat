import 'package:fanchat/business_logic/cubit/app_cubit.dart';
import 'package:fanchat/constants/app_colors.dart';
import 'package:fanchat/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:favorite_button/favorite_button.dart';

class FanScreen extends StatelessWidget {
  FanScreen({Key? key}) : super(key: key);
  bool isLiked = false;
  bool isVideo = false;
  int noOfLike = 0;
  late VideoPlayerController _controller;
  int curIndex = 0;
  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.myWhite,
          body: GridView.count(
            childAspectRatio: 1 / 1.3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: 3,
            children: List.generate(
              cubit.fanImages.length,
              (index) => Column(
                children: [
                  Stack(
                    children: [
                      cubit.fanImages.contains('.mp4')
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // setState(
                                      //   () {
                                      //     _controller.value.isPlaying
                                      //         ? _controller.pause()
                                      //         : _controller.play();
                                      //   },
                                      // );
                                    },
                                    child: VideoPlayer(_controller),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Positioned(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(Icons.video_library),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Image(
                              height: 153,
                              fit: BoxFit.cover,
                              image: NetworkImage('${cubit.fanImages[index]}'),
                            ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.image,
                            size: 20,
                            color: AppColors.myWhite,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: isLiked
                                        ? FaIcon(
                                            FontAwesomeIcons.solidHeart,
                                            size: 17,
                                            color: Colors.redAccent,
                                          )
                                        : FaIcon(
                                            FontAwesomeIcons.heart,
                                            size: 17,
                                          ),
                                  ),
                                  TextSpan(
                                    text: '$noOfLike',
                                    style: TextStyle(
                                      backgroundColor:
                                          Color.fromRGBO(127, 82, 76, 0.4),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              // setState(() {
                              //   if (isLiked == true) {
                              //     isLiked = false;
                              //     noOfLike -= 1;
                              //   } else {
                              //     isLiked = true;
                              //     noOfLike += 1;
                              //   }
                              // });
                            },
                          ),
                        ),
                      )
                    ],
                  ),

                  ///////////
                  // Stack(
                  //   children: [
                  //     Image(
                  //       height: 153,
                  //       fit: BoxFit.cover,
                  //       image: NetworkImage('${cubit.fanImages[index]}'),
                  //     ),
                  //     Positioned(
                  //       top: 0,
                  //       right: 0,
                  //       child: IconButton(
                  //           onPressed: () {},
                  //           icon: Icon(
                  //             Icons.image,
                  //             color: AppColors.myWhite,
                  //           )),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
