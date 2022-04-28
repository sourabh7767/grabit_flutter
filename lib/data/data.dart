import '../assets.dart';
import '../models/content_model.dart';
import '../models/order_model.dart';

const List<Content> food = [
  Content(
      name: 'Pizza Base',
      imageUrl: Assets.food1,
      description: 'Lorem ipsum mandi house food restaurant app',
      location: 'Cairo',
      phone: '+20 111 562 2222',
      meal: 'Dairy'),
  Content(
      name: 'Tashkila',
      imageUrl: Assets.food2,
      description: 'Lorem ipsum mandi house food restaurant app',
      location: 'Alexandria',
      phone: '+20 111 562 2222',
      meal: 'Vegetables'),
  Content(
      name: 'Mughlia Baithak',
      imageUrl: Assets.food3,
      description: 'Lorem ipsum mandi house food restaurant app',
      location: 'Luxor',
      phone: '+20 111 562 2222',
      meal: 'Pizza Fries'),
  Content(
      name: 'Mataam mandi',
      imageUrl: Assets.food5,
      description: 'Lorem ipsum mandi house food restaurant app',
      location: 'Aswan',
      phone: '+20 111 562 2222',
      meal: 'Chicken Biryani'),
  Content(
      name: 'Mandi House',
      imageUrl: Assets.food5,
      description: 'Lorem ipsum mandi house food restaurant app',
      location: 'Giza',
      phone: '+20 111 562 2222',
      meal: 'Chicken Karahi'),
];
const List<Content> brands = [
  Content(name: 'Pizza Base', imageUrl: Assets.brand1),
  Content(name: 'KFC', imageUrl: Assets.brand2),
  Content(name: 'Burger King', imageUrl: Assets.brand3),
  Content(name: 'Bazooka', imageUrl: Assets.brand4),
  Content(name: 'Dakhana', imageUrl: Assets.brand5),
  Content(name: 'Sando', imageUrl: Assets.brand6),
];

const List<Content> categories = [
  Content(name: 'Deals', imageUrl: Assets.deal),
  Content(name: 'Dairy', imageUrl: Assets.food1),
  Content(name: 'Fruits & Vegetables', imageUrl: Assets.food2),
  Content(name: 'Snacks', imageUrl: Assets.food3),
  Content(name: 'Biryani', imageUrl: Assets.food4),
  Content(name: 'Chinese', imageUrl: Assets.food5),
  Content(name: 'Continental', imageUrl: Assets.food1),
];
List<MyOrders> myOrder = [
  const MyOrders(
      name: 'Bazooka',
      status: 'Ready for pickup',
      date: '29-12-2021',
      orderId: '37553480-271',
      address: '16 Salah Salem St., ALEXANDRIA',
      phone: '+20 111 562 2222',
      imageUrl: Assets.order1),
  const MyOrders(
      name: 'Biryani',
      status: 'Successful',
      date: '29-11-2022',
      orderId: '44553480-271',
      address: '17 Salah Salem St., ALEXANDRIA',
      phone: '+20 111 562 2222',
      imageUrl: Assets.order2),
  const MyOrders(
      name: 'Zinger Burger',
      status: 'Ready for pickup',
      date: '13-12-2021',
      orderId: '55553480-271',
      address: '18 Salah Salem St., ALEXANDRIA',
      phone: '+20 111 562 2222',
      imageUrl: Assets.order3),
  const MyOrders(
      name: 'Pizza Fries',
      status: 'Successful',
      date: '09-11-2021',
      orderId: '36653480-271',
      address: '19 Salah Salem St., ALEXANDRIA',
      phone: '+20 111 562 2222',
      imageUrl: Assets.order4),
  const MyOrders(
      name: 'Chicken tikka',
      status: 'Ready for pickup',
      date: '09-12-2021',
      orderId: '37557780-271',
      address: '20 Salah Salem St., ALEXANDRIA',
      phone: '+20 111 562 2222',
      imageUrl: Assets.order5),
];
