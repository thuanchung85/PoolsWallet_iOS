//
//  WalletView.swift
//  PoolsWallet_iOS
//
//  Created by SWEET HOME (^0^)!!! on 31/10/2023.
//

import SwiftUI
import UniformTypeIdentifiers
import GoiAPI1

public struct WalletView: View {
    @Binding var walletAddress:String
    @Binding var walletName:String
    @State var pKey:String = ""
    //==BODY==//
    public var body: some View{
        Spacer()
        Text("WalletView")
        Text(walletAddress)
        Text(walletName)
        
        Text("pkey: \(pKey)").onAppear(){
            let d = keychain_read(service: "PoolsWallet_\(walletAddress)_PKey", account: walletAddress)
            pKey = String(decoding: d ?? Data(), as: UTF8.self)
             
        }
        Spacer()
    }//end body
    
}//end struct
