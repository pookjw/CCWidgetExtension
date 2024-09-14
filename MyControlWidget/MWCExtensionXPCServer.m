//
//  MWCExtensionServer.m
//  MyControlWidget
//
//  Created by Jinwoo Kim on 9/14/24.
//

#import "MWCExtensionXPCServer.h"
#import "MWCExtensionXPCServerExportedObject.h"
#import <objc/runtime.h>

@implementation MWCExtensionXPCServer

+ (void)load {
    assert(class_addProtocol(self, NSProtocolFromString(@"_EXConnectionHandler")));
}

/*
 WidgetKit.WidgetExtensionXPCServer
 _TtC9WidgetKit24WidgetExtensionXPCServer
 
 _TtP9WidgetKit27HostToExtensionXPCInterface_
 
 WidgetKit.WidgetExtensionXPCServer.ExportedObject
 _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject
 */
- (BOOL)shouldAcceptXPCConnection:(NSXPCConnection *)connection {
    NSXPCInterface *inferface = [NSXPCInterface interfaceWithProtocol:NSProtocolFromString(@"_TtP9WidgetKit27HostToExtensionXPCInterface_")];
    connection.exportedInterface = inferface;
    
    MWCExtensionXPCServerExportedObject *exportedObject = [MWCExtensionXPCServerExportedObject new];
    connection.exportedObject = exportedObject;
    [exportedObject release];
    
    [connection resume];
    return YES;
}

@end
