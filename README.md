# app_dev_flutter

A small Flutter app that displays a “Hello, world!” screen.

## Install Flutter

1. Follow the [official Flutter installation guide](https://docs.flutter.dev/install) for your operating system. Flutter includes the Dart SDK.
2. On Windows, extract the Flutter SDK to a folder such as `C:\src\flutter`, add `C:\src\flutter\bin` to your `PATH`, and reopen your terminal.
3. Check your setup:

   ```powershell
   flutter --version
   flutter doctor -v
   ```

   Install any tools reported as missing by `flutter doctor`. To run the Windows desktop version, install Visual Studio with the **Desktop development with C++** workload.

> **Round 3 note:** Running in Chrome does **not** require Android Studio or Visual Studio. If `flutter doctor` shows ❌ for "Android toolchain" or ⚠️ for "Visual Studio", you can ignore them as long as **Chrome** has a ✅.

## Set up and run this project

Open a terminal in the project folder and run:

```powershell
flutter pub get
flutter devices
```

Choose Windows or Edge from the devices shown by `flutter devices`:

```powershell
flutter run -d windows
flutter run -d edge
```

> **Round 3 note:** We recommend **`flutter run -d chrome`**. `-d windows` only works if Visual Studio's C++ components are installed. While the app is running, press `r` for hot reload or `R` for hot restart (needed after changing `const` lists).

Run the widget tests with:

```powershell
flutter test
```

## Round 2 – New Features

The app now has a bottom navigation bar with three tabs:

| Tab | File | What it does |
|-----|------|--------------|
| BMI | `lib/bmi_tab.dart` | Enter height (ft/in) and weight (lbs). Calculates BMI and shows the category: Underweight (<18.5), Normal (18.5–24.9), Overweight (25–29.9), Obese (30+). |
| Morse | `lib/morse_tab.dart` | Converts text to Morse code as you type. Letters are separated by spaces, words by ` / `. Unsupported characters show as `?`. |
| Alcohol | `lib/alcohol_tab.dart` | Pick a date of birth and a jurisdiction. Shows the date you reach the legal purchasing age and how many days are left. |

### Tested with
- Flutter 3.50.0 (stable) / Dart 3.14.0
- Windows 11, running in Chrome (`flutter run -d chrome`)

### Project Structure
```
lib/
├── main.dart          # App entry + bottom tab navigation
├── bmi_tab.dart       # BMI Calculator
├── morse_tab.dart     # Morse Code Translator
└── alcohol_tab.dart   # When Can I Buy Alcohol?
test/
└── widget_test.dart   # Checks that the three tabs load
```

### Notes
- This project has no `android/` or `ios/` folder. To run it on a phone, run `flutter create --platforms=android .` first.
- If `flutter` isn't recognized after installing, make sure `C:\src\flutter\bin` is in your PATH, then restart your terminal or VS Code.

---

## Round 3 – Review and Quiz Tab


**Cleanup:**
- Removed `lib/ReadMe.mb`, a stray file containing only the text "How to install flutter".
- Added notes above about using Chrome and ignoring the Android and Visual Studio warnings in `flutter doctor`.
- Changed the tab body in `main.dart` from `_pages[_selectedIndex]` to an `IndexedStack`, so each tab **keeps its data** when you switch away and come back. Before, switching tabs cleared the BMI inputs and would have reset quiz progress.

### New feature: Quiz tab

| Tab | File | What it does |
|-----|------|--------------|
| Quiz | `lib/quiz_tab.dart` | A 5-question multiple-choice "Zombie Survival" quiz with swiping, Previous/Next navigation, live score tracking and a results popup. |

**How it works:**
- **Multiple choice:** each question has 4 options. Tap one to answer, and the answer locks. The correct option turns **green**, and a wrong pick turns **red**.
- **Question navigation:** the **Previous** and **Next** buttons move between questions. They grey out on the first and last question.
- **Swipe:** drag left or right to change questions (a `PageView`). Mouse dragging is enabled so swiping also works in Chrome.
- **Score tracking:** the live score shows at the top ("Score: X"), next to "Question X of 5".
- **Results:** **See Results** unlocks once all 5 questions are answered and shows the final score with a rating message. **Review Answers** closes the popup so you can look back through the questions, and **Try Again** resets the quiz.

**Files added or changed:**
```
lib/
├── main.dart          # Added the 4th "Quiz" tab and switched to IndexedStack
├── question.dart      # NEW – Question model (text, options, correctIndex)
└── quiz_tab.dart      # NEW – Quiz tab (questions list, PageView, scoring, results)
```

**To change the questions:** edit the `questions` list at the top of `lib/quiz_tab.dart`. `correctIndex` is the position of the right answer in `options`, starting at 0.

### Tested with
- Flutter 3.50.0 (stable) / Dart 3.14.0
- Windows 11, Chrome (`flutter run -d chrome`)
- `flutter test` passes