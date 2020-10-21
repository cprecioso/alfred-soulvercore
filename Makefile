.build/SoulverCore.alfredworkflow: Resources/* .build/release/alfred-soulvercore
	-rm $@
	cd Resources && zip -r ../$@ ./*
	cd .build/release && zip -ur ../../../$@ ./alfred-soulvercore ./*.framework

.build/release/alfred-soulvercore: Package.* Sources/alfred-soulvercore/**
	swift build -c release
