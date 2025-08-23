import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/core/constants/appcolors.dart';
import 'package:shoppe/core/constants/apptextstyles.dart';

import 'package:shoppe/features/auth/controllers/profilepagecontroller.dart.dart';
import 'package:shoppe/shared/widgets/orderstatus.dart';
import 'package:shoppe/shared/widgets/storycard.dart' show StoryCard;



class Profilepage extends StatelessWidget {
  const Profilepage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfilepageController());
    final List<String> recentlyViewedImages = [
      'assets/images/pic1.png',
      'assets/images/jeff.png',
      'assets/images/pic2.png',
      'assets/images/pic3.png',
      'assets/images/pic4.png',
      'assets/images/pic1.png',
    ];
     final List<Map<String, dynamic>> stories = [
      {'image': 'assets/images/pic6.png', 'isLive': true},
      {'image': 'assets/images/pic7.png', 'isLive': false},
      {'image': 'assets/images/pic8.png', 'isLive': false},
      {'image': 'assets/images/pic8.png', 'isLive': false},
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(),
              const SizedBox(height: 24),

              // Greeting
              Text("Hello, Romina!", style: AppTextStyles.headline2),
              const SizedBox(height: 16),

              // Announcement Card
              _buildAnnouncementCard(),
              const SizedBox(height: 24),

              // Recently Viewed Section
              Text("Recently viewed", style: AppTextStyles.headline2),
              const SizedBox(height: 16),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recentlyViewedImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(recentlyViewedImages[index]),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // My Orders Section
              Text("My Orders", style: AppTextStyles.headline2),
              const SizedBox(height: 16),
              Obx(
                () => Row(
                  children: [
                    OrderStatusChip(
                      label: 'To Pay',
                      isSelected: controller.selectedOrderStatus.value == OrderStatus.toPay,
                      onTap: () => controller.selectOrderStatus(OrderStatus.toPay),
                    ),
                    const SizedBox(width: 12),
                    OrderStatusChip(
                      label: 'To Recieve',
                      isSelected: controller.selectedOrderStatus.value == OrderStatus.toReceive,
                      onTap: () => controller.selectOrderStatus(OrderStatus.toReceive),
                       showIndicator: true,
                    ),
                     const SizedBox(width: 12),
                    OrderStatusChip(
                      label: 'To Review',
                      isSelected: controller.selectedOrderStatus.value == OrderStatus.toReview,
                      onTap: () => controller.selectOrderStatus(OrderStatus.toReview),
                    ),
                  ],
                ),
              ),
               const SizedBox(height: 24),

              // Stories Section
              Text("Stories", style: AppTextStyles.headline2),
              const SizedBox(height: 16),
               SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return StoryCard(
                      imagePath: stories[index]['image'],
                      isLive: stories[index]['isLive'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
       bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Header Widget
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/jeff.png'),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: Text("My Activity", style: AppTextStyles.button.copyWith(fontSize: 14)),
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.confirmation_number_outlined),color: AppColors.primary,),
            IconButton(onPressed: () {}, icon: const Icon(Icons.tune),color: AppColors.primary,),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined),color: AppColors.primary,),
          ],
        )
      ],
    );
  }

  // Announcement Card Widget
  Widget _buildAnnouncementCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Announcement", style: AppTextStyles.subheading.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
            backgroundColor: AppColors.primary,
            child: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }

// Bottom Navigation Bar Widget
Widget _buildBottomNavBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.mediumGrey,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/home.png',
          height: 24,
          width: 24,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/heart.png',
          height: 24,
          width: 24,
        ),
        label: '', // ✅ required
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/filter icon.png',
          height: 24,
          width: 24,
        ),
        label: '', // ✅ required
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/Cart.png',
          height: 24,
          width: 24,
        ),
        label: '', // ✅ required
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/profile.png',
          height: 24,
          width: 24,
        ),
        label: '', // ✅ required
      ),
    ],
  );
}

}


