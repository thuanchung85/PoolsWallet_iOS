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
        VStack{
            BalanceView(walletAddress: $walletAddress, walletName: $walletName)
               
               
        }
        Spacer()
       
    }//end body
    
}//end struct






