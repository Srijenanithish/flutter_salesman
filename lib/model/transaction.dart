import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  late String api_key;

  @HiveField(1)
  late String api_secret;

  @HiveField(2)
  late String Username;

  @HiveField(3)
  late String Password;
}
