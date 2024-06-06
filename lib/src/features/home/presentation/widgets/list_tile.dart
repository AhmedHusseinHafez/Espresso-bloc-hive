import 'package:cached_network_image/cached_network_image.dart';
import 'package:espressoblochive/src/core/resources/font_manager.dart';
import 'package:espressoblochive/src/core/resources/style_manager.dart';
import 'package:espressoblochive/src/features/home/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        color: const Color(0xffD2DBEA),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 160.w,
            height: 140.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: CachedNetworkImage(
              imageUrl: product.photoUrl,
              fit: BoxFit.cover,
            ),
          ),
          15.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: StyleManager.getMediumStyle(
                  fontSize: FontSize.s14,
                ),
              ),
              SizedBox(
                width: 160.w,
                child: Text(
                  product.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: StyleManager.getRegularStyle(
                    fontSize: FontSize.s14,
                    color: const Color(
                      0xff625B71,
                    ),
                  ),
                ),
              ),
              5.verticalSpace,
              Row(
                children: [
                  Text(
                    convertDateFormat("Updated At: "),
                    style: StyleManager.getSemiBoldStyle(
                      fontSize: FontSize.s13,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    convertDateFormat(product.updatedAt.toString()),
                    style: StyleManager.getRegularStyle(
                      fontSize: FontSize.s12,
                      color: const Color(
                        0xff625B71,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    width: 80.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: const Color(0xff546A83),
                    ),
                    child: Center(
                        child: Text(
                      product.category,
                      style: StyleManager.getRegularStyle(
                        fontSize: FontSize.s14,
                        color: Colors.white,
                      ),
                    )),
                  ),
                  25.horizontalSpace,
                  Text(
                    convertDateFormat("${product.price.toString()}\$"),
                    style: StyleManager.getRegularStyle(
                      fontSize: FontSize.s14,
                      color: const Color(
                        0xff625B71,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

String convertDateFormat(String iso8601Date) {
  try {
    DateTime dateTime = DateTime.parse(iso8601Date);

    String dateString = DateFormat('yyyy-MM-dd', 'en').format(dateTime);
    return dateString;
  } catch (e) {
    return iso8601Date;
  }
}
