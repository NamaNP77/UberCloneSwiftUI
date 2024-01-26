//
//  LocationSearchView.swift
//  UberCloneSwiftUi
//
//  Created by NamaN  on 26/01/24.
//

import SwiftUI

struct LocationSearchView: View {
    
    @State private var startingLocationText = ""
    @State private var destinationLocationText = ""
    
    var body: some View {
        VStack{
            
            //headerView
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 6, height: 6)

                }
                
                VStack{
                    TextField("Current Location", text: $startingLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $destinationLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            //listView
            ScrollView {
                VStack(alignment: .leading, content: {
                    ForEach(0 ..< 5, id: \.self){ _ in
                        LocationSearchResultCell()
                    }
                })
            }
        }
        .background(.white)
    }
}

#Preview {
    LocationSearchView()
}
