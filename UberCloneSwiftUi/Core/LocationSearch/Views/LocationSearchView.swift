//
//  LocationSearchView.swift
//  UberCloneSwiftUi
//
//  Created by NamaN  on 26/01/24.
//

import SwiftUI

struct LocationSearchView: View {
    
    @State private var startingLocationText = ""

    @EnvironmentObject var viewModel : LocationSearchViewModel
    @Binding var showLocationSearchView : Bool
    
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
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
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
                    ForEach(viewModel.results, id: \.self){ result in
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                viewModel.selectedLocation(result)
                                showLocationSearchView.toggle()
                            }
                    }
                })
            }
        }
        .background(.white)
    }
}

#Preview {
    LocationSearchView( showLocationSearchView: .constant(false))
}
