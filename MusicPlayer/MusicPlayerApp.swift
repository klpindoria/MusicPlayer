//
//  MusicPlayerApp.swift
//  MusicPlayer
//
//  Created by Ketan Pindoria on 25/06/2022.
//

import SwiftUI
import Firebase

@main
struct MusicPlayerApp: App {
    
    let data = LocalData()
    
    init() {
        FirebaseApp.configure()
        data.loadAlbums()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(data: data)
        }
    }
}
