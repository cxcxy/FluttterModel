// Autogenerated from Pigeon (v0.1.23), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class FBCommonParams;
@class FBStackInfo;

@interface FBCommonParams : NSObject
@property(nonatomic, copy, nullable) NSString * pageName;
@property(nonatomic, copy, nullable) NSString * uniqueId;
@property(nonatomic, strong, nullable) NSDictionary * arguments;
@end

@interface FBStackInfo : NSObject
@property(nonatomic, strong, nullable) NSArray * containers;
@property(nonatomic, strong, nullable) NSDictionary * routes;
@end

@interface FBFlutterRouterApi : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)pushRoute:(FBCommonParams*)input completion:(void(^)(NSError* _Nullable))completion;
- (void)popRoute:(FBCommonParams*)input completion:(void(^)(NSError* _Nullable))completion;
- (void)removeRoute:(FBCommonParams*)input completion:(void(^)(NSError* _Nullable))completion;
- (void)onForeground:(FBCommonParams*)input completion:(void(^)(NSError* _Nullable))completion;
- (void)onBackground:(FBCommonParams*)input completion:(void(^)(NSError* _Nullable))completion;
- (void)onNativeViewShow:(FBCommonParams*)input completion:(void(^)(NSError* _Nullable))completion;
- (void)onNativeViewHide:(FBCommonParams*)input completion:(void(^)(NSError* _Nullable))completion;
- (void)onNativeResult:(FBCommonParams*)input completion:(void(^)(NSError* _Nullable))completion;
@end
@protocol FBNativeRouterApi
-(void)pushNativeRoute:(FBCommonParams*)input error:(FlutterError *_Nullable *_Nonnull)error;
-(void)pushFlutterRoute:(FBCommonParams*)input error:(FlutterError *_Nullable *_Nonnull)error;
-(void)popRoute:(FBCommonParams*)input error:(FlutterError *_Nullable *_Nonnull)error;
-(nullable FBStackInfo *)getStackFromHost:(FlutterError *_Nullable *_Nonnull)error;
-(void)saveStackToHost:(FBStackInfo*)input error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void FBNativeRouterApiSetup(id<FlutterBinaryMessenger> binaryMessenger, id<FBNativeRouterApi> _Nullable api);

NS_ASSUME_NONNULL_END
