
import CoreImage
import CoreImage.CIFilterBuiltins
import Foundation
import SwiftUI
import UniformTypeIdentifiers
import GoiAPI1
import GoiAPI4

public struct Create_Recover_WalletView: View {
   
    @Binding var walletName:String
   
    @Binding var isUserPass_RecoveryWalletby12Seed:Bool
   
    @Binding var isUserPass_MakeNewWalletView:Bool
    
  
    
    @State var isShow_CreateNewWallet_View = false
    
    @State var isShow_RecoveryWallet_View = false
    
    
    //=====INIT=======//
    public init(walletName: Binding<String>,
                isUserPass_MakeNewWalletView:Binding<Bool>, isUserPass_RecoveryWalletby12Seed:Binding<Bool>) {
        self._walletName = walletName
       
        self._isUserPass_RecoveryWalletby12Seed = isUserPass_RecoveryWalletby12Seed
        self._isUserPass_MakeNewWalletView = isUserPass_MakeNewWalletView
        
    }
    
    //==BODY===/
    public var body: some View {
            
        
        //mới vô show 2 nút
        if(self.isShow_CreateNewWallet_View == false && self.isShow_RecoveryWallet_View == false)
        {
            //Choose View
            VStack(alignment: .center) {
                Image("TopBanner1").padding(.bottom,25)
                
                Text("ALL in One Dapp")
                    .font(.custom("Times New Roman Bold", size: 35))
                    .scaledToFit()
                    .minimumScaleFactor(0.05)
                    .padding(.bottom,10)
                
                Text("Store and protect all your decentralized assets within a Dapp")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                Spacer()
                //===nút đi tới create new wallet view của gói API 1===//
                Button(action: {
                    self.isShow_CreateNewWallet_View = true
                }) {
                    Text("Create a new Wallet")
                        .padding()
                        .foregroundColor(.white)
                }
                .background(Color.green)
                .cornerRadius(30)
                
                
                //===nút đi tới recovery wallet view của gói API 4===//
                
                Button(action: {
                    //call PasscodeView_ConfirmPIN
                    self.isShow_RecoveryWallet_View = true
                }) {
                    VStack {
                        Text("Import Wallet")
                            .padding()
                            .foregroundColor(.black)
                    }
                    .padding(5)
                }
               
          
            }
            .padding(.bottom,50)
        }
        
        
        
        //nếu user bấm nút Create New Wallet thì vào view Create New Wallet
        if(self.isShow_CreateNewWallet_View == true)
        {
            CreateNewWallet_View(walletName: $walletName,
                                 isUserPass_MakeNewWalletView: $isUserPass_MakeNewWalletView)
          
        }
        
        //nếu user bấm nút Recovery Wallet thì vào view Recovery Wallet
        if (self.isShow_RecoveryWallet_View == true){
            RecoverWallet_View(isUserPassRecoveryWalletby12Seed: $isUserPass_RecoveryWalletby12Seed,
                               wallNewName: $walletName)
        }
        
        
        
        
        }//end body
        
}//end struct

