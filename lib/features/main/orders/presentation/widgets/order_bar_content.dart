import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_bar_view.dart';

class OrderBarContent extends StatelessWidget {
  const OrderBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: <Widget>[
        OrderBarView(status: ''),
        OrderBarView(status: 'pending'),
        OrderBarView(status: 'paid'),
        OrderBarView(status: 'delivered'),
        OrderBarView(status: 'cancelled'),
      ],
    );
  }
}
