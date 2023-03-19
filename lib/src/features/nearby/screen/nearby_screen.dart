import 'package:flutter/material.dart';
import 'package:hotelio/src/config/app_assets.dart';
import 'package:hotelio/src/config/app_colors.dart';

class Nearby extends StatelessWidget {
  const Nearby({super.key});

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
        ],
      ),
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
