// ignore_for_file: avoid_print

import 'dart:async';

void main() {
  //baseExample();

  //nullSafetyExample();
  // oopExample();
  //collectionsExample();

  // recordsExample();

  //streamExample();

  //asyncExample();

  //asyncExercise();

  //runApp(const FuturePage());
  //runApp(const StreamPage());

  generatorsExample();
}

const count = 5;
void baseExample() {
  print('count = $count');

  var countVar = 5.2;
  countVar++;
  print('countVar = ${countVar.runtimeType}');
  print('countVar = $countVar');

  List<int> list = [];
  list = [1];
  //list.add(1);
  print(list);
}

class User {
  int? age;
  String? name;

  User({this.age, this.name});
}

void nullSafetyExample() {
  int? count;

  int num2 = count ?? 0;
  print(num2);

  User? user;

  user?.age = 5;

  if (user != null) {
    user.age = 5;
  }

  User? user1;

  user
    ?..age = 5
    ..name = '';

  late final int count1;

  // print(count1);

  Never valueIsNotDefined() {
    throw ArgumentError('Value is not defined');
  }

  int method(int? value) {
    if (value == null) {
      return valueIsNotDefined();
    }
    return value;
  }

  method(null);
}

interface class Person {
  final String name;
  final int age;
  final bool sex;

  Person({required this.name, required this.age, required this.sex});
}

class Student extends Person {
  Student(
      {required super.name,
      required super.age,
      required super.sex,
      required this.avgScore});
  final int avgScore;
}

class Man implements Person {
  @override
  final String name;
  @override
  final int age;

  Man({required this.name, required this.age});

  @override
  bool get sex => true;
}

extension ManExtension on Man {
  bool get isOld {
    if (age > 65) {
      return true;
    } else {
      return false;
    }
  }
}

void oopExample() {
  Person p = Student(name: 'Name', age: 20, sex: true, avgScore: 5);

  Man man = Man(name: 'Test', age: 60);

  print(man.isOld);
}

void collectionsExample() {
  final list = <String>['Item1', 'Item2', 'Item3'];
  final list1 = List<String>.empty(growable: true);
  list1.add('Item1');
  print(list1);

  final map = {
    'key1': 'value1',
  };
  print(map['key1']);
}

void recordsExample() {
  var item = ("Name", 30);
  print(item.$1);

  (String, int, int) item2 = (
    'Name2',
    3,
    3,
  );
  print(item2);

  ({String name, int age}) item3 = (name: 'Name3', age: 5);
  print(item3);
}

void asyncExample() {
  /*final result = await Future<String>(() async {
    return 'String';
  });

  print(result);*/
/*
  print('start main');
  Future(() => print(1));
  Future.microtask(() => print(2));
  print('end main');*/
  /* asyncExercise();*/
  calc();
  print('end sync');
}

void asyncExercise() {
  print('start main');
  Future(() => print('future1')).then((value) {
    print('then1');
    Future(() => print('nested future'));
  });

  Future.sync(() => print('future sync')).then((value) => print('then sync'));
  Future(() => print('future 2')).then((value) => print('then 2'));
  print('end main');
}

Future<void> calc() async {
  print('calc');

  Future.delayed(const Duration());
}

void streamExample() async {
  var controller = StreamController<String>();

  final subscription = controller.stream.listen((event) {
    print(event);
  });

  await Future.delayed(const Duration(seconds: 1));
  controller.add('String1');
  await Future.delayed(const Duration(seconds: 1));
  controller.add('String2');
  await Future.delayed(const Duration(seconds: 1));

  subscription.cancel();
}

//генераторы
void generatorsExample() async {
  //print(naturalsTo(5).take(10));

  asynchronousNaturalsTo(5).listen((event) {
    print(event);
  });
}

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) {
    print('yield = $k');
    //yield k++;
    yield* naturalsTo(n - 1);
  }
}

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) {
    await Future.delayed(const Duration(seconds: 1));
    yield k++;
  }
}
