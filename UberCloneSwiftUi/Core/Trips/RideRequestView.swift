//
//  RideRequestView.swift
//  UberCloneSwiftUi
//
//  Created by NamaN  on 30/01/24.
//

import SwiftUI

struct RideRequestView: View {
    
    @State private var selectedRideType : RideType = .uberX
    @EnvironmentObject var locationViewModel : LocationSearchViewModel
    
    var body: some View {
        VStack{
            Capsule()
                .foregroundStyle(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
                
            
            //trip info view
            HStack{
                //indicator view
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                    
                }
                
                VStack(alignment : .leading, spacing : 24){
                    HStack{
                        Text("Current Location")
                            .font(.system(size: 16))
                            .foregroundStyle(.gray)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(locationViewModel.pickUpTime ?? "")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        if let location = locationViewModel.selectedUberLocation {
                            Text(location.title)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                        }
                        Spacer()
                        Text(locationViewModel.dropOffTime ?? "")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                    }
                    
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
            
            //ride type selection view
            Text("Suggested Rides")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView (.horizontal){
                HStack(spacing: 12){
                    ForEach(RideType.allCases){ type in
                        VStack(alignment: .leading){
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            VStack(alignment: .leading ,spacing : 4) {
                                Text(type.description)
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                Text(""+locationViewModel.computeRidePrice(forType: type).toCurrency())
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            
                        }
                        .frame(width: 112, height: 140)
                        .foregroundStyle(type == selectedRideType ? .white : .black)
                        .background(Color(type == selectedRideType ? .systemBlue : .systemGroupedBackground))
                        .scaleEffect(type == selectedRideType ? 1.2 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring){
                                selectedRideType = type
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)
            //payment option
            HStack(spacing: 8){
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundStyle(.white)
                    .padding(.leading)
                Text("**** 1234")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            //request ride button
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundStyle(.white)
            }

        }
        .padding(.bottom, 24)
        .background(.white)
        .cornerRadius(16)
    }
}

#Preview {
    RideRequestView()
}
