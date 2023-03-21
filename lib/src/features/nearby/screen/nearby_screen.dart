import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hotelio/src/config/app_assets.dart';
import 'package:hotelio/src/config/app_colors.dart';
import 'package:hotelio/src/controllers/nearbyC.dart';

class Nearby extends StatelessWidget {
  Nearby({super.key});
  final cNearby = Get.put(NearbyC());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 31,
        ),
        children: [
          header(context),
          const SizedBox(height: 30),
          searchHotels(),
          const SizedBox(height: 30),
          categories(),
        ],
      ),
    );
  }

  GetBuilder<NearbyC> categories() {
    return GetBuilder<NearbyC>(
      builder: (controller) {
        return SizedBox(
          height: 45,
          child: ListView.builder(
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String category = controller.categories[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 8,
                  top: 0,
                  right: index == controller.categories.length - 1 ? 16 : 8,
                  bottom: 0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    controller.category = category;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: category == controller.category
                        ? AppColor.primaryC
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    category,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Stack searchHotels() {
    return Stack(
      children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search by name or city',
              hintStyle: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(55, 55),
              fixedSize: const Size(55, 55),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: AppColor.secondaryC,
            ),
            child: Image.asset(AppAsset.search),
          ),
        ),
      ],
    );
  }

  Row header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            AppAsset.profile,
            width: 55,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Near Me',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              '189 hotels',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
