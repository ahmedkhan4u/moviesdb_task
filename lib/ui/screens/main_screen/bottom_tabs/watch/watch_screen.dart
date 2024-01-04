import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/constants/screen_utils.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/search/search_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WatchScreen extends StatelessWidget {
  static const String routeName = '/watch_screen';

  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            kHeight(5.h),

            ///Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Watch',
                  style: textTheme.headlineLarge,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchScreen.routeName);
                  },
                  icon: Icon(Icons.search, size: 22.sp),
                ),
              ],
            ),
            kHeight(1.h),

            ///Listview
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(
                              fit: BoxFit.cover,
                              image: const NetworkImage(
                                  "https://media.istockphoto.com/id/1488301035/photo/buying-movie-tickets.jpg?s=1024x1024&w=is&k=20&c=nM75AWVOOHowXrayRHUT-Ite9EmruVtqBjXqRSeAWIs="),
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

                                  Color(0xCC000000), // Dark color at the bottom
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "TXT",
                              style: textTheme.headlineLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      kHeight(1.5.h),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
