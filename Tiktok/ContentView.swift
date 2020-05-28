//
//  ContentView.swift
//  Tiktok
//
//  Created by Daval Cato on 5/28/20.
//  Copyright © 2020 Daval Cato. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var index = 0
    
    var body: some View{
        
        ZStack{
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Button(action: {
                        
                        
                    }) {
                        
                        Image("home")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 0 ? .white : Color.white.opacity(0.35))
                        
                    }
                    
                }
            }
        }
    }
}
