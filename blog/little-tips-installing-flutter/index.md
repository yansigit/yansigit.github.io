# Little Tips Installing Flutter

Notes for dealing with problems while installing flutter
<!--more-->
## [Flutter.io](http://flutter.io/) Android License Status Unknown

You need to use JDK8 for flutter, so if you have a JDK version upon 8, you need to install JDK8.

## Flutter App stuck at “Running Gradle task 'assembleDebug'… ”

1. remove `$HOME$/.gradle`
2. clean gradle `./gradlew clean`
3. Build gradle `./gradlew build`

## Installing flutter on MAC using asdf package manager

```bash
brew install asdf --HEAD
brew install android-sdk
brew install android-studio
brew install haxm
brew cask install adoptopenjdk8
brew tap dart-lang/dart
brew install dart
asdf plugin add flutter
asdf install flutter latest
```

```bash
# add to ~/.zshrc file
. $(brew --prefix asdf)/asdf.sh
```

