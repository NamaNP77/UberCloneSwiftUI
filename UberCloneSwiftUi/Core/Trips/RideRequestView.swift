//
//  RideRequestView.swift
//  UberCloneSwiftUi
//
//  Created by NamaN  on 30/01/24.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack{
            Capsule()
                .foregroundStyle(Color(.systemGray5))
                .frame(width: 48, height: 6)
            
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
                        Text("1:30 PM")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Text("StarBUCK Coffee")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        Spacer()
                        Text("1:45 PM")
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
                    ForEach(0 ..< 3, id: \.self){ _ in
                        VStack(alignment: .leading){
                            Image("uber-x")
                                .resizable()
                                .scaledToFit()
                            VStack(spacing : 4) {
                                Text("UberX")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                Text("Rs.300")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                            }
                            .padding(8  )
                            
                        }
                        .frame(width: 112, height: 140)
                        .background(
                            Color(.systemGroupedBackground)
                        )
                        .cornerRadius(10)
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
        .background(.white)
    }
}

#Preview {
    RideRequestView()
}
