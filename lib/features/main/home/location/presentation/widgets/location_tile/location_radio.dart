import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/location/presentation/manager/location_logic.dart';

class LocationRadio extends StatelessWidget {
  const LocationRadio({
    super.key,
    required this.index,
    required this.isDefault,
    required this.defaultAddress,
  });

  final int index;
  final bool isDefault;

  final Function() defaultAddress;

  @override
  Widget build(BuildContext context) {
    final LocationLogic locationLogic = Get.find();

    return Obx(() {
      locationLogic.setDefaultLoading;
      return Radio(
        activeColor: primary500,
        visualDensity: VisualDensity.compact,
        value: '$index',
        groupValue: isDefault ? '$index' : locationLogic.groupValue,
        onChanged: (value) async {
          await showAppAlert(
            context,
            title: 'Default Location',
            content:
                'Make this location as a default delivery location for orders?',
            onTap: defaultAddress,
            onCancel: () {
              if (locationLogic.setDefaultLoading) {
                () {};
              } else {
                Navigator.of(context).pop();
              }
            },
          );
        },
      );
    });
  }
}
// showSearch(context: context, delegate: MySearchDelegate());
// class MySearchDelegate extends SearchDelegate<String> {
//   final List<String> searchItems = [
//     'تفاحة',
//     'موز',
//     'برتقال',
//     'عنب',
//     'فراولة',
//   ];
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestions = query.isEmpty
//         ? searchItems
//         : searchItems.where((item) => item.contains(query)).toList();
//
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final suggestion = suggestions[index];
//         return ListTile(
//           title: Text(suggestion),
//           onTap: () {
//             query = suggestion;
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     final results = searchItems.where((item) => item.contains(query)).toList();
//
//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         final result = results[index];
//         return ListTile(
//           title: Text(result),
//           onTap: () {
//             // إرجاع النتيجة المختارة وإغلاق واجهة البحث
//             close(context, result);
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () => close(context, ''),
//     );
//   }
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//           showSuggestions(context);
//         },
//       ),
//     ];
//   }
// }

//  final RenderBox button = context.findRenderObject() as RenderBox;
//           final Offset position = button.localToGlobal(Offset.zero);
//           final RelativeRect rect = RelativeRect.fromLTRB(
//             position.dx,
//             position.dy,
//             position.dx + button.size.width,
//             position.dy + button.size.height,
//           );
//
//           // عرض القائمة
//           final selected = await showMenu<int>(
//             context: context,
//             position: rect,
//             items: [
//               PopupMenuItem<int>(
//                 value: 1,
//                 child: Text('الخيار الأول'),
//               ),
//               PopupMenuItem<int>(
//                 value: 2,
//                 child: Text('الخيار الثاني'),
//               ),
//               PopupMenuItem<int>(
//                 value: 3,
//                 child: Text('الخيار الثالث'),
//               ),
//             ],
//           );
