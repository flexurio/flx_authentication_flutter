.PHONY: build get clean fix

build:
	dart run build_runner build --delete-conflicting-outputs

get:
	flutter pub get

clean:
	flutter clean
	rm -rf pubspec.lock

fix:
	dart fix --apply
