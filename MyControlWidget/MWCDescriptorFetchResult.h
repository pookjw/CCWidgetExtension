//
//  MWCDescriptorFetchResult.h
//  MyControlWidget
//
//  Created by Jinwoo Kim on 9/14/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWCDescriptorFetchResult : NSObject <NSSecureCoding>
@property (copy, nonatomic) id /* CHS(Mutable)WidgetDescriptor */ activityDescriptors;
@property (copy, nonatomic) id /* CHS(Mutable)ControlDescriptor */ controlDescriptors;
@property (copy, nonatomic) id /* CHS(Mutable)WidgetDescriptor */ widgetDescriptors;
@end

NS_ASSUME_NONNULL_END
