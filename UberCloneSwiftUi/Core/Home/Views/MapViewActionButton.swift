//
//  MapViewActionButton.swift
//  UberCloneSwiftUi
//
//  Created by NamaN  on 26/01/24.
//

import SwiftUI

struct MapViewActionButton: View {
    
    @Binding var showLocationSearchView : Bool
    
    var body: some View {
        Button {
            withAnimation(.spring) {
                showLocationSearchView.toggle()
            }
        } label: {
            Image(systemName: showLocationSearchView ? "arrow.left" : "line.3.horizontal")
                .font(.title2)
                .foregroundStyle(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

#Preview {
    MapViewActionButton(showLocationSearchView: .constant(true))
}
