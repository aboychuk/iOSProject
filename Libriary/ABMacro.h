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
    ABRootViewGetterSyntesize(rootViewClass, propertyName) \
    @end

#define ABWeakify(object) \
    __weak __typeof(object) __ABWeakified_##object = object

// You should call this method after you called weakify for same variable
#define ABStrongify(object) \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Wshadow\"") \
    __strong __typeof(object) object = __ABWeakified_##object \
    _Pragma("clang diagnostic pop")

#define ABEmptyParameter

#define ABStrongifyAndReturnIfNil(object); \
    ABStrongifyAndReturnValueIfNil(object, ABEmptyParameter)

#define ABStrongifyAndReturnNilIfNil(object); \
    ABStrongifyAndReturnValueIfNil(object, nil)

#define ABStrongifyAndReturnValueIfNil(object, value) \
    ABStrongify(object) \
    if (!object) { \
        return value; \
    }
