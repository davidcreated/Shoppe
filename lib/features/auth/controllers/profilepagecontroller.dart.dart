import 'package:get/get.dart';

// Enum to represent the order status tabs
enum OrderStatus { toPay, toReceive, toReview }

class ProfilepageController extends GetxController {
  // Observable to hold the currently selected order status
  final selectedOrderStatus = OrderStatus.toReceive.obs;

  /// Sets the selected order status.
  void selectOrderStatus(OrderStatus status) {
    selectedOrderStatus.value = status;
  }
}
