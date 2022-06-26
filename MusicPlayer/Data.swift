//
//  Data.swift
//  MusicPlayer
//
//  Created by Ketan Pindoria on 26/06/2022.
//

import Foundation
import SwiftUI
import Firebase

class LocalData: ObservableObject {
    @Published public var albums = [Album]()
    
    func loadAlbums() {
        Firestore.firestore().collection("albums").getDocuments { (snapshot, error) in
            if error == nil {
                for document in snapshot!.documents {
                    let albumName = document.data()["name"] as? String ?? "Error"
                    let albumImage = document.data()["image"] as? String ?? "NoAlbumArt"
                    let albumPublishers = document.data()["image"] as? String ?? ""
                    let albumSongs = document.data()["songs"] as? [String: [String: Any]]
                    
                    var songsArray = [Song]()
                    if let albumSongs = albumSongs {
                        for song in albumSongs {
                            let songName = song.value["name"] as? String ?? "Error"
                            let songSingers = song.value["singers"] as? String ?? "Error"
                            let songTime = song.value["time"] as? String ?? "0:00"
                            let songFile = song.value["file"] as? String ?? "Error"
                            songsArray.append(Song(name: songName, singers: songSingers, time: songTime, file: songFile))
                        }
                    }
                    
                    self.albums.append(Album(name: albumName, image: albumImage, publisher: albumPublishers, songs: songsArray))
                }
            } else {
                print(error)
            }
        }
    }
    
}
