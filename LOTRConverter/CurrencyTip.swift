//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Muhammad Fathy on 3/01/2025.
//


import Foundation
import TipKit

struct CurrencyTip:Tip {
    var title = Text ("Change Currency")
    var message: Text? = Text("You can tap the right or left currency to bring up the Select Currency screen.")
    
    
}
