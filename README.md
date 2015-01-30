# MMP_DeviceInfo
An utility class that can be used for retrieving the iOS device details.

##Steps:

1. Just add the .h and .m files to your project
2. Import the MMPDeviceInfo.h , using `#import "MMPDeviceInfo.h"`
3. All the methods in this class are `Class methods`. You can call them using class name

##Quick Reference:

###getDeviceName

```
+ (NSString *)getDeviceName;  
```

**Return Value:**

`NSString` - Device Name

**Discussion**

Returns the device name specified in the settings app

**Usage:**

```
[MMPDeviceInfo getDeviceName];
```

***

###getDeviceOSInfo

```
+ (NSString *)getDeviceOSInfo;  
```

**Return Value:**

`NSString` - OS Version info

**Discussion:**

Returns the OS Version.

**Usage:**
```
[MMPDeviceInfo getDeviceOSInfo]; @endcode
```

***

###getDeviceType
```
+ (DeviceType)getDeviceType;  
```
**Return Value**

`DeviceType` - Enum value specifies whether it's an iPad or iPhone

**Discussion**

Returns the device type, iPad or iPhone.

**Usage:**
```
[MMPDeviceInfo getDeviceType];
```

***

###getModelInfo
```
+ (NSString *)getModelInfo;  
```

**Return Value**

`NSString` - Value specifies the model information

**Discussion:**

Returns the model info.

**Usage:**
```
[MMPDeviceInfo getModelInfo];
```

***

###getPlatformInfo

```
+ (NSString *)getPlatformInfo;  
```
**Return Value:**

`NSString` - Platform info


**Discussion:**

Returns the platform information.

**Usage:**
```
[MMPDeviceInfo getPlatformInfo];
```

***

For Further Details Contact:

	Midhun M P
	Email : midhunmp7@gmail.com