//
//  SlashScreen.swift
//  PoolsWallet_iOS
//
//  Created by SWEET HOME (^0^)!!! on 31/10/2023.
//

import Foundation
import SwiftUI

struct SlashScreen: View {
    @Binding var isShowSlashScreen_Done:Bool
    
    //==INIT==//
    init(isShowSlashScreen_Done: Binding<Bool>) {
        self._isShowSlashScreen_Done = isShowSlashScreen_Done
    }
    
    //========BODY=====///
    var body: some View {
        
        VStack(alignment: .center){
            Spacer()
            HStack{
                Spacer()
                Image("SlashScreenLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                       .frame(width: 200)
                    .scaledToFit()
                    .padding(.vertical,50)
                    .padding(.horizontal,50)
                Spacer()
            }
            Spacer()
            HStack{
                ZStack{
                    Image("SlashScreenBottom")
                        .resizable()
                        .scaledToFill()
                    VStack{
                        Spacer()
                        VStack{
                            if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                                Text("Version " +  version)
                                    .font(.custom("Arial ", size: 15))
                                    .foregroundColor(.gray)
                            }
                            
                            Text("All rights reserved")
                                .font(.custom("Arial ", size: 15))
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom,55)
                    }
                }
            }
        }
        .onAppear(){
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                        withAnimation {
                            self.isShowSlashScreen_Done = true
                        }
                    }
        }
    }//end body
    
    
}//end struct
