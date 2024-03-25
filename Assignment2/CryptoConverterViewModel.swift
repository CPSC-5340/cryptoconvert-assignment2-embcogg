//
//  CryptoConverterViewModel.swift
//  Assignment2
//
//  Created by Emily Coggins on 3/24/24.
//

import Foundation

class CryptoConverterViewModel: ObservableObject {
    
    struct Crypto {
        let cryptoName: String
        let cryptoLabel: String // The display name or label for the cryptocurrency
        let priceInUSD: Double
    }
    
    @Published var cryptos: [Crypto] = [
        Crypto(cryptoName: "Bitcoin", cryptoLabel: "US Dollar", priceInUSD: 23450),
        Crypto(cryptoName: "Ethereum", cryptoLabel: "Ethereum", priceInUSD: 14.3),
        Crypto(cryptoName: "Tether", cryptoLabel: "Tether", priceInUSD: 23450.0),
        Crypto(cryptoName: "BNB", cryptoLabel: "BNB", priceInUSD: 77.2),
        Crypto(cryptoName: "USD Coin", cryptoLabel: "USD Coin", priceInUSD: 23454),
        Crypto(cryptoName: "XRP", cryptoLabel: "XRP", priceInUSD: 62113),
    ]
    
    // function to take crypto amount & convert to $ USD
    func convertToUSD(cryptoName: Crypto, amount: Double) -> Double {
        return amount * cryptoName.priceInUSD
    }
}
