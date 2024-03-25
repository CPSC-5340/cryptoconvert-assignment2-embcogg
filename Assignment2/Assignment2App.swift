//
// Assignment2App.swift : Assignment2
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

@main
struct Assignment2App: App {
    var body: some Scene {
        WindowGroup {
            ConversionAppHomeView()
        }
    }
}

//@main
struct ConversionAppHomeView: View {
    var body: some View {
        
        NavigationView {
            
            List {
                // Currency Converter()
                NavigationLink("World Currency Exchange", destination: Converter())
                
                // Crypto CryptoConverter()
                NavigationLink("Crypto Exchange Details", destination: CryptoItem())
            }
            
            
            // App Title
            .navigationBarTitle("Conversion App", displayMode: .large)
            
        }
    }
}
            
// Preview
struct ConversionAppHomeView_Previews: PreviewProvider {
    static var previews: some View {
        // NavigationView {
        ConversionAppHomeView()
    }
}
