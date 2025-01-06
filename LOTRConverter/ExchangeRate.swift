//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Muhammad Fathy on 12/12/2024.
//


import SwiftUI


struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            Text(text)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            
            
            
            
        }
    }
}
#Preview {
    ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 1 Silver Pennies", rightImage: .silverpenny)
}
