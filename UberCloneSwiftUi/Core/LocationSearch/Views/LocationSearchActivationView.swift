//
//  LocationSearchActivationView.swift
//  UberCloneSwiftUi
//
//  Created by NamaN  on 26/01/24.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack{
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Where to?")
                .foregroundStyle(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 6)
        )
    }
}

#Preview {
    LocationSearchActivationView()
}
