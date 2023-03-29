//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Sabih Haris on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        
        
        NavigationView {
            
            ZStack(alignment: .center) {
                ScrollView {
                    
                    VStack(alignment: .center) {
                        
                        
                        TextField("Username", text: $viewModel.userEmail)
                            .padding()
                            .foregroundColor(Color.black)
                            .background(Color(.white))
                            .cornerRadius(4.0)
                            .frame(maxHeight: 50)
                        //email : codecat15@gmail.com
                        
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .foregroundColor(Color.black)
                            .background(Color(.white))
                            .cornerRadius(4.0)
                            .frame(minHeight: 50)
                        //password : 1234
                        
                        
                        NavigationLink(destination: HomeTabView(), isActive: $viewModel.navigate) {
                            Button {
                                if viewModel.validatesInputValues() {
                                    print("Validate successfully")
                                    viewModel.authnticateUser()
                                }
                                
                                
                            } label: {
                                Text("Login")
                                
                            }.alert(isPresented: $viewModel.isPresentingErrorAlert) {
                                Alert(title: Text("Alert"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("Got it!")))
                            }
                            .frame(minWidth: 20, maxWidth: 150, minHeight: 60,maxHeight: 60)
                            .tint(Color.blue)
                            .background(Color.white)
                            .cornerRadius(4.0)
                            
                        }
                        
                        
                        
                    }.padding(.top,50)
                    
                }.padding()
                    .frame(maxHeight: .infinity)
                
            }
            
            .ignoresSafeArea()
            .background(Color.gray)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
