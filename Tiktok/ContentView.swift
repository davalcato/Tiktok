//
//  ContentView.swift
//  Tiktok
//
//  Created by Daval Cato on 5/28/20.
//  Copyright © 2020 Daval Cato. All rights reserved.
//

import SwiftUI
import AVKit

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
    @State var data = [
    
            Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: "mp4")!)), replay: false),
            Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: "mp4")!)), replay: false),
            Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mov")!)), replay: false),
            Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)), replay: false),
            Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mov")!)), replay: false),
            Video(id: 5, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video6", ofType: "mp4")!)), replay: false),
        
    ]
    
    var body: some View{
        
        ZStack{
            
            PlayerScrollView(data: self.$data)
            
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
                
                // All edges are ignored here...
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 5)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct PlayerView : View {
    
    @Binding var data : [Video]
    
    var body: some View{
        
        VStack(spacing: 0){
            
            ForEach(self.data){i in
                
                Player(player: i.player)
                    // Added full screen size here because pagination will be added...
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }
        }
    }
}

struct Player : UIViewControllerRepresentable {
    
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
        
    }
}

class Host: UIHostingController<ContentView> {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
    
}

// This is the video area...

struct Video : Identifiable {
    
    var id : Int
    var player : AVPlayer
    var replay : Bool
}

struct PlayerScrollView : UIViewRepresentable {
    
    @Binding var data : [Video]
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let view = UIScrollView()
        
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        
        
        // Each of the childViews covers a full screen
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        // The same applies to these childViews...
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        // This is to ignore any safe area...
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        
    }
    
}
