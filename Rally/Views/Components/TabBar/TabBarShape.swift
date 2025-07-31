//
//  TabBarShape.swift
//  Rally
//
//  Created by Rajeev on 31/07/25.
//

import SwiftUI

struct TabBarShape: Shape {
    var bumpHeight: CGFloat = 25
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        
        let bumpWidth: CGFloat = width * 0.25
        let bumpStart = (width - bumpWidth) / 2
        
        path.addPath(UnevenRoundedRectangle(topLeadingRadius: 28, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 28, style: .continuous).path(in: rect))
        
        path.move(to: .zero)
        
        path.addLine(to: CGPoint(x: bumpStart, y: 0))
        
        path.addCurve(
            to: CGPoint(x: bumpStart + bumpWidth / 2, y: -bumpHeight),
            control1: CGPoint(x: bumpStart + bumpWidth * 0.2, y: 0),
            control2: CGPoint(x: bumpStart + bumpWidth * 0.3, y: -bumpHeight)
        )
        
        path.addCurve(
            to: CGPoint(x: bumpStart + bumpWidth, y: 0),
            control1: CGPoint(x: bumpStart + bumpWidth * 0.7, y: -bumpHeight),
            control2: CGPoint(x: bumpStart + bumpWidth * 0.8, y: 0)
        )
        
        return path
    }
}

#Preview("TabBarShape") {
    TabBarShape()
        .fill(Color.green)
        .frame(width: 300, height: 68)
}

