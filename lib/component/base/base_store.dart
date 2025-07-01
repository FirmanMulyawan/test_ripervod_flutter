import 'dart:collection';

import 'disposable.dart';

class BaseStore extends Disposable {
  final Queue<Disposable> _disposables = Queue();
  Queue<Disposable> get disposables => _disposables;

  void registerDispose(Function function) {
    disposables.add(
      DisposableBuilder(disposeFunction: function),
    );
  }

  @override
  Future dispose() async {
    for (var v in disposables) {
      v.dispose();
    }
    disposables.clear();
  }
}
