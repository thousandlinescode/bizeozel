import 'package:cloud_firestore/cloud_firestore.dart';

class Sharing {
  DocumentReference reference;
  String _publisher;
  String _shareId;
  DateTime _dateOfShare;
  String _location;
  List _participants;
  int _participantCount;
  String _activityDate;
  String _imgUrl;
  String _description;
  String _title;
  List _listOfComments;
  List _listOfLikes;
  int _likeCount;
  int _commentCount;

  Sharing(
      [this._publisher,
      this._shareId,
      this._dateOfShare,
      this._location,
      this._participants,
      this._participantCount,
      this._activityDate,
      this._imgUrl,
      this._description,
      this._title,
      this._listOfComments,
      this._listOfLikes,
      this._likeCount,
      this._commentCount]);

  Sharing.fromMap(Map<String, dynamic> parsedMap, {this.reference})
      : _shareId = parsedMap['shareId'],
        _publisher = parsedMap['publisher'],
        _dateOfShare = (parsedMap['dateOfShare'] as Timestamp).toDate(),
        _location = parsedMap['location'],
        _participants = parsedMap['participants'],
        _participantCount = parsedMap['participantCount'],
        _activityDate = parsedMap['activityDate'],
        _imgUrl = parsedMap['imgUrl'],
        _description = parsedMap['description'],
        _title = parsedMap['title'],
        _listOfComments = parsedMap['listOfComments'],
        _listOfLikes = parsedMap['listOfLikes'],
        _likeCount = parsedMap['likecount'],
        _commentCount = parsedMap['commentCount'];

  Map<String, dynamic> toMap() {
    return {
      'shareId': _shareId,
      'publisher': _publisher,
      'dateOfShare': _dateOfShare,
      'location': _location,
      'participants': _participants,
      'participantCount': _participantCount,
      'activityDate': _activityDate,
      'imgUrl': _imgUrl,
      'description': _description,
      'title': _title,
      'listOfcomments': _listOfComments,
      'listOfLikes': _listOfLikes,
      'likecount': _likeCount,
      'commentCount': _commentCount,
    };
  }

  Sharing.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data(), reference: snapshot.reference);

  String get title => _title;
  String get description => _description;
  String get imgUrl => _imgUrl;
  String get publisher => _publisher;
  String get activityDate => _activityDate;
  String get location => _location;
  DateTime get dateOfShare => _dateOfShare;
  List get listOfLikes => _listOfLikes;
  List get listOfComments => _listOfComments;
  int get likeCount => _likeCount;
  List get participants => _participants;
  int get participantCount => _participantCount;
  int get commentCount => _commentCount;
}
