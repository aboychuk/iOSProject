//
//  ABMacro.h
//  iOSProject
//
//  Created by Andrew Boychuk on 18.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#ifndef ABMacro_h
#define ABMacro_h

#define ABWeakify(object) \
__weak typeof(object) weak_##object = object;

#define ABStrongify(object) \
__strong typeof(object) object = weak_##object;


#endif /* ABMacro_h */
