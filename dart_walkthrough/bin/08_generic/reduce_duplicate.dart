class Addition<T> {
  T first;
  T second;

  Addition(T f, T s){
    first=f;
    second=s;
  }

  T get add => (first as dynamic) + (second as dynamic);
}

void main() {
  var i=Addition<int>(1,2);
  var s=Addition<String>('Hello', 'World');

  print (i.add);
  print (s.add);
}
