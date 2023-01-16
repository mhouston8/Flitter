//
//  ContentView.swift
//  Twitter
//
//  Created by Matthew Houston on 1/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
            
            ZStack(alignment: .topLeading) {
                MainTabView()
                    .navigationBarHidden(showMenu)
                    
                if showMenu {
                    ZStack {
                        Color.black
                            .opacity(showMenu ? 0.25 : 0.0)
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    showMenu = false
                                }
                            }
                    }
                    .ignoresSafeArea()
                }
                
                SideMenuView()
                    .frame(width: 300)
                    .background(Color.white)
                    .offset(x: showMenu ? 0 : -300)
                    
            }
            .navigationTitle(Text("Home"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        Circle()
                            .frame(width: 32, height: 32)
                    }
                }
            }
            .onAppear {
                showMenu = false
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
                
            if showMenu {
                ZStack {
                    Color.black
                        .opacity(showMenu ? 0.25 : 0.0)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                showMenu = false
                            }
                        }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .background(Color.white)
                .offset(x: showMenu ? 0 : -300)
                
        }
        .navigationTitle(Text("Home"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
}
