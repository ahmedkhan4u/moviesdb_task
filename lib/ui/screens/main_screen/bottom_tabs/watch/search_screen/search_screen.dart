import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/constants/app_configs.dart';
import 'package:moviesdb_task/core/constants/screen_utils.dart';
import 'package:moviesdb_task/ui/screens/main_screen/bottom_tabs/watch/search_screen/search_screen_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search_screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider(
      create: (BuildContext context) => SearchScreenVm(context: context),
      child: Consumer<SearchScreenVm>(
        builder: (context, vm, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight(5.h),
                  ///Search Textfield
                  TextFormField(
                    controller: vm.searchC,
                    onChanged: (text) {
                      vm.filterData(text);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                      hintText: 'TV shows, movies and more',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: vm.searchC.text.isNotEmpty
                          ? GestureDetector(
                        onTap: () {
                          vm.clearController();
                        },
                        child: const Icon(Icons.clear),
                      )
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          )),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          )),
                    ),
                  ),

                  kHeight(3.h),

                  Text(
                    'Top Results',
                    style: textTheme.titleLarge,
                  ),

                  kHeight(0.5.h),

                  const Divider(),
                  ///search tile
                  ///Listview
                  Expanded(
                    child: ListView.builder(
                      itemCount: vm.moviesList.length,
                      itemBuilder: (context, index) {
                        final data = vm.moviesList[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(13.px),
                                  child: Image.network(AppConfigs.imageUrl + data.backdropPath,
                                    fit: BoxFit.cover,
                                    height: 14.h,
                                    width: 19.h,
                                  ),
                                ),
                                kWidth(3.w),
                                SizedBox(
                                  width: 42.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
                                      ),
                                      kHeight(1.h),
                                      const Text(
                                        "Action",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.more_horiz,
                                  color: Colors.lightBlue,
                                  size: 23.sp,
                                )
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
        },
      ),
    );
  }
}