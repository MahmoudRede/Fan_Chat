import 'package:carousel_slider/carousel_slider.dart';
import 'package:fanchat/business_logic/cubit/app_cubit.dart';
import 'package:fanchat/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen(
      {Key? key, required this.pageHeight, required this.pageWidth})
      : super(key: key);
  final double? pageHeight;
  final double? pageWidth;
   ScrollController _childScrollController = ScrollController();
   ScrollController _parentScrollController = ScrollController();

  @override

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state){

      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.myWhite,
          body: SingleChildScrollView(
            controller:_parentScrollController ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: cubit.carouselImage.map((e) {
                    return Image(
                      image: AssetImage(e),
                      width: double.infinity,fit: BoxFit.cover,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 250,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayCurve: Curves.fastOutSlowIn
                  ),
                ),
                const SizedBox(height: 15,),
                NotificationListener(
                  onNotification: (ScrollNotification notification) {
                    if (notification is ScrollUpdateNotification) {
                      if (notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent) {
                        debugPrint('Reached the bottom');
                        _parentScrollController.animateTo(
                            _parentScrollController.position.maxScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      } else if (notification.metrics.pixels ==
                          notification.metrics.minScrollExtent) {
                        debugPrint('Reached the top');
                        _parentScrollController.animateTo(
                            _parentScrollController.position.minScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      }
                    }
                    return true;
                  },
                    child: ListView.separated(
                        controller: _childScrollController,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Column(
                          children: [
                            const SizedBox(height:10,),
                            buidPostItem(context),
                          ],
                        ),
                        separatorBuilder: (context,index)=>Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            color: Colors.grey.shade300,
                            width: double.infinity,
                            height: 1,
                          ),
                        ),
                        itemCount: 10),
                ),

              ],
            ),
          ),
          floatingActionButton:  SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                  child: IconButton(icon:Icon(Icons.photo),onPressed: (){},),
                  label: 'add photo'
              ),
              SpeedDialChild(
                  child: IconButton(icon:Icon(Icons.video_camera_back_outlined),onPressed: (){},),
                  label: 'add video'
              ),
            ],
          ),
        );
      },
    );
  }
}

