//
//  BalanceView.swift
//  PoolsWallet_iOS
//
//  Created by SWEET HOME (^0^)!!! on 31/10/2023.
//


import SwiftUI
import UniformTypeIdentifiers
import GoiAPI1

public struct BalanceView: View {
    @Binding var walletAddress:String
    @Binding var walletName:String
    @State var pKey:String = ""
    
    //==BODY==//
    public var body: some View{
        VStack{
           
            ZStack(alignment: .top){
                    Image("Background")
                        .resizable()
                        .frame(height: 180)
                        .cornerRadius(10)
                        .padding(.horizontal,5)
                    
                //khu account và net work
                VStack(alignment: .center){
                        HStack{
                            //icon vào khu account
                            Image("Account")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35)
                                .padding(.leading,20)
                            
                            //khu tên ví và address rút gọn
                            VStack(alignment: .leading){
                                Text(walletName)
                                    .font(.custom("Arial Bold", size: 20))
                                    
                                Text(short_WalletAddress(s: walletAddress))
                                    .font(.custom("Arial", size: 15))
                            }.padding(.leading,10)
                            
                            
                            Spacer()
                            
                            //khu network
                            Text("Pools")
                                .frame(width:80)
                                .multilineTextAlignment(.center)
                                .font(.custom("Arial Bold", size: 15))
                                .scaledToFit()
                                .minimumScaleFactor(0.05)
                            //nút vào list view network
                            Button(action: {
                                          print("Circular Button tapped")
                                        }) {
                                            Image("PoolsNetworkLogo")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 35)
                                        }.padding(.trailing,15)
                            
                            
                            
                        }.padding(.top,20)
                       
                        //khu balance tiền $
                    HStack(alignment: .center){
                            
                            VStack{
                                Text("Total Balance")
                                    .font(.custom("Arial Bold", size: 20))
                                Text("0$")
                                    .font(.custom("Arial Bold", size: 40))
                            }
                            
                        }
                        .padding(.vertical,15)
                    }
               
              
                
                }
               
        }
      
       
    }//end body
    
}//end struct



///ham rút gọn đị chỉ ví thành 0x08...0000
func short_WalletAddress(s:String) -> String{
    if(s.isEmpty == false){
        let Arr = Array(s)
        let substring = "\(Arr[0])\(Arr[1])\(Arr[2])\(Arr[3])...\(Arr[Arr.count-4])\(Arr[Arr.count-3])\(Arr[Arr.count-2])\(Arr[Arr.count-1])"
        return substring
    }
    else{
        return ""
    }
}
