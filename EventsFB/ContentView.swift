//
//  ContentView.swift
//  EventsFB
//
//  Created by Igor Kononov on 20.12.2022.
//

import SwiftUI
import FBSDKLoginKit

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
    
    @AppStorage("logged") var logged = false
    @AppStorage("email") var email = "your email"
    @State var manager = LoginManager()

    var body: some View {
        VStack {
            
            Button {
                if logged {
                    manager.logOut()
                    email = ""
                    logged = false
                } else {
                    manager.logIn(permissions: ["public_profile", "email"], from: nil) { (result, err) in
                        
                        if err != nil {
                            print(err!.localizedDescription)
                            return
                        }
                        logged = true
                        let request = GraphRequest(graphPath: "me", parameters: ["fields": "email"])
                        request.start { (_, res, _) in
                            guard let profileData = res as? [String: Any] else { return }
                            
                            email = profileData["email"] as? String ?? "email"
                        }
                    }
                }
            } label: {
                Text(logged ? "logOut" : "FB login")
                    .foregroundColor(.blue)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
            }
            Text(email)
                .fontWeight(.bold)
                .font(.title3)

        }
    }
}
