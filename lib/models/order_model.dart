class MyOrders {
  final String name;
  final String status;
  final String date;
  final String orderId;
  final String address;
  final String phone;
  final String imageUrl;

  const MyOrders({
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.date,
    required this.orderId,
    required this.address,
    required this.phone,
  });
}
