import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

abstract class AbstractUtils {
  //String

  bool isNullOrEmpty(Object obj); // Check giá trị null hay không

  String strValue(Object obj); // Format object thành giá trị chuỗi

  String? strValueOrNull(Object obj); // Format object thành giá trị chuỗi hoặc null

  String strTrim(Object obj); // Trả về chuỗi không còn khoẳng trắng ở đầu và cuối

  String strTrimStart(Object obj); // Trả về chuỗi không còn khoẳng trắng ở đầu

  String strTrimEnd(Object obj); // Trả về chuỗi không còn khoẳng trắng ở cuối

  String strRemove(Object source, Object obj); // Trả về chuỗi đã remove theo dữ liệu đầu vào

  String strRemoveCount(Object source, Object obj, int iCount); // Trả về chuỗi đã remove theo vị trí bắt đầu

  String strReplace(Object source, Object oldChar, Object newChar); // Trả về chuỗi đã được thay thế

  String strCaptionSubstring(Object source, int iLength); // Trả về chuỗi theo số lượng đã chỉ định

  String strSubstring(Object source, int iStartIndex); // Trả về chuỗi được cắt bỏ tại vị trí chỉ định

  String strSubstringByLength(Object source, int iStartIndex, int iLength); // Trả về chuỗi được cắt bỏ tại vị trí chỉ định và lấy số lượng phần tử chỉ định

  List<String> arrSplit(Object source, String separator); // Trả về mảng

  String strToLower(Object source); // Trả về chuỗi là chữ thường

  String strToUpper(Object source); // Trả về chuỗi là chữ hoa

  // Email

  // Number

  // DateTime
  String strDateTime(Object source);
}