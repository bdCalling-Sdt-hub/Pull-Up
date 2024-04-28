import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_images.dart';

enum ImageType { png, svg, network, decorationImage }

class CustomImage extends StatelessWidget {
  final String imageSrc;
  final String defaultImage;
  final Color? imageColor;
  final double? height;
  final double? width;
  final ImageType imageType;
  final BoxFit fill;

  CustomImage({
    required this.imageSrc,
    this.imageColor,
    this.height,
    this.width,
    this.imageType = ImageType.svg,
    this.fill = BoxFit.fill,
    this.defaultImage = AppImages.noImage,
    super.key,
  });

  late Widget imageWidget;
  RxBool networkError = false.obs;

  @override
  Widget build(BuildContext context) {
    if (imageType == ImageType.svg) {
      imageWidget = SvgPicture.asset(
        imageSrc,
        color: imageColor,
        height: height,
        width: width,
        fit: fill,
      );
    }

    if (imageType == ImageType.png) {
      imageWidget = Image.asset(
        imageSrc,
        color: imageColor,
        height: height,
        width: width,
        fit: fill,
        errorBuilder: (context, error, stackTrace) => Image.asset(defaultImage),
      );
    }

    if (imageType == ImageType.network) {
      imageWidget = Image.network(
        imageSrc,
        color: imageColor,
        height: height,
        width: width,
        fit: fill,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(defaultImage);
        },
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
    }

    if (imageType == ImageType.decorationImage) {
      imageWidget = Obx(() => Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: networkError.value
                    ? DecorationImage(
                        fit: fill, image: AssetImage(defaultImage))
                    : DecorationImage(
                        image: NetworkImage(imageSrc),
                        onError: (exception, stackTrace) {
                          networkError.value = true;

                          return;
                        },
                        fit: fill,
                      )),
          ));
    }

    return SizedBox(height: height, width: width, child: imageWidget);
  }
}
