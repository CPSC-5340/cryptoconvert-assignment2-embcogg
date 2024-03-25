//
//  CurrencyItem.swift
//  Assignment2
//
//  Created by Emily Coggins on 3/24/24.
//

import SwiftUI

struct CurrencyItem: View {
    
    var card : ConvertModel<CurrencyItemModel>
    
    var body: some View {
        if card.isFront {
            FrontCurrencyItem(card: card.cardContent)
        } else {
            BackCurrencyItem(card: card.cardContent)
        }
    }
}

struct CurrencyItem_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyItem(card: ConvertModel(cardContent: CurrencyItemModel(currencyName: "", currencyCode: "", countryFlag: "", multiplier: 1)))
    }
}

struct FrontCurrencyItem: View {
    
    var card: CurrencyItemModel
    
    var body: some View {
        VStack {
            HStack{
                Text(card.countryFlag)
                Spacer()
            }
            HStack{
                Text(card.currencyCode)
                Spacer()
            }
        }
        .frame(width: 130, height: 130)
        .padding()
        .background(.blue)
    }
}

struct BackCurrencyItem: View {
    
    var card: CurrencyItemModel

    var body: some View {
        VStack {
            HStack{
                Text(card.currencyName)
                Spacer()
            }
            HStack{
                Text(String(card.multiplier))
                Spacer()
            }
        }
        .frame(width: 130, height: 130)
        .padding()
        .background(.blue)
    }
}
