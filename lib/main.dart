import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// Import the generated firebase options
import 'firebase_options.dart';

// Controllers
import 'presentation/controllers/auth_controller.dart';
import 'presentation/controllers/dashboard_controller.dart';
import 'presentation/controllers/customer_controller.dart'; // <-- Added this import

// Auth & General Screens
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/reset_password_screen.dart';

// Customers
import 'data/models/customer_model.dart';
import 'presentation/screens/customers/customer_detail_screen.dart';
import 'presentation/screens/customers/customer_list_screen.dart'; // ✅  for /customer-lookup

// Sales
import 'presentation/screens/sales/add_sale_screen.dart'; // ✅  for /new-sale
import 'presentation/screens/sales/order_summary_screen.dart';
import 'presentation/screens/sales/order_confirmation_screen.dart';
import 'presentation/screens/sales/quantity_and_pricing_screen.dart';
import 'presentation/screens/sales/product_selection_screen.dart';
import 'presentation/screens/sales/sales_order_creation_screen.dart';
import 'presentation/screens/sales/sales_report_screen.dart';
import 'presentation/screens/sales/sales_screen.dart';
import 'presentation/screens/sales/sync_sales_screen.dart';

// Inventory
import 'data/models/product_model.dart';
import 'presentation/screens/inventory/item_add_screen.dart';
import 'presentation/screens/inventory/product_detail_screen.dart';
import 'presentation/screens/inventory/inventory_screen.dart'; // ✅  Restored this import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // <--- Pass options here
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
        ChangeNotifierProvider(create: (_) => CustomerController()), // <-- Added this provider
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mobile Sales Mini',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/reset-password': (context) => ResetPasswordScreen(),
          '/quantity-pricing': (context) => QuantityAndPricingScreen(),
          '/product-selection': (context) => ProductSelectionScreen(),
          '/sales-order-creation': (context) => SalesOrderCreationScreen(),
          '/add-sale': (context) => AddSaleScreen(),
          '/sales-report': (context) => SalesReportScreen(),
          '/sales': (context) => SalesScreen(),
          '/sync-sales': (context) => SyncSalesScreen(),
          '/item-add': (context) => ItemAddScreen(),

          // ✅  Quick Action Routes
          '/customer-lookup': (context) => CustomerListScreen(),
          '/new-sale': (context) => AddSaleScreen(),
          '/inventory': (context) => InventoryScreen(), // ✅  Restored this route
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/customer-detail':
              final customer = settings.arguments;
              if (customer is CustomerModel) {
                return MaterialPageRoute(
                  builder: (context) => CustomerDetailScreen(customer: customer),
                );
              }
              return _errorRoute('CustomerModel parameter missing');

            case '/order-summary':
              final args = settings.arguments;
              if (args is Map<String, dynamic> &&
                  args.containsKey('lineItems') &&
                  args.containsKey('subtotal') &&
                  args.containsKey('tax') &&
                  args.containsKey('discount') &&
                  args.containsKey('total')) {
                return MaterialPageRoute(
                  builder: (context) => OrderSummaryScreen(
                    lineItems: args['lineItems'],
                    subtotal: args['subtotal'],
                    tax: args['tax'],
                    discount: args['discount'],
                    total: args['total'],
                  ),
                );
              }
              return _errorRoute('Missing one or more required parameters: lineItems, subtotal, tax, discount, total');

            case '/order-confirmation':
              final orderData = settings.arguments;
              if (orderData is Map<String, dynamic>) {
                return MaterialPageRoute(
                  builder: (context) => OrderConfirmationScreen(orderData: orderData),
                );
              }
              return _errorRoute('orderData map missing');

            case '/product-detail':
              final product = settings.arguments;
              if (product is ProductModel) {
                return MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                );
              }
              return _errorRoute('ProductModel parameter missing');

            default:
              return null;
          }
        },
      ),
    );
  }

  MaterialPageRoute _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Navigation Error')),
        body: Center(child: Text(message)),
      ),
    );
  }
}

