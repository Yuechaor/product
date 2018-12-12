import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_flutter/pages/product_detail.dart';
import 'package:learning_flutter/pages/product_editing.dart';
import 'package:learning_flutter/pages/product_list.dart';
import 'package:learning_flutter/pages/auth.dart';
import 'package:learning_flutter/models/product.dart';
import 'package:learning_flutter/scoped_models/products.dart';
import 'package:scoped_model/scoped_model.dart';

// import 'package:flutter/rendering.dart';

void main() {
//debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductModel>(
      model: ProductModel(),
      child: MaterialApp(
        // debugShowMaterialGrid: true,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          //fontFamily: 'rmit'
        ),
        home: AuthPage(),
        routes: {
          '/list': (_) => ProductList(), // '/' 和 home 二选一， 不能同时定义
          '/admin': (_) => ProductEditing(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);

            return MaterialPageRoute<bool>(builder: (BuildContext context) {
              return ProductDetailPage(null, null, null, null);
            });
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          //if registered routes -> ongenerateRoute -> onuNknonwRoute 更像是默认的route
          return MaterialPageRoute(builder: (_) => ProductList());
        },
      ),
    );
  }
}
