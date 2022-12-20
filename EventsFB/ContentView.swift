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
    @ObservedObject var viewModel = EventsViewModel()
    @AppStorage("logged") var logged = false
    @State var manager = LoginManager()
    
    var body: some View {
        VStack {
            Button {
                if logged {
                    manager.logOut()
                    logged = false
                } else {
                    manager.logIn(permissions: ["public_profile", "email"], from: nil) { (result, error) in
                        guard let result = result else { return }
                        viewModel.getUserData()
                        logged = true
                    }
                }
            } label: {
                Text(logged ? "logOut" : "FB login")
                    .foregroundColor(.blue)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
            }
        }
    }
}
