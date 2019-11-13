part 'dart_keywords.dart';

typedef String PropertyRenameHandler(String uniqueKey, String propertyName);

class PropertyRenameHandlers {
  /// <pre>
  /// Ignore all special word, it mean only keep "a-z", "A-Z", "0-9", "$" and "_" in string, and all special word will replace
  /// to "_".
  static PropertyRenameHandler ignoresSpecialWord = (key, name) => name?.replaceAll(RegExp("[^a-zA-Z0-9\$_]"), "_");

  /// <pre>
  /// Prefix "$" if the name is dart keyword.
  /// ex:
  ///   "new" -> "$new"
  ///   "class" -> "$class"
  static PropertyRenameHandler prefixKeyword = (key, name) {
    return name == null ? null : _DART_KEYWORDS.contains(name) ? "\$$name" : name;
  };

  /// <pre>
  /// Prefix "$" if the name starts with a number.
  /// ex:
  ///   "0" -> "$0"
  ///   "1score" -> "$1score"
  static PropertyRenameHandler prefixNumber =
      (key, name) => name == null ? null : name.startsWith(RegExp("\\d")) ? "\$$name" : name;

  /// <pre>
  /// Default handler, includes [ignoresSpecialWord], [prefixKeyword] and [prefixNumber].
  static PropertyRenameHandler defaultHandler = concat([ignoresSpecialWord, prefixKeyword, prefixNumber]);

  static PropertyRenameHandler concat(List<PropertyRenameHandler> handlers) {
    return (key, name) => handlers.fold<String>(name, (name, handler) => handler(key, name));
  }
}
