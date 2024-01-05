import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/constants/app_colors.dart';
import 'package:moviesdb_task/core/constants/app_configs.dart';
import 'package:moviesdb_task/core/constants/screen_utils.dart';
import 'package:moviesdb_task/core/provider/movies_list_provider.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/movie_details/movie_details_screen.dart';
import 'package:moviesdb_task/ui/screens/main_screen/main_screen_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
      body: Column(
        children: [
          kHeight(5.h),

          ///Header Row
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Watch',
                  style: textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () {

                    Provider.of<MainScreenVM>(context, listen: false)
                        .setSelectedIndex(10);
                  },
                  icon: Icon(Icons.search, size: 22.sp),
                ),
              ],
            ),
          ),

          ///Listview
          Expanded(
            child: Container(
              width: 100.w,
              color: AppColors.light,
              padding: const EdgeInsets.all(12),
              child: Consumer<MoviesListProvider>(
                builder: (context, moviesListP, child) {

                  if (moviesListP.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (moviesListP.moviesList.isEmpty) {
                    return Center(child: Text(
                      "No Data",
                      style: textTheme.headlineLarge!.copyWith(
                        color: Colors.black,
                      ),
                    ));
                  }
                  return ListView.builder(
                    itemCount: moviesListP.moviesList.length,
                    itemBuilder: (context, index) {
                      final data = moviesListP.moviesList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,
                              MovieDetailScreen.routeName, arguments: data);
                        },
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),

                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      AppConfigs.imageUrl+data.backdropPath
                                    ),
                                    height: 50.w,
                                    width: 100.w,
                                  ),
                                ),
                                Container(
                                  height: 50.w,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.transparent,
                                        // Colors.transparent,

                                        Color(0xCC000000),
                                        // Dark color at the bottom
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    data.title,
                                    style: textTheme.titleLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            kHeight(1.5.h),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}