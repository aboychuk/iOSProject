//
//  ABMacro.h
//  iOSProject
//
//  Created by Andrew Boychuk on 19.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#define ABDefineRootViewProperty(viewClass, propertyName) \
    @property (nonatomic, readonly) viewClass  *propertyName;

#define ABRootViewGetterSyntesize(viewClass, selector) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
    \
        return nil; \
    }

#define ABViewControllerRootViewProperty(viewControllerClass, propertyName, rootViewClass) \
    @interface viewControllerClass (ABPrivateRootClass) \
    ABDefineRootViewProperty(rootViewClass, propertyName)   \
    \
    @end \
    \
    @implementation ABUsersViewController (ABPrivateRootClass) \
    @dynamic propertyName; \
    \
    ABRootViewGetterSyntesize(rootViewClass, propertyName)

