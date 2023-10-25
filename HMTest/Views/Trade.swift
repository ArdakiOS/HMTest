//
//  Trade.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 23.10.2023.
//

import SwiftUI
import Combine

struct Trade: View {
    @State var selectedPair = "GBP/USD"
    @State var investment = "1000"
    @State var time = "00:01"
    
    @State var balance = "10000"
    
    @State private var showBuyAlert = false
    @State private var showSellAlert = false
    
    @State private var keyboardHeight: CGFloat = 0
    
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
                    Text(balance)
                        .font(.system(size: 16, weight: .bold))
                    
                }
                .frame(width: 315, height: 54)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(Color.init(red: 51/255, green: 55/255, blue: 73/255))
                )
                
                WebView(pair: selectedPair.replacingOccurrences(of: "/", with: ""))
                    .frame(height: 370)
                
                VStack{
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
                                        changeTimer(add: false)
                                    } label: {
                                        Image(systemName: "minus.circle")
                                    }
                                    
                                    TextField("", text: $time)
                                        .keyboardType(.numberPad)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 16, weight: .bold))
                                        .onChange(of: time) { oldValue, newValue in
                                            if newValue.count > 5 {
                                                time = String(newValue.prefix(5))
                                                
                                            }
                                            if oldValue < newValue{
                                                if newValue.count == 4 {
                                                    validateTime()
                                                }
                                            }
                                            // Validate and format the entered time
                                            
                                            
                                        }
                                    
                                    Button {
                                        changeTimer(add: true)
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
                            
                            Button {
                                var numBal = Int(balance) ?? 0
                                let numInv = Int(investment) ?? 0
                                numBal += numInv
                                balance = String(numBal)
                                showSellAlert = true
                                
                            } label: {
                                Text("Sell")
                                    .font(.system(size: 24, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                    .frame(width: 152, height: 54)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12).fill(Color.red)
                                    )
                            }
                        }
                        .alert(isPresented: $showSellAlert) {
                            Alert(
                                title: Text("Successfully sold"),
                                message: Text("You have sold \(investment) amount"),
                                dismissButton: . default(Text("Ok"))
                            )
                        }
                        
                        VStack{
                            VStack{
                                Text("Investment")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12, weight: .bold))
                                
                                HStack{
                                    Button {
                                        changeInvestment(add: false)
                                    } label: {
                                        Image(systemName: "minus.circle")
                                    }
                                    
                                    TextField("", text: $investment)
                                        .keyboardType(.numberPad)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 16, weight: .bold))
                                    
                                    Button {
                                        changeInvestment(add: true)
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
                            
                            Button {
                                var numBal = Int(balance) ?? 0
                                let numInv = Int(investment) ?? 0
                                let temp = Double(numInv)
                                numBal -= numInv
                                balance = String(numBal)
                                showBuyAlert = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                                    print("DODOEDOEOD")
                                    let chance = Int.random(in: 0...1)
                                    if chance == 0{
                                        numBal += Int(temp * 0.7)
                                    }
                                    else {
                                        numBal += Int(temp * 0.3)
                                    }
                                    
                                    balance = String(numBal)
                                }
                                
                            } label: {
                                Text("Buy")
                                    .font(.system(size: 24, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                    .frame(width: 152, height: 54)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12).fill(Color.green)
                                    )
                            }
                        }
                        .alert(isPresented: $showBuyAlert) {
                            Alert(
                                title: Text("Successfully bought"),
                                message: Text("You have bought \(selectedPair) for \(investment) amount"),
                                dismissButton: . default(Text("Ok"))
                            )
                        }
                    }
                }
                .padding(.bottom, keyboardHeight)
                .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
        .foregroundColor(.white)
        
    }
    
    func makeFormattedString (num : String){
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US")
        investment = formatter.string(from: NSNumber(value: Int(num)!)) ?? ""
    }
    
    func changeTimer(add : Bool) {
        let components = time.components(separatedBy: ":")
        
        if components.count == 2,
           var minutes = Int(components[0]),
           var seconds = Int(components[1]) {
            
            
            
            if add{
                seconds += 1
            }
            else {
                if seconds > 0{
                    seconds -= 1
                }
            }
            
            if seconds >= 60 {
                seconds = 0
                minutes += 1
            }
            
            time = String(format: "%02d:%02d", minutes, seconds)
        }
        
    }
    
    func changeInvestment(add : Bool){
        var numericVal = Int(investment) ?? 0
        
        if add {
            
            numericVal += 100
            
        }
        else {
            numericVal -= 100
        }
        
        if numericVal > Int(balance) ?? 0{
            numericVal = Int(balance) ?? 0
        }
        investment = String(numericVal)
    }
    
    func validateTime() {
        let index = time.index(time.startIndex, offsetBy: 2)
        time.insert(":", at: index)
        
        let components = time.components(separatedBy: ":")
        
        if components.count == 2,
           var minutes = Int(components[0]),
           var seconds = Int(components[1]) {
            if seconds >= 60 {
                seconds = 0
                minutes += 1
            }
            
            if minutes >= 60 {
                minutes = 59
                seconds = 59
            }
            
            time = String(format: "%02d:%02d", minutes, seconds)
        }
    }
}

#Preview {
    NavigationPage()
}
