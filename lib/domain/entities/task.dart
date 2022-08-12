class Task {
  final String _uuid;
  String _description;
  String? _photo;

  Task(this._description, this._uuid);

  String get description => _description;
  set description(value) => _description = value;

  String? get photo => _photo;
  set photo(photo) => _photo = photo;

  String get uuid => _uuid;
}
