//
//  MapViewActionButton.swift
//  UberCloneSwiftUi
//
//  Created by NamaN  on 26/01/24.
//

import SwiftUI

struct MapViewActionButton: View {
    
    @Binding var mapState : MapViewState
    @EnvironmentObject var viewModel : LocationSearchViewModel
    
    var body: some View {
        Button {
            withAnimation(.spring) {
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundStyle(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
    
    func actionForState(_ state : MapViewState) {
        switch state{
        case  .noInput :
            print("debug no input")
        case .searchingForLocation :
            mapState = .noInput
        case .locationSelected :
            mapState = .noInput
            viewModel.selectedUberLocation = nil
        }
    }
    func imageNameForState(_ state : MapViewState) -> String{
        switch state{
        case  .noInput :
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected :
            return "arrow.left"
        }
    }
}

#Preview {
    MapViewActionButton(mapState: .constant(.noInput))
}
