//
// ScaleTransitions.swift
// SwiftUI-Animations
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// CodePassion.dev
//

import SwiftUI

extension AnyTransition {
    /// A scale transition that scales the view from the bottom with opacity.
    ///
    /// - Returns: A transition that combines scaling from bottom with fading.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleFromBottom)
    /// ```
    static var scaleFromBottom: AnyTransition {
        .scale(scale: 0.8, anchor: .bottom).combined(with: .opacity)
    }


    /// A scale transition that scales the view from the top-leading corner with opacity.
    ///
    /// - Returns: A transition that combines scaling from the top-leading corner with fading.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleFromTopLeading)
    /// ```
    static var scaleFromTopLeading: AnyTransition {
        .scale(scale: 0.8, anchor: .topLeading).combined(with: .opacity)
    }


    /// A scale transition that scales the view from the trailing edge with opacity.
    ///
    /// - Returns: A transition that combines scaling from the trailing edge with fading.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleFromTrailing)
    /// ```
    static var scaleFromTrailing: AnyTransition {
        .scale(scale: 0.8, anchor: .trailing).combined(with: .opacity)
    }

    
    /// A scale transition that scales the view from the center with opacity.
    ///
    /// - Returns: A transition that combines scaling from the center with fading.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleFromCenter)
    /// ```
    static var scaleFromCenter: AnyTransition {
        .scale(scale: 0.8, anchor: .center).combined(with: .opacity)
    }
    
    
    /// A scale transition that scales the view from the bottom-leading corner with opacity.
    ///
    /// - Returns: A transition that combines scaling from the bottom-leading corner with fading.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleFromBottomLeading)
    /// ```
    static var scaleFromBottomLeading: AnyTransition {
        .scale(scale: 0.8, anchor: .bottomLeading).combined(with: .opacity)
    }

    
    /// A scale transition that scales the view from the top-trailing corner with opacity.
    ///
    /// - Returns: A transition that combines scaling from the top-trailing corner with fading.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleFromTopTrailing)
    /// ```
    static var scaleFromTopTrailing: AnyTransition {
        .scale(scale: 0.8, anchor: .topTrailing).combined(with: .opacity)
    }

    
    /// A scale transition that expands the view horizontally from the center.
    ///
    /// - Returns: A transition that scales horizontally from the center with opacity.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleHorizontal)
    /// ```
    static var scaleHorizontal: AnyTransition {
        .asymmetric(
            insertion: .modifier(active: ScaleAxisModifier(x: 0.0, y: 1.0), identity: ScaleAxisModifier(x: 1.0, y: 1.0)),
            removal: .modifier(active: ScaleAxisModifier(x: 0.0, y: 1.0), identity: ScaleAxisModifier(x: 1.0, y: 1.0))
        ).combined(with: .opacity)
    }

    
    /// A scale transition that expands the view vertically from the center.
    ///
    /// - Returns: A transition that scales vertically from the center with opacity.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleVertical)
    /// ```
    static var scaleVertical: AnyTransition {
        .asymmetric(
            insertion: .modifier(active: ScaleAxisModifier(x: 1.0, y: 0.0), identity: ScaleAxisModifier(x: 1.0, y: 1.0)),
            removal: .modifier(active: ScaleAxisModifier(x: 1.0, y: 0.0), identity: ScaleAxisModifier(x: 1.0, y: 1.0))
        ).combined(with: .opacity)
    }

    
    /// A pulsating scale transition that grows slightly larger before settling to normal size.
    ///
    /// - Returns: A transition with a soft pulse animation.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scalePulse)
    /// ```
    static var scalePulse: AnyTransition {
        .modifier(
            active: ScaleAxisModifier(x: 1.2, y: 1.2),
            identity: ScaleAxisModifier(x: 1.0, y: 1.0)
        ).combined(with: .opacity)
    }
}
}
