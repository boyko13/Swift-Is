//
//  ContentView.swift
//  Stoper
//
//  Created by Boyo on 15/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var secondsElapsed = 0
    @State private var timerRunning = false
    @State private var timer: Timer?
    
    var body: some View {
        
        
        ZStack{
            Color.gray.ignoresSafeArea()
            
            VStack{
                Spacer()
                
                    
                ZStack{
                    Circle()
                        .fill(Color.black).opacity(0.1)
                    
                        .frame(maxWidth: 300)
                        .padding(40)
                        
                    
                                                
                        
                        
                    Text(String(format: "%02d:%02d", secondsElapsed / 60, secondsElapsed % 60))
                        .font(.system(size: 90, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 90, weight: .bold))
                    
                }
                HStack(spacing: 20){
                    Button(action: start){
                        Text("Start")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 87)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.black))
                        }
                    Button(action: stop){
                        Text("Stop")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(5)
                            .frame(width: 90)
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.gray))
                            
                        
                    }
                    Button(action: restart){
                        Text("Restart")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 87)
                            .padding(7)
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.blue))
                            
                        
                    }
                    
                    
                    
                   
                    
                }
                
                .shadow(radius: 20)
                .padding(100)
                
                Spacer()
                
            }
            
            
        }
        
        
        
    }
    func start(){
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
            if timerRunning{
                secondsElapsed += 1
            }
            
        }
    }
    func stop(){
        timerRunning = false
        timer?.invalidate()
    }
    func restart(){
        timerRunning = false
        timer?.invalidate()
        secondsElapsed = 0
    }
    
   
}
    
#Preview {
    ContentView()
}
