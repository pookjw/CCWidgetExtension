//
//  MWCExtensionXPCServerExportedObject.mm
//  MyControlWidget
//
//  Created by Jinwoo Kim on 9/14/24.
//

#import "MWCExtensionXPCServerExportedObject.h"
#import "MWCDescriptorFetchResult.h"
#import <objc/runtime.h>
#import <objc/message.h>

/*
 (lldb) po [NSClassFromString(@"_TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject") _fd_shortMethodDescription]
 <_TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject: 0x1eed8f5f8> (WidgetKit.HostToExtensionXPCInterface):

 in _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject:
     Class Methods:

     Instance Methods:
         - (id) init; (0x1d3e250ac)
         - (void) .cxx_destruct; (0x1d3e250e4)
         - (void) invalidate; (0x1d3e204a0)
         - (void) performCleanup; (0x1d3e20488)
         - (void) pushTokensDidChange:(id)arg1 completion:(^block)arg2; (0x1d3e283e8)
         - (void) attachPreviewAgentWithFrameworkPath:(id)arg1 endpoint:(id)arg2 handler:(^block)arg3; (0x1d3e2500c)
         - (void) getActivitiesWithRequests:(id)arg1 completion:(^block)arg2; (0x1d3e29190)
         - (void) getAllCurrentDescriptorsWithCompletion:(^block)arg1; (0x1d3e20628)
         - (void) getAppIntentsXPCListenerEndpointWithCompletion:(^block)arg1; (0x1d3e24810)
         - (void) getControlTemplatesWithRequests:(id)arg1 completion:(^block)arg2; (0x1d3e25768)
         - (void) getCurrentDescriptorsWithCompletion:(^block)arg1; (0x1d3e2053c)
         - (void) getPlaceholdersWithRequests:(id)arg1 completion:(^block)arg2; (0x1d3e22a74)
         - (void) getTimelinesWithRequests:(id)arg1 isPreview:(_Bool)arg2 completion:(^block)arg3; (0x1d3e22b08)
         - (void) getWidgetRelevancesWithRequest:(id)arg1 completion:(^block)arg2; (0x1d3e24f8c)
         - (void) handleURLSessionEventsFor:(id)arg1 completion:(^block)arg2; (0x1d3e2106c)
         - (void) setControlState:(id)arg1 completion:(^block)arg2; (0x1d3e28b68)
 (NSObject ...)

 (lldb) po [NSObject _fd__protocolDescriptionForProtocol:(Protocol *)NSProtocolFromString(@"_TtP9WidgetKit27HostToExtensionXPCInterface_")]
 <WidgetKit.HostToExtensionXPCInterface: 0x1ebfc0f88> :

 in WidgetKit.HostToExtensionXPCInterface:
     Instance Methods:
         - (void) invalidate;
         - (void) performCleanup;
         - (void) pushTokensDidChange:(id)arg1 completion:(^block)arg2;
         - (void) attachPreviewAgentWithFrameworkPath:(id)arg1 endpoint:(id)arg2 handler:(^block)arg3;
         - (void) getActivitiesWithRequests:(id)arg1 completion:(^block)arg2;
         - (void) getAllCurrentDescriptorsWithCompletion:(^block)arg1;
         - (void) getAppIntentsXPCListenerEndpointWithCompletion:(^block)arg1;
         - (void) getControlTemplatesWithRequests:(id)arg1 completion:(^block)arg2;
         - (void) getCurrentDescriptorsWithCompletion:(^block)arg1;
         - (void) getPlaceholdersWithRequests:(id)arg1 completion:(^block)arg2;
         - (void) getTimelinesWithRequests:(id)arg1 isPreview:(_Bool)arg2 completion:(^block)arg3;
         - (void) getWidgetRelevancesWithRequest:(id)arg1 completion:(^block)arg2;
         - (void) handleURLSessionEventsFor:(id)arg1 completion:(^block)arg2;
         - (void) setControlState:(id)arg1 completion:(^block)arg2;
 */

@implementation MWCExtensionXPCServerExportedObject

+ (void)load {
    assert(class_addProtocol(MWCExtensionXPCServerExportedObject.class, NSProtocolFromString(@"_TtP9WidgetKit27HostToExtensionXPCInterface_")));
}

- (void)invalidate {
    
}

- (void)performCleanup {
    abort();
}

- (void)pushTokensDidChange:(id)arg1 completion:(id)arg2 {
    abort();
}

- (void)attachPreviewAgentWithFrameworkPath:(id)arg1 endpoint:(id)arg2 handler:(id)arg3 {
    abort();
}

- (void)getActivitiesWithRequests:(id)arg1 completion:(id)arg2 {
    abort();
}

- (void)getAllCurrentDescriptorsWithCompletion:(void (^)(id /* WidgetKit.DescriptorFetchResult */ result))completion {
    id controlDescriptors = reinterpret_cast<id (*)(id, SEL, id, id, NSUInteger, id)>(objc_msgSend)([objc_lookUpClass("CHSMutableControlDescriptor") alloc], sel_registerName("initWithExtensionIdentity:kind:controlType:intentType:"), @"com.pookjw.MyApp.MyControlWidget", @"com.pookjw.MyApp.MyControlWidget", 1, nil);
    
    reinterpret_cast<void (*)(id, SEL, id)>(objc_msgSend)(controlDescriptors, sel_registerName("setDisplayName:"), @"Demo");
    reinterpret_cast<void (*)(id, SEL, id)>(objc_msgSend)(controlDescriptors, sel_registerName("setWidgetDescription:"), @"Description!!!");
    reinterpret_cast<void (*)(id, SEL, NSUInteger)>(objc_msgSend)(controlDescriptors, sel_registerName("setPlatform:"), 3);
    
    id extensionIdentity = reinterpret_cast<id (*)(id, SEL, id, id, id)>(objc_msgSend)([objc_lookUpClass("CHSExtensionIdentity") alloc], sel_registerName("initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:"), @"com.pookjw.MyApp.MyControlWidget", @"com.pookjw.MyApp", nil);
    reinterpret_cast<void (*)(id, SEL, id)>(objc_msgSend)(controlDescriptors, sel_registerName("setExtensionIdentity:"), extensionIdentity);
    [extensionIdentity release];
    
    MWCDescriptorFetchResult *fetchResult = [MWCDescriptorFetchResult new];
    fetchResult.controlDescriptors = controlDescriptors;
    [controlDescriptors release];
    
    completion(fetchResult);
    [fetchResult release];
}

- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)arg1 {
    abort();
}

- (void)getControlTemplatesWithRequests:(id)arg1 completion:(id)arg2 {
    abort();
}

- (void)getCurrentDescriptorsWithCompletion:(id)arg1 {
    abort();
}

- (void)getPlaceholdersWithRequests:(id)arg1 completion:(id)arg2 {
    abort();
}

- (void)getTimelinesWithRequests:(id)arg1 isPreview:(_Bool)arg2 completion:(id)arg3 {
    abort();
}

- (void)getWidgetRelevancesWithRequest:(id)arg1 completion:(id)arg2 {
    abort();
}

- (void)handleURLSessionEventsFor:(id)arg1 completion:(id)arg2 {
    abort();
}

- (void)setControlState:(id)arg1 completion:(id)arg2 {
    abort();
}

@end
