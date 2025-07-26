//
// FadeTransitions.swift
// SwiftUI-Animations
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// CodePassion.dev
//

import SwiftUI

// MARK: - Corner-Based Custom Transitions

extension AnyTransition {
    /// A fade-in and fade-out transition.
    ///
    /// - Returns: A transition that smoothly changes opacity.
    ///
    /// # Usage
    /// ```
    /// .transition(.fade)
    /// ```
    static var fade: AnyTransition {
        .opacity
    }


    /// A smooth fade-and-scale transition combining opacity and scale effects.
    ///
    /// - Returns: A transition that fades and slightly scales the view for a polished animation.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeAndScale)
    /// ```
    static var fadeAndScale: AnyTransition {
        .opacity.combined(with: .scale(scale: 0.95, anchor: .center))
    }


    /// A fade-and-scale transition that fades in/out while scaling from the center anchor.
    ///
    /// - Returns: A transition combining opacity with center scaling.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeScaleCenter)
    /// ```
    static var fadeScaleCenter: AnyTransition {
        .opacity.combined(with: .scale(scale: 0.8, anchor: .center))
    }


    /// A fade-and-scale transition that fades in/out while scaling from the leading anchor.
    ///
    /// - Returns: A transition combining opacity with scale from the leading edge.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeScaleLeading)
    /// ```
    static var fadeScaleLeading: AnyTransition {
        .opacity.combined(with: .scale(scale: 0.9, anchor: .leading))
    }


    /// A fade-and-scale transition that fades in/out while scaling from the trailing anchor.
    ///
    /// - Returns: A transition combining opacity with scale from the trailing edge.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeScaleTrailing)
    /// ```
    static var fadeScaleTrailing: AnyTransition {
        .opacity.combined(with: .scale(scale: 0.9, anchor: .trailing))
    }


    /// A fade-and-scale transition that fades in/out while scaling from the top anchor.
    ///
    /// - Returns: A transition combining opacity with vertical scale from top.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeScaleTop)
    /// ```
    static var fadeScaleTop: AnyTransition {
        .opacity.combined(with: .scale(scale: 0.9, anchor: .top))
    }


    /// A fade-and-scale transition that fades in/out while scaling from the bottom anchor.
    ///
    /// - Returns: A transition combining opacity with vertical scale from bottom.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeScaleBottom)
    /// ```
    static var fadeScaleBottom: AnyTransition {
        .opacity.combined(with: .scale(scale: 0.9, anchor: .bottom))
    }


    /// A fade-and-slide transition that moves the view in/out from the leading edge while fading.
    ///
    /// - Returns: A transition that combines fading with horizontal movement from the leading edge.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeSlideLeading)
    /// ```
    static var fadeSlideLeading: AnyTransition {
        .opacity.combined(with: .move(edge: .leading))
    }


    /// A fade-and-slide transition that moves the view in/out from the trailing edge while fading.
    ///
    /// - Returns: A transition that combines fading with horizontal movement from the trailing edge.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeSlideTrailing)
    /// ```
    static var fadeSlideTrailing: AnyTransition {
        .opacity.combined(with: .move(edge: .trailing))
    }


    /// A fade-and-move transition that fades in/out while moving from the bottom.
    ///
    /// - Returns: A transition combining opacity and offset from bottom.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeMoveUp)
    /// ```
    static var fadeMoveUp: AnyTransition {
        .opacity.combined(with: .move(edge: .bottom))
    }


    /// A fade-and-move transition that fades in/out while moving from the top.
    ///
    /// - Returns: A transition combining opacity and offset from the top.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeMoveDown)
    /// ```
    static var fadeMoveDown: AnyTransition {
        .opacity.combined(with: .move(edge: .top))
    }
}

// MARK: - Offset and Rotation Transitions

extension AnyTransition {
    /// A fade-and-offset transition that moves the view slightly up while fading.
    ///
    /// - Returns: A transition combining opacity with a subtle upward offset.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeOffsetUp)
    /// ```
    static var fadeOffsetUp: AnyTransition {
        AnyTransition.opacity.combined(with: .modifier(
            active: OffsetEffect(offset: CGSize(width: 0, height: 20)),
            identity: OffsetEffect(offset: .zero)
        ))
    }

    private struct OffsetEffect: ViewModifier {
        let offset: CGSize

        func body(content: Content) -> some View {
            content.offset(offset)
        }
    }


    /// A fade-and-rotation transition that combines opacity with a slight rotation effect.
    ///
    /// - Returns: A transition combining fade and a subtle rotation.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeRotate)
    /// ```
    static var fadeRotate: AnyTransition {
        AnyTransition.opacity.combined(with: .modifier(
            active: RotationEffect(angle: .degrees(-15)),
            identity: RotationEffect(angle: .zero)
        ))
    }

    private struct RotationEffect: ViewModifier {
        let angle: Angle

        func body(content: Content) -> some View {
            content.rotationEffect(angle)
        }
    }
}

// MARK: - Corner and Diagonal Offset Transitions

extension AnyTransition {
    /// A fade-and-offset transition that moves the view from the top leading corner while fading.
    ///
    /// - Returns: A transition combining opacity with offset from top leading corner.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeCornerTopLeading)
    /// ```
    static var fadeCornerTopLeading: AnyTransition {
        AnyTransition.opacity.combined(with: .modifier(
            active: CornerOffsetEffect(offset: CGSize(width: -50, height: -50)),
            identity: CornerOffsetEffect(offset: .zero)
        ))
    }


    /// A fade-and-slide transition that offsets the view from the top trailing corner while fading.
    ///
    /// - Returns: A transition combining fade with offset from top trailing corner.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeCornerTopTrailing)
    /// ```
    static var fadeCornerTopTrailing: AnyTransition {
        AnyTransition.opacity.combined(with: .modifier(
            active: CornerOffsetEffect(offset: CGSize(width: 50, height: -50)),
            identity: CornerOffsetEffect(offset: .zero)
        ))
    }


    /// A fade-and-slide transition that offsets the view from the bottom leading corner while fading.
    ///
    /// - Returns: A transition combining fade with offset from bottom leading corner.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeCornerBottomLeading)
    /// ```
    static var fadeCornerBottomLeading: AnyTransition {
        AnyTransition.opacity.combined(with: .modifier(
            active: CornerOffsetEffect(offset: CGSize(width: -50, height: 50)),
            identity: CornerOffsetEffect(offset: .zero)
        ))
    }


    /// A fade-and-offset transition that slides from bottom trailing corner while fading.
    ///
    /// - Returns: A transition combining opacity with offset from bottom trailing corner.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeCornerBottomTrailing)
    /// ```
    static var fadeCornerBottomTrailing: AnyTransition {
        AnyTransition.opacity.combined(with: .modifier(
            active: CornerOffsetEffect(offset: CGSize(width: 50, height: 50)),
            identity: CornerOffsetEffect(offset: .zero)
        ))
    }


    /// A fade-and-offset transition that moves the view diagonally inward from all sides.
    ///
    /// - Returns: A transition combining opacity with diagonal inward movement.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeInwardDiagonal)
    /// ```
    static var fadeInwardDiagonal: AnyTransition {
        AnyTransition.opacity.combined(with: .modifier(
            active: CornerOffsetEffect(offset: CGSize(width: 40, height: 40)),
            identity: CornerOffsetEffect(offset: .zero)
        ))
    }


    /// A fade-and-offset transition that moves the view diagonally outward to all sides.
    ///
    /// - Returns: A transition combining opacity with diagonal outward movement.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.fadeOutwardDiagonal)
    /// ```
    static var fadeOutwardDiagonal: AnyTransition {
        AnyTransition.opacity.combined(with: .modifier(
            active: CornerOffsetEffect(offset: CGSize(width: -40, height: -40)),
            identity: CornerOffsetEffect(offset: .zero)
        ))
    }


    /// A custom view modifier that applies a specified offset to the view content.
    /// Used for creating corner and diagonal offset transitions in combination with opacity.
    ///
    /// - Parameter offset: The offset to apply during the active transition state.
    private struct CornerOffsetEffect: ViewModifier {
        let offset: CGSize
        func body(content: Content) -> some View {
            content.offset(offset)
        }
    }
}
