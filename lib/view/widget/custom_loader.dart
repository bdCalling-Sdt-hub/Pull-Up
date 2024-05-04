import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pull_up/utils/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key, this.size = 60});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: AppColors.primaryColor,
        size: size,
      ),
    );
  }
}
