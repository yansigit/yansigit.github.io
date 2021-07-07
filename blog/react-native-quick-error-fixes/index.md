# React Native Quick Error Fixes


## iOS 향 빌드 시 체크사항

- Xcode - 속성 - 컴포넌트에 iOS 시뮬레이터 깔려있는지 확인 (가상머신 이용 시)
- Location 에서 Command Line Tools가 제대로 지정되어 있는지 확인
    - 없을 시 Command Line Tools 설치 후 설정
<!--more-->
## Android 5554 Offline 문제

안드로이드 가상머신 실행을 Hot reload 말고 Cold booting을 한다 (공장 초기값으로 실행)

## Android 빌드 시 gradle 오류가 날 경우

- android 폴더의 gradlew 실행파일에 실행 권한이 있는지 확인해보자

## iOS 빌드 시 오류 날 경우

- ios 폴더에서 `pod install` 한번 실행해주자
- 아니면 ios 폴더에서 `rm -rf build/` 를 실행시켜 줘보자

## Android에서 아이콘 제대로 표시 안될 때

- [https://github.com/oblador/react-native-vector-icons#android](https://github.com/oblador/react-native-vector-icons#android)
- `/android/app/build.gradle` 맨 끝에 `apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"` 추가

## React-native-image-picker 사용 시 카메라 안될 때

- `Couldn't get file path for photo`이런 오류를 일으키며 카메라가 안켜진다
- 그럴때는
- `android:requestLegacyExternalStorage="true"`
- 위 태그를 AndroidManifest.xml의 Applicaiton 태그에 속성으로 삽입
- API 28 부터인가 사용 가능한 태그라고 해도 무시하고 그냥 삽입

## attempt to invoke virtual method android.graphics.drawable.drawable react native

- react-natvie start —reset-cache로 캐시 정리
- 안드로이드 앱 삭제 후 react-natve run-android

