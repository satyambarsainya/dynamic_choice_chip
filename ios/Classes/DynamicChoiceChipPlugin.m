#import "DynamicChoiceChipPlugin.h"
#if __has_include(<dynamic_choice_chip/dynamic_choice_chip-Swift.h>)
#import <dynamic_choice_chip/dynamic_choice_chip-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dynamic_choice_chip-Swift.h"
#endif

@implementation DynamicChoiceChipPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDynamicChoiceChipPlugin registerWithRegistrar:registrar];
}
@end
