#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSDictionary *dict = [self JSONFromFile];
    NSString *google_maps_api_key = [dict valueForKey:@"google_maps_api_key"];
    [GMSServices provideAPIKey:google_maps_api_key];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"constants" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data == nil) {
        NSLog(@" |");
        NSLog(@" v");
        ALog(@"❌ Constants file not found");
        NSLog(@" ^");
        NSLog(@" |");
    }
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
