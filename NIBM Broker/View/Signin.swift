//
//  Signin.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-02.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    var isSignIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error ==  nil else{
                return
            }
            //Success
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error ==  nil else{
                return
            }
            //Success
        }
    }
}

struct Signin: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        NavigationView {
            VStack{
                VStack (alignment: .center, spacing: 5){
                    Text("NIBM Broker")
                        .foregroundColor(Color.blue)
                        .font(Font.custom("Noteworthy", size: 30))
                        .bold()
                        .padding()
                
                    Text("Sign in to continue")
                        .foregroundColor(Color.black)
                        .font(Font.custom("papyrus", size: 20))
                        .bold()
                        .padding()
  
                VStack (alignment: .leading, spacing: 15) {
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(15)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(15)
                    
                    HStack(alignment: .center, spacing: 5) {
                        Button(action: {
                            
                        }, label: {
                            Text("Login")
                                .font(Font.custom("Vardana", size: 25))
                                .foregroundColor(Color.cyan)
                                .frame(width: 145, height: 50)
                                .background(Color.white)
                               // .padding()
                        })
                            .cornerRadius(25)
                        //.padding()
                        
                        NavigationLink(destination: SginUpView(),
                                       label: {
                                           Text("Register")
                                               .font(Font.custom("Vardana", size: 25))
                                               .foregroundColor(Color.white)
                                               .frame(width: 145, height: 50)
                                               .background(Color.cyan)
                                               .cornerRadius(25)
                                              // .padding()
                                       })
    //                        .navigationBarHidden(true)
                    }
                    .padding()
                    
                }
                .autocapitalization(.none)
                //.padding([.leading, .trailing], 27.5)
                .padding()
                
               
                HStack(alignment: .center, spacing: 5){
                label: do {
                        Text("Forget Your Password")
                            .font(Font.custom("Vardana", size: 20))
                            .foregroundColor(Color.white)
                    }
//                    Button(action: {
//
//                    }, label: {
//                        Text("Click Here!")
//                            .font(Font.custom("Vardana", size: 20))
//                            .foregroundColor(Color.blue)
//                    })
                    NavigationLink(destination: ForgotPaswordView(), label: {
                        Text("Click Here!")
                            .font(Font.custom("Vardana", size: 20))
                            .foregroundColor(Color.blue)
                    })
                }
                }
                .padding()
                
                Spacer()
                
                Divider()
                    
                Button(action: {
                    
                },label: {
                        Text("Term & Privacy Policy")
                            .font(Font.custom("Vardana", size: 15))
                            .foregroundColor(Color.white)
                    })
                    .padding()
                
            }
            .background(
              LinearGradient(gradient: Gradient(colors: [.white, .cyan]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
    
        }
        //.padding(.top, 100.0)
      
    }
    
}

struct Signin_Previews: PreviewProvider {
    static var previews: some View {
        Signin()
.previewInterfaceOrientation(.portrait)
    }
}
