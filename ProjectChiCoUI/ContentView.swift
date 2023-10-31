//
//  ContentView.swift
//  ProjectChiCoUI
//
//  Created by SWEET HOME (^0^)!!! on 18/10/2023.
//

import SwiftUI
import GoiAPI1
import GoiAPI3

//import GoiAPI5

struct ContentView: View {
 
    
    //biến dùng để đánh dấu user đang chạy lần đầu hay là chưa có tạo ví
    @State var NeuApp_chay_lan_dau = true
    //biến này dùng để cho lần dùng app thứ 2 trở đi phải đăng nhập bằng passcode
    @State var isUserPass_PIN = false
    @State var isUserPass_PIN_login = false
    @State var pin = ""
    
    //biến ghi lại tên ví
    @State var walletName = ""
    
    //biến ghi lại dia chi ví
    @State var walletAddress = ""
    
    //biến nhận kết quả khi user tạo xong ví mới
    @State var  isUserPass_MakeNewWalletView = false
    
    
    //biến ghi nhận tình trạng user đã pass khôi phục ví
    @State var isUserPass_RecoveryWalletby12Seed = false
    
    
    //biến control slash screen
    @State var isShowSlashScreen_Done = false
    
    //========BODY=====///
    var body: some View {
        //hiện slash screen trước
        if(isShowSlashScreen_Done == false){
           
            SlashScreen(isShowSlashScreen_Done: $isShowSlashScreen_Done)
            
        }
        
        //Hiện main view sau khi slash screen chay xong
        if(isShowSlashScreen_Done == true) {
            VStack {
                
                //nếu app chạy lần đầu chưa tạo ví thì show tạo ví hoặc khôi phục ví
                if(NeuApp_chay_lan_dau == true)
                {
                    
                    if(isUserPass_MakeNewWalletView == false && isUserPass_RecoveryWalletby12Seed == false)
                    {
                        
                        //Create_Recover_WalletView
                        Create_Recover_WalletView(walletName: $walletName,walletAddress:$walletAddress,
                                                  isUserPass_MakeNewWalletView: $isUserPass_MakeNewWalletView,
                                                  isUserPass_RecoveryWalletby12Seed: $isUserPass_RecoveryWalletby12Seed)
                        .padding()
                        
                    }
                    
                    
                    
                    
                    //nếu user pass quá trình tạo ví mới
                    if(isUserPass_MakeNewWalletView == true)
                    {
                        MainApp(walletName: self.$walletName, walletAddress: self.$walletAddress).onAppear {
                            //save vao user default người dùng pass make ví mới
                            UserDefaults.standard.set("1", forKey: "isUserPass_MakeNewWalletView")
                            UserDefaults.standard.set(walletName, forKey: "walletName")
                        }
                        
                    }
                    //nếu user pass quá trình khoi phuc ví
                    if(isUserPass_RecoveryWalletby12Seed == true) {
                        MainApp(walletName: self.$walletName, walletAddress: self.$walletAddress).onAppear {
                            //save vào user default người dùng khôi phục ví mới xong
                            UserDefaults.standard.set("1", forKey: "isUserPass_RecoveryWalletby12Seed")
                            UserDefaults.standard.set(walletName, forKey: "walletName")
                        }
                    }
                    
                    
                }
                
                
                // nếu app chạy lần sau thì chỉ cần hỏi pass code
                if(NeuApp_chay_lan_dau == false){
                    if(isUserPass_PIN_login == false){
                        
                        PasscodeView_Login(textAskUserDo: "Enter your PIN number to log in",
                                           passwordSaved: self.pin,
                                           isUserPass_PIN_login: $isUserPass_PIN_login)
                        .padding()
                    }
                    else{
                        MainApp(walletName: self.$walletName, walletAddress: self.$walletAddress)
                    }
                    
                }
                
            }
            .onAppear(){
                //check coi user là lần đầu chạy hay chạy lại lần sau
                NeuApp_chay_lan_dau = true
                let isUserPass_RecoveryWalletby12Seed = UserDefaults.standard.integer(forKey: "isUserPass_RecoveryWalletby12Seed")
                let isUserPass_MakeNewWalletView = UserDefaults.standard.integer(forKey: "isUserPass_MakeNewWalletView")
                
                if( isUserPass_RecoveryWalletby12Seed == 1) || (isUserPass_MakeNewWalletView == 1){
                    NeuApp_chay_lan_dau = false
                    let n = UserDefaults.standard.string(forKey: "walletName")
                    print("user default walletName:",n!)
                    
                    let d = keychain_read_ForLogin(service: "PoolsWallet_KeyChain_PIN", account: n!)
                    print("mã pin là: ",String(decoding: d ?? Data(), as: UTF8.self))
                    
                    self.pin = String(decoding: d ?? Data(), as: UTF8.self)
                }
            }
            
        }
        
        
       
        
        
        
        
        
        
    }//end BODY
        
    
    
}//end struct



