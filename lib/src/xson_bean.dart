import 'property_rename_handler.dart';

class XsonBean {
  /// json raw source
  final String jsonContent;

  /// json file path
  final String jsonFilePath;

  /// root class name, default is file name
  final String rootClassName;

  /// all classname's suffix, default is empty
  final String classSuffix;

  /// all property's name will rename via [PropertyRenameHandler] if set
  final PropertyRenameHandler propertyRenameHandler;

  const XsonBean({
    this.jsonContent,
    this.jsonFilePath,
    this.rootClassName,
    this.classSuffix,
    this.propertyRenameHandler,
  });
}
