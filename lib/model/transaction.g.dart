// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 0;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction()
      ..api_key = fields[0] as String
      ..api_secret = fields[1] as String
      ..Username = fields[2] as String
      ..Password = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.api_key)
      ..writeByte(1)
      ..write(obj.api_secret)
      ..writeByte(2)
      ..write(obj.Username)
      ..writeByte(3)
      ..write(obj.Password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
