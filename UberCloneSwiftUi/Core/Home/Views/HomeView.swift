//
//  HomeView.swift
//  UberCloneSwiftUi
//
//  Created by NamaN  on 26/01/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var locationViewModel : LocationSearchViewModel
    @State private var mapState = MapViewState.noInput
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                if mapState == .searchingForLocation {
                    LocationSearchView(mapState: $mapState)
                }else if mapState ==  .noInput{
                    LocationSearchActivationView()
                        .padding(.top, 72)
                        .onTapGesture {
                            withAnimation(.spring) {
                                mapState = .searchingForLocation
                            }
                        }
                }
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 5)
            }
            
            if mapState == .locationSelected {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    HomeView()
        .environmentObject(LocationSearchViewModel())
}
