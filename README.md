<div align="center">
    <div><img src="assets/icons/exported/legacy-circle.png" alt="boorusphere icon" height="92"></div>
    <div><h1 align="center">Boorusphere</h1></div>
    <div>Simple, content-focused booru viewer for Android</div>
</div>

**Fork info:**  
This is a fork of the original Boorusphere. Branding is left as-is for now, as there aren't any plans for bigger maintenance, rather just few simple bug fixes. Code changed may be suboptimal as it's my first time using flutter.

# Features

- Simple and intuitive UI
- Support various booru-based imageboards
- Support playing videos and animated images (GIF, WEBM)
- Save favorites content
- Search with tag suggestion
- Download images and videos
- Block tags from search result
- Backup and restore data
- and many more ...

# Preview

<p align="justify">
    <img width="24%" src="fastlane/metadata/android/en-US/images/phoneScreenshots/1.png" />
    <img width="24%" src="fastlane/metadata/android/en-US/images/phoneScreenshots/2.png" />
    <img width="24%" src="fastlane/metadata/android/en-US/images/phoneScreenshots/3.png" />
    <img width="24%" src="fastlane/metadata/android/en-US/images/phoneScreenshots/4.png" />
</p>

# Building from Source

- Install Flutter SDK, visit [flutter.dev](https://flutter.dev/) for more information.

`shell.nix` is provided for Nix users.

- Fetch latest source code

```bash
git clone https://github.com/nullxception/boorusphere.git
cd boorusphere
```

- Sync dependencies

```bash
flutter pub get
```

- Run code generator

```bash
dart run build_runner build --delete-conflicting-outputs
```

- Generate translation

```bash
dart run slang
```

- Run the app with your favorite IDE/PDE. or from shell:

```bash
flutter run
```

### Protip:

- Run [build_runner](https://pub.dev/packages/build_runner) after editing some areas that needs a code generator such as entities and routing.
- Run [slang](https://pub.dev/packages/slang) after editing translation files (\*.i18n.json).
- [build_runner](https://pub.dev/packages/build_runner) and [slang](https://pub.dev/packages/slang) has some features that will be helpful during development such as auto-rebuild and translation analysis, so it's highly recommended to check the documentations and familiarize yourself with it.

# Translation

### Translating untranslated strings

- Run slang analyzer to check for missing translations

```bash
dart run slang analyze --outdir=i18n
```

- Open [i18n/\_missing_translations.json](i18n/_missing_translations.json) and then translate your language of choice.

- After editing the file, you can apply it to the actual json translation file by running:

```bash
dart run slang apply --outdir=i18n

dart run slang analyze --outdir=i18n # update analyzation result files
```

### Note

You can leave untranslated strings on [i18n/\_missing_translations.json](i18n/_missing_translations.json).<br/>
It's perfectly fine and recommended to leave it unchanged rather than adding it on the actual translation json but leaving it untranslated.

### Adding a new language

You can copy [i18n/strings_en.i18n.json](i18n/strings_en.i18n.json) to `i18n/strings_<language-code>.i18n.json`.<br/>
At this point, feel free to pull request your new language here and we'll take care of adapting to the app code.

Or if you want to build and test yourself, then:

- Run slang to generate the strings.g.dart

```bash
dart run slang
```

- Run slang analyzer to check for missing translations

```bash
dart run slang analyze --outdir=i18n
```

- Build and run the app as usual
