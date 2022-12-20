//
//  NetworkManager.swift
//  EventsFB
//
//  Created by Nikolai Rudenko on 20.12.2022.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class EventsViewModel: ObservableObject {
    @Published var data: Any?
    
    func getUserData() {
        guard let accessTocken = AccessToken.current else {return}
        let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, name"])
//        let request = GraphRequest(graphPath: "/{group-id}/events", parameters: ["fields": "id, name"])
        
        request.start(completion: { connecting, result, error in
            self.data = result
            print("result = \(result)")
        })
    }
    
    func getEvents() {
        
    }
}
