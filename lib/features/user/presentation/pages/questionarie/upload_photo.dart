import 'package:flutter/material.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text(
            LocalizationMap.getTranslatedValues("upload_your_photo"),
            style: R.textStyles
                .poppins(fontWeight: FontWeight.w600, fontSize: 20.sp),
          ),
        ),
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(8),
          decoration: R.decoration.imageDecoration(
              backgroundColor: R.colors.secondaryColor,
              imagePath: R.images.userImg),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: -15,
                right: -15,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: R.decoration.imageDecoration(
                      backgroundColor: R.colors.white,
                      imagePath: R.images.downloadIcon),
                ),
              )
            ],
          ),
        ),
        Text(
          LocalizationMap.getTranslatedValues("Choose_your_avatar"),
          style: R.textStyles
              .poppins(fontWeight: FontWeight.w600, fontSize: 20.sp),
        ),
        SizedBox(
          width: mediaQuery.size.width,
          height: 70,
          child: ListView.builder(
            itemBuilder: (context, index) => avatarItem(
                avatarPath: DummyList.avatarList[index],
                backgroundColor: selectedIndex == index
                    ? R.colors.secondaryColor
                    : R.colors.primaryColor,
                index: index),
            itemCount: DummyList.avatarList.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget avatarItem(
      {required String avatarPath,
      required Color backgroundColor,
      required int index}) {
    return GestureDetector(
      onTap: () {
        selectedIndex = index;
        setState(() {});
      },
      child: Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: R.decoration.imageDecoration2(
            imagePath: avatarPath,
            radius: 12,
            backgroundColor: backgroundColor),
      ),
    );
  }
}
