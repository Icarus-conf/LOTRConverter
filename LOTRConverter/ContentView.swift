//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Muhammad Fathy on 12/12/2024.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftAmmount = ""
    @State var rightAmount = ""
    @FocusState var leftTyping
    @FocusState var rightTyping
    @State var leftCurrency:Currency = .silverPiece
    @State var rightCurrency:Currency = .goldPiece
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                HStack {
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        TextField("Amount", text: $leftAmmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            .padding()
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    VStack {
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:33)
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()}
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                            .padding()
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label:{
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
              
            }
      
            
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of:rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmmount, to: rightCurrency)}
        
        .onChange(of:leftCurrency){
            leftAmmount = rightCurrency.convert(rightAmount, to: leftCurrency)}
        
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmmount = rightCurrency.convert(rightAmount, to: leftCurrency)}}
        .onChange(of: leftAmmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmmount, to: rightCurrency)}}
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()}
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency( topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)}
    }
}

#Preview {
    ContentView()
}



