class Movie {
 final String _name, _link, _about;
  final double _rating;
  Movie(
    this._name,
    this._link,
    this._about,
    this._rating,
  );
  get name => _name;
  get link => _link;
  get about => _about;
  get rating => _rating;
}