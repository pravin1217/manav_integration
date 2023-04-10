import 'package:shared_preferences/shared_preferences.dart';

class SharedToken {
  token_save(token) async {
    final preference = await SharedPreferences.getInstance();
    const key = 'token';
    final value = token;
    preference.setString(key, value);
  }

  userId_save(userID) async {
    final preference = await SharedPreferences.getInstance();
    const key = 'userID';
    final value = userID;
    preference.setString(key, value);
  }

  saveActiveBooking(bool activeBooking) async {
    final preference = await SharedPreferences.getInstance();
    const key = 'activeBooking';
    final value = activeBooking;
    preference.setBool(key, value);
  }

  saveBookingId(String bookingId) async {
    final preference = await SharedPreferences.getInstance();
    const key = 'BookingID';
    final value = bookingId;
    preference.setString(key, value);
  }

  readBookingId() async {
    final preference = await SharedPreferences.getInstance();
    const key = 'BookingID';
    final readValue = preference.getString(key) ?? 0;

    return readValue;
  }

  userId_read() async {
    final preference = await SharedPreferences.getInstance();
    const key = 'userID';
    final readValue = preference.getString(key) ?? "";

    return readValue;
  }

  token_read() async {
    final preference = await SharedPreferences.getInstance();
    const key = 'token';
    final readValue = preference.getString(key) ?? 0;

    return readValue;
  }

  clear_token() async {
    final preference = await SharedPreferences.getInstance();
    const key = 'token';
    preference.remove(key);
    preference.clear();
  }

  save_user(user, name) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'user';
    final value = user;
    const key2 = 'name';
    final value2 = name;
    prefs.setString(key, value);
    prefs.setString(key2, value2);
    //
    //
  }
}

// token_dispose() async {
//   final preference = SharedPreferences.getInstance();
//   preference.clear();
// }
