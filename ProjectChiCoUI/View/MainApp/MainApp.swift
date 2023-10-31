
import CoreImage
import CoreImage.CIFilterBuiltins
import Foundation
import SwiftUI
import UniformTypeIdentifiers

public struct MainApp: View {
   
    @Binding var walletAddress:String
    @Binding var walletName:String
    
    @State var currentChoose = 1
    
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
                HStack(){
                    ZStack{
                        Rectangle()
                            .fill(.white)
                            .frame(height: 70)
                            .background(
                                Color.white // any non-transparent background
                                    .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
                                    .mask(Rectangle().padding(.top, -20)) /// here!
                            )
                        
                        HStack(alignment: .bottom, spacing: 60){
                            Button(action: {
                                currentChoose = 1
                            }) {
                                if(self.currentChoose == 1){
                                    VStack{
                                        Image("wallet")
                                            .renderingMode(.template)
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.green)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                            
                                        Text("Wallet")
                                            .font(.custom("Arial", size: 12))
                                            .foregroundColor(.green)
                                    }
                                }
                                else{
                                    VStack{
                                        Image("wallet")
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                            .foregroundColor(.gray)
                                        Text("Wallet")
                                            .font(.custom("Arial", size: 12))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            
                            Button(action: {
                                currentChoose = 2
                            }) {
                                if(self.currentChoose == 2){
                                    VStack{
                                        Image("market")
                                            .renderingMode(.template)
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.green)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                            
                                        Text("Market")
                                            .font(.custom("Arial", size: 12))
                                            .foregroundColor(.green)
                                    }
                                }
                                else{
                                    VStack{
                                        Image("market")
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                            .foregroundColor(.gray)
                                        Text("Market")
                                            .font(.custom("Arial", size: 12))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            
                            Button(action: {
                                currentChoose = 3
                            }) {
                                if(self.currentChoose == 3){
                                    VStack{
                                        Image("mining")
                                            .renderingMode(.template)
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.green)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                           
                                        Text("Mining")
                                            .font(.custom("Arial", size: 12))
                                            .foregroundColor(.green)
                                    }
                                }else{
                                    VStack{
                                        Image("mining")
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                            .foregroundColor(.gray)
                                        Text("Mining")
                                            .font(.custom("Arial", size: 12))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            
                            Button(action: {
                                currentChoose = 4
                            }) {
                                if(self.currentChoose == 4){
                                    VStack{
                                        Image("setting")
                                            .renderingMode(.template)
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.green)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                           
                                        Text("Setting")
                                            .font(.custom("Arial", size: 12))
                                            .foregroundColor(.green)
                                    }
                                }
                                else{
                                    VStack{
                                        Image("setting")
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                            .foregroundColor(.gray)
                                        Text("Setting")
                                            .font(.custom("Arial", size: 12))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                }
               
                
                
            }
           
            .onAppear(){
                walletName = UserDefaults.standard.string(forKey: "PoolsWallet_walletName") ?? ""
                walletAddress = UserDefaults.standard.string(forKey: "PoolsWallet_addressWallet") ?? ""
            }
        
        //
    }
    
    
    
    
}//end struct

