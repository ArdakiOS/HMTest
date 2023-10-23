//
//  Trade.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 23.10.2023.
//

import SwiftUI

struct Trade: View {
    @State var selectedPair = "GBP/USD"
    var body: some View {
        ZStack{
            Color.init(red: 32/255, green: 35/255, blue: 47/255)
                .ignoresSafeArea()
            VStack{
                Text("Trade")
                    .font(.system(size: 22, weight: .bold))
                
                VStack(spacing: 15){
                    
                    Text("Balance")
                        
                        .font(.system(size: 12))
                    Text("10 000")
                        .font(.system(size: 16, weight: .bold))
                        
                }
                .frame(width: 315, height: 54)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(Color.init(red: 51/255, green: 55/255, blue: 73/255))
                )
                
                NavigationLink {
                    SelectPair(selectedPair: $selectedPair)
                        .navigationBarBackButtonHidden()
                } label: {
                    ZStack{
                        Text(selectedPair)
                            .font(.system(size: 16, weight: .bold))
                        
                        Image(systemName: "chevron.right")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.horizontal)
                    .frame(width: 315, height: 54)
                    .background(
                        RoundedRectangle(cornerRadius: 12).fill(Color.init(red: 51/255, green: 55/255, blue: 73/255))
                    )
                }

                
                
                HStack{
                    VStack{
                        VStack{
                            Text("Timer")
                                .foregroundStyle(.gray)
                                .font(.system(size: 12, weight: .bold))
                            
                            HStack{
                                Button {
                                    //
                                } label: {
                                    Image(systemName: "minus.circle")
                                }
                                
                                Text("00:01")
                                    .padding(.horizontal,5)
                                    .font(.system(size: 16, weight: .bold))
                                
                                Button {
                                    //
                                } label: {
                                    Image(systemName: "plus.circle")
                                }
                            }
                        }
                        .padding(.horizontal)
                        .frame(width: 152, height: 54)
                        .background(
                            RoundedRectangle(cornerRadius: 12).fill(Color.init(red: 51/255, green: 55/255, blue: 73/255))
                        )
                        VStack{
                            Text("Sell")
                                .font(.system(size: 24, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal)
                        .frame(width: 152, height: 54)
                        .background(
                            RoundedRectangle(cornerRadius: 12).fill(Color.red)
                        )
                    }
                    
                    VStack{
                        VStack{
                            Text("Investment")
                                .foregroundStyle(.gray)
                                .font(.system(size: 12, weight: .bold))
                            
                            HStack{
                                Button {
                                    //
                                } label: {
                                    Image(systemName: "minus.circle")
                                }
                                
                                Text("1,000")
                                    .padding(.horizontal,5)
                                    .font(.system(size: 16, weight: .bold))
                                
                                Button {
                                    //
                                } label: {
                                    Image(systemName: "plus.circle")
                                }
                            }
                        }
                        .padding(.horizontal)
                        .frame(width: 152, height: 54)
                        .background(
                            RoundedRectangle(cornerRadius: 12).fill(Color.init(red: 51/255, green: 55/255, blue: 73/255))
                        )
                        
                        VStack(alignment: .leading){
                            Text("Buy")
                                .font(.system(size: 24, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.horizontal)
                        .frame(width: 152, height: 54)
                        .background(
                            RoundedRectangle(cornerRadius: 12).fill(Color.green)
                        )
                    }
                }
            }
        }
        .foregroundColor(.white)
        
    }
}

#Preview {
    NavigationPage()
}
