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
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var index = 0
    @State var top = 0
    
    var body: some View{
        
        ZStack{
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                        self.top = 0
                        
                    }) {
                        
                        Text("Following")
                            .foregroundColor(self.top == 0 ? .white : Color.white.opacity(0.45))
                            .fontWeight(self.top == 0 ? .bold : .none)
                            .padding(.vertical)
                        
                    }
                    
                    Button(action: {
                        
                        self.top = 1
                        
                    }) {
                        
                        Text("For You")
                            .foregroundColor(self.top == 0 ? .white : Color.white.opacity(0.45))
                            .fontWeight(self.top == 1 ? .bold : .none)
                            .padding(.vertical)
                    }
                    
                }
                
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    VStack(spacing: 35){
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("pic")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                        }
                        
                        Button(action: {
                            
                            
                        }) {
                            
                            VStack(spacing: 8){
                                
                                Image(systemName: "suit.heart.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                
                                Text("44K")
                                .foregroundColor(.white)
                            }
                        }
                        
                        Button(action: {
                            
                            
                        }) {
                            
                            VStack(spacing: 8){
                                
                                Image(systemName: "message.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                
                                Text("1201")
                                .foregroundColor(.white)
                            }
                        }
                        
                        Button(action: {
                            
                            
                        }) {
                            
                            VStack(spacing: 8){
                                
                                Image(systemName: "arrowshape.turn.up.right.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                
                                Text("Share")
                                .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.bottom, 55)
                    .padding(.trailing)
                    
                }
                
                HStack(spacing: 0){
                    
                    Button(action: {
                        
                        self.index = 0
                        
                    }) {
                        
                        Image("home")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 0 ? .white : Color.white.opacity(0.35))
                        .padding(.horizontal)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        self.index = 1
                        
                    }) {
                        
                        Image("search")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.35))
                        .padding(.horizontal)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("upload")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 50, height: 35)
                        .padding(.horizontal)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        self.index = 2
                        
                    }) {
                        
                        Image("comment")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.35))
                        .padding(.horizontal)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        self.index = 3
                        
                    }) {
                        
                        Image("profile")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 3 ? .white : Color.white.opacity(0.35))
                        .padding(.horizontal)
                        
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        
    }
}

class Host: UIHostingController<ContentView> {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
    
}
