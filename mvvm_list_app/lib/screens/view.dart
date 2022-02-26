import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../app/dependencies.dart';
import 'viewmodel.dart';

//----------------------------------------------------------------------------
// Default View is with Consumer and ChangeNotifierProvier
//----------------------------------------------------------------------------

typedef ViewmodelWidgetBuilder<V> = Widget Function(BuildContext, V, Widget);
typedef ViewmodelSelector<V, S> = S Function(BuildContext, V);
typedef ViewmodelSelectorWidgetBuilder<V, S> = Widget Function(
    BuildContext, V, S, Widget);
typedef AsyncViewmodelCallback<V> = Future<void> Function(V);

abstract class _AbstractView<V extends Viewmodel> extends StatelessWidget {
  final ViewmodelWidgetBuilder<V> _progressBuilder;
  final ViewmodelWidgetBuilder<V> _builder;
  final Widget _child;
  final bool _shouldRebuild;

  _AbstractView(
      {bool shouldRebuild = true,
      ViewmodelWidgetBuilder<V> progressBuilder,
      ViewmodelWidgetBuilder<V> builder,
      Widget child})
      : _shouldRebuild = shouldRebuild,
        _progressBuilder = progressBuilder,
        _builder = builder,
        _child = child;

  V _setupViewmodel() {
    final viewmodel = dependency<V>();
    viewmodel.initialize();
    return viewmodel;
  }

  Widget _buildChild(BuildContext context, V viewmodel, Widget child) {
    if (!_shouldRebuild) {
      if ((viewmodel != null) && viewmodel.busy) {
        viewmodel.turnIdle();
      }
    }

    if (viewmodel.busy) {
      if (_progressBuilder != null)
        return _progressBuilder(context, viewmodel, null);

      return Center(
        child: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    if (_builder == null) return null;

    return _builder(context, viewmodel, child);
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = _setupViewmodel();

    return ChangeNotifierProvider.value(
      value: viewmodel,
      child: _buildChild(context, viewmodel, _child),
    );
  }
}

class View<V extends Viewmodel> extends _AbstractView<V> {
  View(
      {bool shouldRebuild = true,
      @required ViewmodelWidgetBuilder<V> builder,
      ViewmodelWidgetBuilder<V> progressBuilder,
      Widget child})
      : super(
            shouldRebuild: shouldRebuild,
            // initViewmodel: initViewmodel,
            builder: (context, viewmodel, child) => shouldRebuild
                ? Consumer<V>(builder: builder)
                : builder(context, viewmodel, child),
            child: child,
            progressBuilder: progressBuilder);
}

class SelectorView<V extends Viewmodel, S> extends _AbstractView<V> {
  SelectorView(
      {bool shouldRebuild = true,
      @required ViewmodelSelectorWidgetBuilder<V, S> builder,
      @required ViewmodelSelector<V, S> selector,
      ViewmodelWidgetBuilder<V> progressBuilder,
      Widget child})
      : super(
            shouldRebuild: shouldRebuild,
            // initViewmodel: initViewmodel,
            builder: (context, viewmodel, child) => shouldRebuild
                ? Selector<V, Tuple2<V, S>>(
                    selector: (context, viewmodel) =>
                        Tuple2(viewmodel, selector(context, viewmodel)),
                    builder: (context, data, child) =>
                        builder(context, data.item1, data.item2, child),
                  )
                : builder(context, null, null, child),
            child: child,
            progressBuilder: progressBuilder);
}
