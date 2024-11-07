import 'package:ecore/core/utils/abstract_utils.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';


class Utils extends AbstractUtils {
  //String

  @override
  bool isNullOrEmpty(Object? obj) {
    if(obj == null || obj.toString().isEmpty) {
      return true;
    }
    else {
      return false;
    }
  }

  @override
  String strValue(Object obj) {
    if(isNullOrEmpty(obj)) {
      return '';
    }
    else {
      return strTrim(obj);
    }
  }

  @override
  String? strValueOrNull(Object obj) {
    if(isNullOrEmpty(obj)) {
      return null;
    }
    else {
      return strValue(obj);
    }
  }

  @override
  String strTrim(Object obj) {
    return obj.toString().trim();
  }

  @override
  String strTrimStart(Object obj) {
    return obj.toString().trimLeft();
  }

  @override
  String strTrimEnd(Object obj) {
    return obj.toString().trimRight();
  }

  @override
  String strRemove(Object source, Object obj) {
    return source.toString().replaceAll(obj.toString(), '');
  }

  @override
  String strRemoveCount(Object source, Object obj, int iCount) {
    return source.toString().substring(0, iCount)
        + source.toString().substring(iCount).replaceAll(obj.toString(), '');
  }

  @override
  String strReplace(Object source, Object oldChar, Object newChar) {
    return source.toString().replaceAll(oldChar.toString(), newChar.toString());
  }

  @override
  String strCaptionSubstring(Object source, int iLength) {
    return source.toString().substring(0, iLength);
  }

  @override
  String strSubstring(Object source, int iStartIndex) {
    return source.toString().substring(iStartIndex);
  }

  @override
  String strSubstringByLength(Object source, int iStartIndex, int iLength) {
    return source.toString().substring(iStartIndex, iStartIndex + iLength);
  }

  @override
  List<String> arrSplit(Object source, String separator) {
    return source.toString().split(separator);
  }

  @override
  String strToLower(Object source) {
    return source.toString().toLowerCase();
  }

  @override
  String strToUpper(Object source) {
    return source.toString().toUpperCase();
  }


  // Email

  // Number

  // DateTime
  @override
  String strDateTime(Object source) {
    if(source.runtimeType == String) {
      return DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.parse(source.toString()));
    }
    else if(source.runtimeType == DateTime) {
      return DateFormat('yyyy-MM-dd hh:mm:ss').format(source as DateTime);
    }
    else {
      return DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
    }
  }
}