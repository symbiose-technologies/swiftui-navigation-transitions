//////////////////////////////////////////////////////////////////////////////////
//
//  SYMBIOSE
//  Copyright 2023 Symbiose Technologies, Inc
//  All Rights Reserved.
//
//  NOTICE: This software is proprietary information.
//  Unauthorized use is prohibited.
//
// 
// Created by: Ryan Mckinney on 6/9/23
//
////////////////////////////////////////////////////////////////////////////////
#if canImport(UIKit)


import Foundation
import SwiftUI

public extension AnyNavigationTransition {
    static var zoom: Self {
        .init(Zoom())
    }
    
}

public struct Zoom: NavigationTransition {
    public var body: some NavigationTransition {
        MirrorPush {
            Scale(0.5)
            OnInsertion {
                ZPosition(1)
                Opacity()
            }
        }
    }
}


public extension AnyNavigationTransition {
    
    static var zoomExp: Self {
        .init(ZoomExp())
    }
}


public struct ZoomExp: NavigationTransition {
    public var body: some NavigationTransition {
        OnPush {
            OnInsertion {
                Scale(0.5)
                ZPosition(1)
                Opacity()
            }
            OnRemoval {
                Scale(1.5)
                ZPosition(1)
                Opacity()
            }
        }
        OnPop {
            OnInsertion {
                Scale(1.5)
                ZPosition(1)
                Opacity()
            }
            OnRemoval {
                Scale(0.5)
                ZPosition(1)
                Opacity()
            }
        }
        
    }
}
#endif
