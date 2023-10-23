//
//  Top.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 23.10.2023.
//

import SwiftUI

struct Top: View {
    @State var rows : [TopModel] = [
        TopModel.init(pos: "№", country: "Country", name: "Name", deposit: "Deposit", profit: "Profit"),
        TopModel.init(pos: "1", country: "usa", name: "Oliver", deposit: "$9999", profit: "$9999"),
        TopModel.init(pos: "2", country: "canada", name: "Jack", deposit: "$8888", profit: "$8888"),
        TopModel.init(pos: "3", country: "brazil", name: "Harry", deposit: "$7777", profit: "$7777"),
        TopModel.init(pos: "4", country: "south-korea", name: "Jacob", deposit: "$6666", profit: "$6666"),
        TopModel.init(pos: "5", country: "germany", name: "Charley", deposit: "$5555", profit: "$5555"),
        TopModel.init(pos: "6", country: "brazil", name: "Thomas", deposit: "$4444", profit: "$4444"),
        TopModel.init(pos: "7", country: "france", name: "George", deposit: "$3333", profit: "$3333"),
        TopModel.init(pos: "8", country: "new-zealand", name: "Oscar", deposit: "$2222", profit: "$2222"),
        TopModel.init(pos: "9", country: "india", name: "James", deposit: "$1111", profit: "$1111"),
        TopModel.init(pos: "10", country: "spain", name: "William", deposit: "$111", profit: "$111")
    ]
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color.init(red: 32/255, green: 35/255, blue: 47/255)
                .ignoresSafeArea()
            VStack(spacing: 5){
                Text("TOP 10 Traders")
                    .foregroundStyle(.white)
                    .font(.system(size: 22, weight: .bold))
                
                VStack(spacing:0){
                    ForEach(rows, id: \.self){row in
                        TopPageRow(row: row)
                    }
                }
                .clipShape(
                    RoundedRectangle(cornerRadius: 8.75)
                )
                .padding()
            }
            .padding(.top)
            .onReceive(timer, perform: { _ in
                let index = Int.random(in: 1...10)
                let numericDeposit = Int(rows[index].deposit.dropFirst())
                let newValDeposit = (numericDeposit ?? 0) + Int.random(in: 50...150)
                let newDeposit  = "$" + String(newValDeposit)
                rows[index].deposit = newDeposit
                
                let numericProfit = Int(rows[index].deposit.dropFirst())
                let newValProfit = (numericProfit ?? 0) + Int.random(in: 50...150)
                let newProfit  = "$" + String(newValProfit)
                rows[index].profit = newProfit
            })
                
        }
    }
}

#Preview {
    Top()
}
