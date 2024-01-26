//
//  LocationSearchResultCell.swift
//  UberCloneSwiftUi
//
//  Created by NamaN  on 26/01/24.
//

import SwiftUI

struct LocationSearchResultCell: View {
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment : .leading, spacing: 4){
                Text("Starbucks Coffee")
                    .font(.body)
                Text("Pacific Mall, Tagore Garden")
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResultCell()
}
