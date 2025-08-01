import Foundation
import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack {
            HStack {
                Image(.threeLines)
                Text("Entry List")
                    .font(.appFont(.bold, size: 28))
                    .foregroundStyle(.white)
            }
            .padding([.horizontal, .bottom])
            .padding(.trailing, 8)
            .background {
                TrapezoidShape.bottomRight(width: 15)
                    .fill(Color(.accentNeutral800).opacity(0.75))
                    .ignoresSafeArea()
            }
            .padding(.trailing, 22)
            .background {
                TrapezoidShape.bottomRight(width: 15)
                    .fill(Color(.accentNeutral800).opacity(0.5))
                    .ignoresSafeArea()
            }
            Spacer()
            
            HStack(spacing: 12) {
                Image(.bellDot)
                VStack(alignment: .trailing) {
                    Text("2500")
                        .font(.appFont(.bold, size: 14))
                    Text("points earned")
                        .font(.appFont(.regular, size: 11))
                }
                .padding(.trailing, 4)
                .padding(8)
                .padding(.leading, 8)
                .background {
                    TrapezoidShape.topLeft(width: 7)
                        .fill(Color(.accentNeutral800).opacity(0.75))
                }
            }
            .foregroundStyle(.white)
            .padding(.leading, 24)
            .background {
                TrapezoidShape.topLeft(width: 7)
                    .fill(Color(.accentNeutral800).opacity(0.75))
            }
        }
        .background() {
            LinearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .opacity(0.5)
        }
        .background {
            Rectangle()
                .fill(Material.regular)
                .mask {
                    LinearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .bottom)
                }
                .ignoresSafeArea()
        }
    }
}

import MapKit

#Preview {
    Map()
    .safeAreaInset(edge: .top) {
        NavigationBarView()
    }
}

struct CornerInsets {
    var topLeft: CGSize
    var topRight: CGSize
    var bottomRight: CGSize
    var bottomLeft: CGSize
    
    init(topLeft: CGSize = .zero, topRight: CGSize = .zero, bottomRight: CGSize = .zero, bottomLeft: CGSize = .zero) {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomRight = bottomRight
        self.bottomLeft = bottomLeft
    }
    
    static var zero: CornerInsets {
        .init()
    }
}

struct TrapezoidShape: Shape {
    let cornerInsets: CornerInsets
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.origin.x + cornerInsets.topLeft.width, y: rect.origin.y + cornerInsets.topLeft.height))
            path.addLine(to: .init(x: rect.width - cornerInsets.topRight.width, y: rect.origin.y + cornerInsets.topRight.height))
            path.addLine(to: .init(x: rect.width - cornerInsets.bottomRight.width, y: rect.height - cornerInsets.bottomRight.height))
            path.addLine(to: .init(x: rect.origin.x + cornerInsets.bottomLeft.width, y: rect.height - cornerInsets.bottomLeft.height))
        }
    }
}

extension TrapezoidShape {
    static func bottomRight(width: CGFloat = 45) -> TrapezoidShape {
        TrapezoidShape(cornerInsets: .init(bottomRight: CGSize(width: width, height: 0)))
    }
    
    static func topLeft(width: CGFloat = 45) -> TrapezoidShape {
        TrapezoidShape(cornerInsets: .init(topLeft: CGSize(width: width, height: 0)))
    }
}

#Preview("Trapezoid Shape") {
    VStack {
        TrapezoidShape(cornerInsets: .init(bottomRight: CGSize(width: 45, height: 0)))
            .fill(Color.accentNeutral750)
            .frame(width: 300, height: 300)
        
        TrapezoidShape(cornerInsets: .init(topLeft: CGSize(width: 45, height: 0)))
            .fill(Color.accentNeutral750)
            .frame(width: 300, height: 300)
    }
}

