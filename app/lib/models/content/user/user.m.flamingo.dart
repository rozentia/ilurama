// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum UserKey {
  bio,
  following,

  customMatches,
}

extension UserKeyExtension on UserKey {
  String get value {
    switch (this) {
      case UserKey.bio:
        return 'bio';
      case UserKey.following:
        return 'following';
      case UserKey.customMatches:
        return 'customMatches';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(User doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'bio', doc.bio);
  Helper.writeNotNull(data, 'following', doc.following);

  return data;
}

/// For load data
void _$fromData(User doc, Map<String, dynamic> data) {
  doc.bio = Helper.valueFromKey<String?>(data, 'bio', defaultValue: null);
  doc.following = Helper.valueListFromKey<String>(data, 'following');
}
