import 'package:flutter/material.dart';

import '../presentation/screens/login_screen.dart';
import '../presentation/screens/reset_password_screen.dart';
import '../presentation/screens/customers/customer_detail_screen.dart';
import '../presentation/screens/customers/customer_list_screen.dart';
import '../presentation/screens/customers/customer_map_screen.dart';
import '../presentation/screens/dashboard/dashboard_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/inventory/product_detail_screen.dart';
import '../presentation/screens/notification_screen.dart';
import '../presentation/screens/sales/add_sale_screen.dart';
import '../presentation/screens/sales/order_confirmation_screen.dart';
import '../presentation/screens/sales/order_summary_screen.dart';
import '../presentation/screens/sales/product_selection_screen.dart';
import '../presentation/screens/sales/quantity_and_pricing_screen.dart';
import '../presentation/screens/sales/sales_order_creation_screen.dart';
import '../presentation/screens/sales/sales_report_screen.dart';
import '../presentation/screens/sales/sales_screen.dart';
import '../presentation/screens/sales/sync_sales_screen.dart';

import 'package:l_mobilesales_mini/data/models/customer_model.dart';
import '../data/models/product_model.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => HomeScreen(),
    '/login': (context) => LoginScreen(),
    '/resetPassword': (context) => ResetPasswordScreen(),
    '/notifications': (context) => NotificationScreen(),
    '/dashboard': (context) => DashboardScreen(),

    // Customer routes
    '/customers': (context) => CustomerListScreen(),
    '/customerDetail': (context) {
      final customer = ModalRoute.of(context)!.settings.arguments as CustomerModel;
      return CustomerDetailScreen(customer: customer);
    },
    '/customerMap': (context) => CustomerMapScreen(),

    // Inventory
    '/productDetail': (context) {
      final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
      return ProductDetailScreen(product: product);
    },

    // Sales
    '/sales': (context) => SalesScreen(),
    '/addSale': (context) => AddSaleScreen(),
    '/orderConfirmation': (context) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      return OrderConfirmationScreen(orderData: args['orderData']);
    },
    '/orderSummary': (context) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      return OrderSummaryScreen(
    	lineItems: args['lineItems'],
    	subtotal: args['subtotal'],
    	tax: args['tax'],
	discount: args['discount'] ?? 0.0,
	total: args['total'],
     );
    },
    '/productSelection': (context) => ProductSelectionScreen(),
    '/quantityPricing': (context) => QuantityAndPricingScreen(),
    '/createOrder': (context) => SalesOrderCreationScreen(),
    '/salesReport': (context) => SalesReportScreen(),
    '/syncSales': (context) => SyncSalesScreen(),
  };
}
