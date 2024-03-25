//
//  CryptoItem.swift
//  Assignment2
//
//  Created by Emily Coggins on 3/24/24.
//

import SwiftUI

struct CryptoItem: View {
    @StateObject var viewModel: CryptoConverterViewModel = CryptoConverterViewModel()

    @State private var amount: String = ""
    
    @State private var showKeypad: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                
                HStack {
                    Text("Bitcoin: ")
                    
                    TextField("", text: $amount)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .onTapGesture {
                            self.showKeypad.toggle()
                        }
                }
                
                List(viewModel.cryptos.indices, id: \.self) { index in
                    HStack {
                        Text(viewModel.cryptos[index].cryptoLabel)
                        Spacer()
                        
                        if let amountDouble = Double(amount) {
                            Text(String(format: "%.1f", viewModel.convertToUSD(cryptoName: viewModel.cryptos[index], amount: amountDouble)))
                        } else {
                            Text("Invalid Entry")
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            
            .navigationBarTitle("Bitcoin Conversion", displayMode: .inline)
            
            .onTapBackgroundToDismissKeyboard()
            
            if showKeypad {
                NumberPadView(value: $amount, showKeypad: $showKeypad)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

struct NumberPadView: View {
    
    @Binding var value: String
    @Binding var showKeypad: Bool
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        VStack {
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(1...9, id: \.self) { num in
                    NumberButton(number: "\(num)", value: $value)
                }
                
                ReturnButton(showKeypad: $showKeypad)
                
                NumberButton(number: "0", value: $value)
                
                DeleteButton(value: $value)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 20)
            .background(Color.gray.opacity(0.1))
            .frame(maxWidth: .infinity, alignment: .bottom)
        }
        .onTapGesture {
            showKeypad = false
        }
    }
}

struct NumberButton: View {
    let number: String
    @Binding var value: String
    
    var body: some View {
        Button(action: {
            value += "\(number)"
        }) {
            Text(number)
                .font(.title)
                .frame(width: 60, height: 60)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(30)
        }
    }
}

struct ReturnButton: View {
    @Binding var showKeypad: Bool
    
    var body: some View {
        Button(action: {
            showKeypad = false
        }) {
            Image(systemName: "return")
                .font(.title)
                .frame(width: 60, height: 60)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(30)
        }
    }
}

struct DeleteButton: View {
    @Binding var value: String
    
    var body: some View {
        Button(action: {
            if !value.isEmpty {
                value.removeLast()
            }
        }) {
            Image(systemName: "delete.left.fill")
                .font(.title)
                .frame(width: 60, height: 60)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(30)
        }
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TapBackgroundToDismissKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

extension View {
    func onTapBackgroundToDismissKeyboard() -> some View {
        self.modifier(TapBackgroundToDismissKeyboard())
    }
}

struct CryptoItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CryptoItem()
        }
    }
}

