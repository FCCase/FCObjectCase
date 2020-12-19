//
//  FCBaseKitHeader.h
//  Pods
//
//  Created by 石富才 on 2020/12/16.
//

#ifndef FCBaseKitHeader_h
#define FCBaseKitHeader_h

/** Size 固定方式 */
typedef NS_ENUM(NSInteger, FCBaseKitSizeType){
    FCBaseKitSizeTypeFixSize,
    FCBaseKitSizeTypeFixWidth,
    FCBaseKitSizeTypeFixHeight,
};

typedef NS_ENUM(NSInteger, FCBaseKitVCAnimationType){
    FCBaseKitVCAnimationTypePush,
    FCBaseKitVCAnimationTypePop,
    FCBaseKitVCAnimationTypePresent,
    FCBaseKitVCAnimationTypeDismiss,
};


#endif /* FCBaseKitHeader_h */
