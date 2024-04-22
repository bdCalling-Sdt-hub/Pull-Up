import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_up/utils/app_images.dart';

enum ImageNetworkType {
  image,
  decorationImage,
}

class CustomNetworkImage extends StatelessWidget {
  final String imageSrc;
  final Color? imageColor;
  final double? width;
  final double? height;
  final ImageNetworkType imageType;
  final BoxFit fill;

  CustomNetworkImage({
    required this.imageSrc,
    this.imageColor,
    this.width,
    this.height,
    this.imageType = ImageNetworkType.image,
    this.fill = BoxFit.contain,
    super.key,
  });

  late Widget imageWidget;

  @override
  Widget build(BuildContext context) {
    if (imageType == ImageNetworkType.image) {
      imageWidget = Image.network(
        imageSrc,
        color: imageColor,
        height: height,
        width: width,
        fit: fill,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(AppImages.noImage);
        },
        loadingBuilder: (context, child, loadingProgress) {
          return Image.asset(AppImages.noImage);
        },
      );
    }

    if (imageType == ImageNetworkType.decorationImage) {
      imageWidget = Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: NetworkImage(imageSrc),
              onError: (exception, stackTrace) =>
                  const AssetImage(AppImages.noImage),
              fit: BoxFit.fill,
            )),
      );
    }

    return SizedBox(height: height, width: width, child: imageWidget);
  }
}
