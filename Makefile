FVM := $(shell which fvm)
FLUTTER := $(FVM) flutter

.PHONY: setup
setup:
	dart pub global activate fvm
	fvm install
	npm i -g git-cz
	npm i -g commitizen

.PHONY: get-dependencies
get-dependencies:
	$(FLUTTER) pub get

.PHONY: clean
clean:
	$(FLUTTER) clean

.PHONY: analyze
analyze:
	$(FLUTTER) analyze

.PHONY: format
format:
	$(FLUTTER) format lib/

.PHONY: format-dry-exit-if-changed
format-dry-exit-if-changed:
	$(FLUTTER) format --dry-run --set-exit-if-changed lib/

.PHONY: build-runner
build-runner:
	$(FLUTTER) packages pub run build_runner build --delete-conflicting-outputs

.PHONY: test
test:
	make analyze
	$(FLUTTER) test

.PHONY: flutter-native-splash
flutter-native-splash:
	$(FLUTTER) pub run flutter_native_splash:create

.PHONY: flutter-launcher-icons
flutter-launcher-icons:
	$(FLUTTER) pub run flutter_launcher_icons:main

.PHONY: analytics-android-enable
analytics-android-enable:
	adb shell setprop debug.firebase.analytics.app jp.tctc.itpassport.dev

.PHONY: analytics-android-disable
analytics-android-disable:
	adb shell setprop debug.firebase.analytics.app .none.

### Android Relase Commands

.PHONY: build-android-dev
build-android-dev:
	$(FLUTTER) build appbundle \
		--release \
		--build-number $(BUILD) \
		--dart-define=FLAVOR=dev \
		--flavor dev

.PHONY: build-android-prod
build-android-prod:
	$(FLUTTER) build appbundle \
		--release \
		--build-number $(BUILD) \
		--dart-define=FLAVOR=prod \
		--flavor prod

### iOS Relase Commands

.PHONY: build-ios-dev
build-ios-dev:
	$(FLUTTER) build ipa \
		--export-options-plist=ios/ExportOptions_dev.plist \
		--release \
		--build-number $(BUILD) \
		--dart-define=FLAVOR=dev \
		--flavor dev

.PHONY: build-ios-prod
build-ios-prod:
	$(FLUTTER) build ipa \
		--export-options-plist=ios/ExportOptions_prod.plist \
		--release \
		--build-number $(BUILD) \
		--dart-define=FLAVOR=prod \
		--flavor prod
