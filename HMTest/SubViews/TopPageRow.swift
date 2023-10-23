//
//  TopPageRow.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 23.10.2023.
//

import SwiftUI

struct TopPageRow: View {
    @State var row : TopModel
    var body: some View {
        ZStack{
            if row.pos != "№"{
                if Int(row.pos)!%2 == 0{
                    Color.init(red: 46/255, green: 48/255, blue: 62/255)
                }
            }
            else if row.pos == "№"{
                Color.init(red: 46/255, green: 48/255, blue: 62/255)
            }
            HStack(spacing:20){
                Text(row.pos)
                    .frame(maxWidth: 19, alignment: .leading)
                
                if row.country == "Country"{
                    Text("Country")
                        .frame(maxWidth: 61)
                }
                else{
                    HStack{
                        Image(row.country)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 26, height: 26)
                    }
                    .frame(maxWidth: 68, alignment: .leading)
                }
                
                Text(row.name)
                    .frame(maxWidth: 68, alignment: .leading)
                
                Text(row.deposit)
                    .frame(maxWidth: 73, alignment: .leading)
                Text(row.profit)
                    .frame(maxWidth: 53, alignment: .leading)
                    .foregroundStyle(.green)
            }
            .padding(.leading)
            .font(.system(size: 14))
            .frame(width: 351, height: 50)
        }
        .foregroundColor(.white)
        
    }
}
