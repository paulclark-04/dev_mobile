import 'package:flutter/widgets.dart';
import 'package:formation_flutter/model/product.dart';

/// InheritedWidget that provides Product data to descendants.
class ProductInheritedWidget extends InheritedWidget {
  final Product data;

  const ProductInheritedWidget({
    super.key,
    required this.data,
    required super.child,
  });

  /// Access the ProductInheritedWidget from the widget tree.
  static ProductInheritedWidget of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<ProductInheritedWidget>();
    assert(widget != null, 'No ProductInheritedWidget found in context');
    return widget!;
  }

  @override
  bool updateShouldNotify(ProductInheritedWidget oldWidget) {
    return data != oldWidget.data;
  }
}
