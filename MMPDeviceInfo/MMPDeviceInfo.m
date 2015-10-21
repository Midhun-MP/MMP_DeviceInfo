/*!
 * @file MMPDeviceInfo.m
 * @class MMPDeviceInfo
 * MMPDeviceInfo
 * @author Created by Midhun on 13/01/15.
 * @copyright Copyright (c) 2015 Midhun. All rights reserved.
 * @discussion This class can be used for getting the details of the iOS device/Simulator
 */

#import "MMPDeviceInfo.h"
#import <sys/sysctl.h>

@implementation MMPDeviceInfo

#pragma mark - Device Info -

/*!
 * Returns the platform information
 * @code
 * [MMPDeviceInfo getPlatformInfo];
 * @endcode
 * @return NSString - Platform info
 */
+ (NSString *)getPlatformInfo;
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

/*!
 * Returns the OS Version
 * @code
 * [MMPDeviceInfo getDeviceOSInfo];
 * @endcode
 * @return NSString - OS Version info
 */
+ (NSString *)getDeviceOSInfo
{
    NSString *osVersion = [[UIDevice currentDevice] systemVersion];
    return osVersion;
}

/*!
 * Returns the device name specified in the settings app
 * @code
 * [MMPDeviceInfo getDeviceName];
 * @endcode
 * @return NSString - Device Name
 */
+ (NSString *)getDeviceName
{
    NSString *deviceName = [[UIDevice currentDevice] model];
    return deviceName;
}

/*!
 * Returns the model info
 * @code
 * [MMPDeviceInfo getModelInfo];
 * @endcode
 * @return NSString - Value specifies the model information
 */
+ (NSString *)getModelInfo
{
    NSString *model = [[UIDevice currentDevice] model];
    return model;
}

/*!
 * Returns the device type, iPad or iPhone
 * @code
 * [MMPDeviceInfo getDeviceType];
 * @endcode
 * @return DeviceType - Enum value specifies whether it's an iPad or iPhone
 */
+ (DeviceType)getDeviceType
{
    DeviceType deviceType = DeviceTypeUnknown;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        deviceType = DeviceTypeiPad;
    }
    else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        deviceType = DeviceTypeiPhone;
    }
    return deviceType;
}

#pragma mark - App Info -

/*!
 * Returns the app name
 * @code
 * [MMPDeviceInfo getAppName];
 * @endcode
 * @return NSString - Name of the application
 */
+ (NSString *)getAppName
{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    return appName;
}

/*!
 * Returns the app name
 * @code
 * [MMPDeviceInfo getAppVersion];
 * @endcode
 * @return NSString - Version of the application
 */
+ (NSString *)getAppVersion
{
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return appVersion;
}

#pragma mark - Utility -

/*!
 * Returns the details of device
 * @code
 * [MMPDeviceInfo getDeviceDetails];
 * @endcode
 * @return NSDictionary - Contains all the details of device
 */
+ (NSDictionary *)getDeviceDetails
{
    NSString *deviceType = @"Unknown";
    switch ([self getDeviceType])
    {
        case DeviceTypeiPhone:
            deviceType = @"iPhone";
            break;
        case DeviceTypeiPad:
            deviceType = @"iPad";
            break;
            
        default:
            deviceType = @"Unknown";
            break;
    }
    
    NSDictionary *device = @{
                             @"platform"     : [self getPlatformInfo],
                             @"os"           : [self getDeviceOSInfo],
                             @"device_name"  : [self getDeviceName],
                             @"device_model" : [self getModelInfo],
                             @"device_type"  : deviceType
                             };
    return device;
}

/*!
 * Returns the details of application
 * @code
 * [MMPDeviceInfo getAppDetails];
 * @endcode
 * @return NSDictionary - Contains all the details of application
 */
+ (NSDictionary *)getAppDetails
{
    NSDictionary *app = @{
                          @"app_name"    : [self getAppName],
                          @"app_version" : [self getAppVersion]
                          };
    return app;
}

/*!
 * Returns the all the details of device and application
 * @code
 * [MMPDeviceInfo getAllDetails];
 * @endcode
 * @return NSDictionary - Contains all the details of device and application
 */
+ (NSDictionary *)getAllDetails
{
    NSDictionary *info = @{
                           @"device" : [self getDeviceDetails],
                           @"app"    : [self getAppDetails]
                           };
    return info;
}
@end
