//
//  NavigationBarView.swift
//  Rally
//
//  Created by Ratnesh Jain on 31/07/25.
//

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
            .background(Color(.accentNeutral800).opacity(0.75).ignoresSafeArea())
            .padding(.trailing, 22)
            .background(Color(.accentNeutral800).opacity(0.5).ignoresSafeArea())
            Spacer()
            
            HStack(spacing: 16) {
                Image(.bellDot)
                VStack(alignment: .trailing) {
                    Text("2500")
                        .font(.appFont(.bold, size: 14))
                    Text("points earned")
                        .font(.appFont(.regular, size: 11))
                }
                .padding(.trailing, 4)
                .padding(8)
                .background(Color(.accentNeutral800).opacity(0.75))
            }
            .foregroundStyle(.white)
            .padding(.leading, 16)
            .background(Color(.accentNeutral800).opacity(0.5))
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
