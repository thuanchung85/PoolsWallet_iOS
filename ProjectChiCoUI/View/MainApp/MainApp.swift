
import CoreImage
import CoreImage.CIFilterBuiltins
import Foundation
import SwiftUI
import UniformTypeIdentifiers

public struct MainApp: View {
   
    @Binding var walletAddress:String
    @Binding var walletName:String
    
    //==INIT==//
    public init(walletName:Binding<String>, walletAddress:Binding<String>) {
        self._walletAddress = walletAddress
        self._walletName = walletName
    }
    
    //==BODY==//
    public var body: some View{
      
            //Choose View
            VStack(alignment: .center) {
                //khu chưa các module view khác
                VStack{
                    Text(walletName)
                    Text(walletAddress)
                    Spacer()
                }
                
                //khu menu 4 nut bên dưới
                HStack(alignment: .bottom, spacing: 50){
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(height: 100)
                            .background(
                                Color.white // any non-transparent background
                                    .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                                    .mask(Rectangle().padding(.top, -20)) /// here!
                            )
                        
                        HStack(alignment: .bottom, spacing: 50){
                            Button(action: {
                                
                            }) {
                                VStack{
                                    Image("wallet")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    Text("Wallet")
                                        .font(.custom("Arial", size: 15))
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Button(action: {
                                
                            }) {
                                VStack{
                                    Image("market")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    Text("Market")
                                        .font(.custom("Arial", size: 15))
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Button(action: {
                                
                            }) {
                                VStack{
                                    Image("mining")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    Text("Mining")
                                        .font(.custom("Arial", size: 15))
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Button(action: {
                                
                            }) {
                                VStack{
                                    Image("setting")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    Text("Setting")
                                        .font(.custom("Arial", size: 15))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                
                
            }
           
            .onAppear(){
                walletName = UserDefaults.standard.string(forKey: "PoolsWallet_walletName") ?? ""
                walletAddress = UserDefaults.standard.string(forKey: "PoolsWallet_addressWallet") ?? ""
            }
        
        //
    }
    
    
    
    
}//end struct

