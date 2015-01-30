/*!
 * @file MMPDeviceInfo.h
 * @class MMPDeviceInfo
 * MMPDeviceInfo
 * @author Created by Midhun on 13/01/15.
 * @copyright Copyright (c) 2015 Midhun. All rights reserved.
 * @discussion This class can be used for getting the details of the iOS device/Simulator
 */
#import <UIKit/UIKit.h>

#pragma mark - Constants & Enums -

/*!
 * Enum defines the available device types
 */
typedef NS_ENUM(NSInteger, DeviceType)
{
    /*!
     * Device Type Unknown
     */
    DeviceTypeUnknown = 0,
    /*!
     * Device Type iPad
     */
    DeviceTypeiPad,
    /*!
     * Device Type iPhone
     */
    DeviceTypeiPhone
};

#pragma mark - Interface -

@interface MMPDeviceInfo : NSObject

/*!
 * Returns the platform information
 * @code
 * [MMPDeviceInfo getPlatformInfo];
 * @endcode
 * @return NSString - Platform info
 */
+ (NSString *)getPlatformInfo;

/*!
 * Returns the OS Version
 * @code
 * [MMPDeviceInfo getDeviceOSInfo];
 * @endcode
 * @return NSString - OS Version info
 */
+ (NSString *)getDeviceOSInfo;

/*!
 * Returns the device name specified in the settings app
 * @code
 * [MMPDeviceInfo getDeviceName];
 * @endcode
 * @return NSString - Device Name
 */
+ (NSString *)getDeviceName;

/*!
 * Returns the model info
 * @code
 * [MMPDeviceInfo getModelInfo];
 * @endcode
 * @return NSString - Value specifies the model information
 */
+ (NSString *)getModelInfo;

/*!
 * Returns the device type, iPad or iPhone
 * @code
 * [MMPDeviceInfo getDeviceType];
 * @endcode
 * @return DeviceType - Enum value specifies whether it's an iPad or iPhone
 */
+ (DeviceType)getDeviceType;

@end
