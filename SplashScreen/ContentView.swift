//
//  ContentView.swift
//  SplashScreen
//
//  Created by 亚飞 on 2021/1/25.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
        
        SplashScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SplashScreen : View {
    
    @State var show = false
    
    //login detail
    @State var phNo = ""
    var body: some View {
        
        VStack {
            
            ZStack {
                
                Color("bg")
                    .ignoresSafeArea()
                
                VStack {
                   
                    AnimatedView(show: $show)
                        .frame(height:screen.height / 2)
                    
                    VStack {
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                Text("Login")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Text("Enter your phone number to continue")
                                    .foregroundColor(.gray)
                            })
                            Spacer(minLength: 15)
                        }
                        
                        VStack {
                            
                            HStack(spacing: 15) {

                                Text("+1")
                                    .foregroundColor(.black)

                                Rectangle()
                                    .fill(Color("bg"))
                                    .frame(width: 1, height: 18)

                                TextField("", text: $phNo)
                                    .background(Color.white)
//                                    .frame(width: screen.width / 2)
                            }
                            
                            Divider()
                                .background(Color("bg"))
                        }
                        .padding(.vertical)
                        
                        Button(action: {}, label: {
                            Text("Verify Your Number")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: screen.width - 60)
                                .background(Color("bg"))
                                .clipShape(Capsule())
                        })
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                    .frame(height: show ? nil : 0)
                    .opacity(show ? 1 : 0)
                }
                .frame(width: screen.width)
            }
        }
    }
}

// Animationed View

struct AnimatedView : UIViewRepresentable {
    
    @Binding var show : Bool
    
    func makeUIView(context: Context) -> AnimationView{
        
        let view = AnimationView(name: "splash", bundle: Bundle.main)
        
//        view.play()
        // on Complete ....
        view.play { (status) in
            
            if status {
                
                // toggling view ......
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
                    show.toggle()
                }
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
    
}






var screen = UIScreen.main.bounds
