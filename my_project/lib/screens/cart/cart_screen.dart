import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/widgets/chart_item_widget.dart';

import 'checkout_bottom_sheet.dart';

// Helper function to add separators between widgets
List<Widget> getChildrenWithSeparator({
  required List<Widget> widgets,
  required Widget separator,
  bool addToLastChild = true,
}) {
  List<Widget> children = [];
  for (int i = 0; i < widgets.length; i++) {
    children.add(widgets[i]);
    if (i < widgets.length - 1 || addToLastChild) {
      children.add(separator);
    }
  }
  return children;
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Center(
                child: Text(
                  "My Cart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: getChildrenWithSeparator(
                  widgets: demoItems.map((e) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      width: double.infinity,
                      child: ChartItemWidget(item: e),
                    );
                  }).toList(),
                  separator: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(thickness: 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(thickness: 1),
              ),
              getCheckoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCheckoutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "Go To Check Out",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }

  Widget getButtonPriceWidget() {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Color(0xff489E67),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "\$12.96",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return CheckoutBottomSheet();
      },
    );
  }
}
