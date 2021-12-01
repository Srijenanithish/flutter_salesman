final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, api_key, api_secret, username, password, time,
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String api_key = 'api_key';
  static final String api_secret = 'api_secret';
  static final String username = 'username';
  static final String password = 'password';
  static final String time = 'time';
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String api_key;
  final String api_secret;
  final String username;
  final String password;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.api_key,
    required this.api_secret,
    required this.username,
    required this.password,
    required this.createdTime,
  });

  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? api_key,
    String? api_secret,
    String? username,
    String? password,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        api_key: api_key ?? this.api_key,
        api_secret: api_secret ?? this.api_secret,
        username: username ?? this.username,
        password: password ?? this.password,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImportant] == 1,
        number: json[NoteFields.number] as int,
        api_key: json[NoteFields.api_key] as String,
        api_secret: json[NoteFields.api_secret] as String,
        username: json[NoteFields.username] as String,
        password: json[NoteFields.password] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.api_key: api_key,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.api_secret: api_secret,
        NoteFields.username: username,
        NoteFields.password: password,
        NoteFields.time: createdTime.toIso8601String(),
      };
}
