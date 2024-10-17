import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

import '../../../../core/constants/images.dart';
import '../../../../core/widgets/buttons/color_container.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var intialRating = 3.8;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title:  Text(
          'Checkout',
          style: TextStyle(
            fontSize: 16.sp,
            // color: isDarkTheme ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(),
           Padding(
            padding: EdgeInsets.symmetric(horizontal:18.w, vertical:10.h),
            child: Row(
              children: [
                const Icon(Icons.location_on),
                Text(
                  "Delivery Address",
                  style: TextStyle(
                      //  color: isDarkTheme ? Colors.white : Colors.black,

                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp),
                )
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:18.w, vertical:10.h),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding:  EdgeInsets.symmetric(
                        horizontal:14.w, vertical:14.h),
                    // height: height/4.5,
                    decoration: BoxDecoration(
                        color: context.theme.scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(
                                0.25), // Shadow color with transparency
                            offset: const Offset(
                                0, 4), // Horizontal (x) and Vertical (y) offset
                            blurRadius: 5, // Spread of the shadow
                            spreadRadius: 1, // Spread of the shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.edit_document,
                              color: Colors.grey.shade700,
                            ),
                             SizedBox(
                              width:8.w,
                            )
                          ],
                          // mainAxisSize: MainAxisSize.max,
                        ),
                         Text(
                          "Address:",
                          style: TextStyle(
                              fontSize: 16.sp,
                              //  color:  Colors.black,

                              fontWeight: FontWeight.w600),
                        ),
                         Text(
                          "216 st paul's Rd,London N1 2ll UK",
                          style: TextStyle(
                              fontSize: 14.sp,
                              // color:  Colors.black,

                              fontWeight: FontWeight.w400),
                        ),
                         Text(
                          "Contact:",
                          style: TextStyle(
                              fontSize: 16.sp,
                              // color:  Colors.black,

                              fontWeight: FontWeight.w600),
                        ),
                         Text(
                          "2+44-7843323",
                          style: TextStyle(
                              fontSize: 14.sp,
                              // color: Colors.black,

                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                 SizedBox(
                  width:10.w,
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:15.w, vertical: width * 0.13.h),
                      // height: height/4.5,

                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.25), // Shadow color with transparency
                              offset: const Offset(0,
                                  4), // Horizontal (x) and Vertical (y) offset
                              blurRadius: 5, // Spread of the shadow
                              spreadRadius: 1, // Spread of the shadow
                            ),
                          ],
                          color: context.theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(15)),

                      child: Center(
                        child: Icon(
                          Icons.add_circle_outline,
                          color: Colors.grey.shade700,
                          size: width * 0.12,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:18.w, vertical:10.h),
            child: Row(
              children: [
                Text(
                  "Shopping List",
                  style: TextStyle(
                      color: isDarkTheme ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.25), // Shadow color with transparency
                      offset: const Offset(
                          0, 4), // Horizontal (x) and Vertical (y) offset
                      blurRadius: 10, // Spread of the shadow
                      spreadRadius: 1, // Spread of the shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(8.0.r),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(AppImages.dress),
                          ),

                          //   child: Image.asset(AppImages.logo),),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:8.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "Women's Casual Wear ",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    //     color:  Colors.black,

                                    fontWeight: FontWeight.w600),
                              ),
                               Row(
                                children: [
                                  Text(
                                    "Variations: ",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        //  color:  Colors.black,

                                        fontWeight: FontWeight.w500),
                                  ),
                                  const ColorContainer(
                                    text: "Red",
                                  ),
                                  const ColorContainer(
                                    text: "Black",
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "$intialRating",
                                    style: const TextStyle(
                                        //  color:  Colors.black,

                                        ),
                                  ),
                                  // Displaying a static rating
                                  // RatingBarIndicator(
                                  //   rating: 3.5,
                                  //   itemBuilder: (context, index) => Icon(
                                  //     Icons.star,
                                  //     color: Colors.amber,
                                  //   ),
                                  //   itemCount: 5,
                                  //   itemSize: 50.0,
                                  //   direction: Axis.horizontal,
                                  // ),
                                  // SizedBox(height:20.h),

                                  // Capturing user input for rating
                                  RatingBar.builder(
                                    initialRating: intialRating,
                                    itemSize: 20,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:  EdgeInsets.symmetric(
                                        horizontal:1.w),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(
                                          rating); // Perform action based on the rating
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal:8.w),
                      child: const Divider(),
                    ),
                     Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal:18.w, vertical:10.h),
                      child: Row(
                        children: [
                          Text(
                            "Total Order (1) : ",
                            style: TextStyle(
                                // color: Colors.black,

                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            "\$ 34.00",
                            style: TextStyle(
                                fontSize: 16.sp,
                                //  color:  Colors.black,

                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
