import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/constants/app_colors.dart';
import 'package:moviesdb_task/core/constants/app_configs.dart';
import 'package:moviesdb_task/core/constants/screen_utils.dart';
import 'package:moviesdb_task/core/models/movies_list_api.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/movie_details/components/custom_chip.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/movie_details/movie_details_screen_vm.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/movie_details/watch_trailer/watch_trailer.dart';
import 'package:moviesdb_task/ui/widgets/default_button.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatelessWidget {
  static const String routeName = '/movie_detail_screen';

  final MoviesList movieListItem;

  const MovieDetailScreen({super.key, required this.movieListItem});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          MovieDetailVm(context: context, movieListData: movieListItem),
      child: Scaffold(
        body: Consumer<MovieDetailVm>(
          builder: (context, vm, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // kHeight(5.h),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        AppConfigs.imageUrl + movieListItem.backdropPath,
                        height: 55.h,
                        width: 55.h,
                        fit: BoxFit.cover,
                      ),
              
                      ///Black Shadow to image bottom
                      Container(
                        height: 55.h,
                        width: 55.h,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              // Colors.transparent,
              
                              Color(0xCC000000), // Dark color at the bottom
                            ],
                          ),
                          // borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      Positioned(
                        top: 30.sp,
                        left: 17.sp,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                            kWidth(5.w),
                            Text(
                              "Watch",
                              style: textTheme.titleLarge!.copyWith(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "In Theaters December 22, 2021",
                              style: textTheme.titleLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            kHeight(2.h),
                            DefaultButton(
                              width: 60.w,
                              buttonColor: AppColors.appPrimary,
                              onPress: () {},
                              title: "Get Tickets",
                            ),
                            kHeight(1.h),
                            vm.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : DefaultButton(
                                    width: 60.w,
                                    buttonColor: Colors.transparent,
                                    onPress: () {
                                      Navigator.pushNamed(
                                          context, WatchTrailerScreen.routeName,
                                          arguments: vm.movieDetailsList[0]);
                                    },
                                    title: "Watch Trailer",
                                    border: Border.all(
                                      color: AppColors.appPrimary,
                                      // You can set the color of the border
                                      width:
                                          2.0, // You can set the width of the border
                                    ),
                                  ),
                            kHeight(3.h),
                          ],
                        ),
                      )
                    ],
                  ),
                  kHeight(2.h),
              
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.sp, vertical: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Genres',
                          style: textTheme.titleLarge,
                        ),
                        kHeight(2.h),
                        Row(
                          children: [
                            const CustomChip(
                                color: AppColors.appPrimary, text: "Action"),
                            kWidth(1.w),
                            const CustomChip(
                                color: AppColors.appPink, text: "Thriller"),
                            kWidth(1.w),
                            const CustomChip(
                                color: AppColors.appPurple, text: "Science"),
                            kWidth(1.w),
                            const CustomChip(
                                color: AppColors.appYellow, text: "Fiction"),
                          ],
                        ),
                        kHeight(2.h),
                        const Divider(
                          color: AppColors.light,
                        ),
                        kHeight(1.h),
                        Text(
                          'Overview',
                          style: textTheme.titleLarge,
                        ),
                        kHeight(2.h),
                        SizedBox(
                          height: 20.h,
                          // color: Colors.red,
                          child: Text(
                            movieListItem.overview,
                            style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.justify,
                            // overflow: TextOverflow.ellipsis,
                            // maxLines: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
