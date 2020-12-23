import 'package:strooper/utils/load_images.dart';

enum GameImages {
  /// ******** UPDATE [LoadImages] MAP ENTRIES IF NEW IMAGE ADDED ********
  // ******** REINSTALL THE APP IF SEQUENCE OF THE ENUM'S ARE CHANGED ********

  /// Changing the sequence while restating the app may cause the crash because
  /// images are stored in memory with the reference of the enum's index value
  /// and when sequence is changed, images will not match as per their type. So
  /// app reinstall will be required to reload images in the memory with their
  /// updated index reference.

  // --- Home screen ---
  CLOUDS,
  START_BUTTON,
  APP_TITLE,
  SOUND_ON,
  SOUND_OFF,
  INSTRUCTION,

  // --- Play screen ---
  ANSWER_RIGHT,
  ANSWER_WRONG,

  // --- Game over screen ---
  GAME_OVER,
  RESTART_GAME,
  GOTO_HOME,
  BACK
}
