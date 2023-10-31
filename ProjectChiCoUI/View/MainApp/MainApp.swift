
import CoreImage
import CoreImage.CIFilterBuiltins
import Foundation
import SwiftUI
import UniformTypeIdentifiers

public struct MainApp: View {
   
    @Binding var walletAddress:String
    @Binding var walletName:String
    
    public init(walletName:Binding<String>, walletAddress:Binding<String>) {
        self._walletAddress = walletAddress
        self._walletName = walletName
    }
    
    public var body: some View{
      
            //Choose View
            VStack(alignment: .center) {
                Text(walletName)
                Text(walletAddress)
            }
            .padding(.bottom,50)
            .onAppear(){
                walletName = UserDefaults.standard.string(forKey: "PoolsWallet_walletName") ?? ""
                walletAddress = UserDefaults.standard.string(forKey: "PoolsWallet_addressWallet") ?? ""
            }
        
        //
    }
    
    
    
    
}//end struct

