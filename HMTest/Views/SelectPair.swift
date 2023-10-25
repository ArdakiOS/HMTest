//
//  SelectPair.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 23.10.2023.
//

import SwiftUI

struct SelectPair: View {
    var pairs : [[String]] = [
        
        ["BTC/USD", "GBP/USD"],
        ["ETH/USD", "EUR/USD"],
        ["EUR/USD", "EUR/USD"],
        ["EUR/USD", "EUR/USD"],
        ["EUR/USD", "EUR/USD"],
        ["EUR/USD", "EUR/USD"],
        ["EUR/USD", "EUR/USD"]
        
    ]
    @Binding var selectedPair : String
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.init(red: 32/255, green: 35/255, blue: 47/255)
                .ignoresSafeArea()
            
            VStack {
                ZStack{
                    Text("Currency pair")
                        .foregroundStyle(.white)
                        .font(.system(size: 22, weight: .bold))
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding(.leading)
                    
                }
                .padding(.bottom, 25)
                VStack(spacing : 25){
                    ForEach(pairs, id: \.self){row in
                        HStack(spacing : 40){
                            ForEach(row, id:\.self){pair in
                                Text(pair)
                                    .frame(width: 140, height: 54)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12).fill(selectedPair == pair ? Color.green : Color.init(red: 51/255, green: 55/255, blue: 73/255))
                                    )
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14, weight: .bold))
                                    .onTapGesture {
                                        selectedPair = pair
                                    }
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    SelectPair(selectedPair: .constant("GBP/USD"))
}
