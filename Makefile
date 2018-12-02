TARGET = blanket

.PHONY: all clean

all: clean
	xcodebuild clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphoneos -configuration Debug
	ln -sf build/Debug-iphoneos Payload
	# strip Payload/$(TARGET).app/$(TARGET)
	ldid -Sblanket/blanket.entitlements Payload/$(TARGET).app/$(TARGET)
	zip -r9 $(TARGET).ipa Payload/$(TARGET).app

clean:
	rm -rf build Payload $(TARGET).ipa
