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
                            songsArray.append(Song(name: songName, singers: songSingers, time: songTime))
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

var mockData = [Album(name: "Aaj Mare Orde Re",
                      image: "Aaj Mare Orde Re",
                      publisher: "Swamibapa Studio",
                      songs:
                          [Song(name: "Aaj Sakhi Aanandni Heli (4 Pad)",
                               singers: "Jayshree Shivram, Bandish",
                               time: "13:33"),
                           Song(name: "Aaj Mare Orde Re (4 Pad)",
                                singers: "Mihir Jani",
                                time: "11:35"),
                           Song(name: "Bhajyo Nahi Bhagwan (4 Pad)",
                                singers: "Bandish",
                                time: "13:33"),
                           Song(name: "Sarve Sakhi Jivan (4 Pad)",
                                singers: "Arvind Parmar",
                                time: "07:57"),
                           Song(name: "Ora Aavo Mara (4 Pad)",
                                singers: "Divyakumar, Sangeet Haldipur",
                                time: "15:52"),
                           Song(name: "Mohanne Gamavane (4 Pad)",
                                singers: "Pankit Dabhi, Nayana Sharma",
                                time: "11:34")
                          ]
              ),
              Album(name: "Sadbhav Amrut Heli",
                  image: "Sadbhav Amrut Heli",
                  publisher: "Swamibapa Studio",
                  songs:
                    [Song(name: "Album 2",
                         singers: "Jayshree Shivram, Bandish",
                         time: "13:33"),
                     Song(name: "Aaj Mare Orde Re (4 Pad)",
                          singers: "Mihir Jani",
                          time: "11:35"),
                     Song(name: "Bhajyo Nahi Bhagwan (4 Pad)",
                          singers: "Bandish",
                          time: "13:33"),
                     Song(name: "Sarve Sakhi Jivan (4 Pad)",
                          singers: "Arvind Parmar",
                          time: "07:57"),
                     Song(name: "Ora Aavo Mara (4 Pad)",
                          singers: "Divyakumar, Sangeet Haldipur",
                          time: "15:52"),
                     Song(name: "Mohanne Gamavane (4 Pad)",
                          singers: "Pankit Dabhi, Nayana Sharma",
                          time: "11:34")
                    ]
                ),
                Album(name: "Teri Krupa Hardam Rahe",
                      image: "Teri Krupa Hardam Rahe",
                      publisher: "Swamibapa Studio",
                      songs:
                        [Song(name: "Album 3",
                             singers: "Jayshree Shivram, Bandish",
                             time: "13:33"),
                         Song(name: "Aaj Mare Orde Re (4 Pad)",
                              singers: "Mihir Jani",
                              time: "11:35"),
                         Song(name: "Bhajyo Nahi Bhagwan (4 Pad)",
                              singers: "Bandish",
                              time: "13:33"),
                         Song(name: "Sarve Sakhi Jivan (4 Pad)",
                              singers: "Arvind Parmar",
                              time: "07:57"),
                         Song(name: "Ora Aavo Mara (4 Pad)",
                              singers: "Divyakumar, Sangeet Haldipur",
                              time: "15:52"),
                         Song(name: "Mohanne Gamavane (4 Pad)",
                              singers: "Pankit Dabhi, Nayana Sharma",
                              time: "11:34")
                        ]
                ),
                Album(name: "Karuna Karo He Hari",
                      image: "Karuna Karo He Hari",
                      publisher: "Swamibapa Studio",
                      songs:
                        [Song(name: "Album 4",
                             singers: "Jayshree Shivram, Bandish",
                             time: "13:33"),
                         Song(name: "Aaj Mare Orde Re (4 Pad)",
                              singers: "Mihir Jani",
                              time: "11:35"),
                         Song(name: "Bhajyo Nahi Bhagwan (4 Pad)",
                              singers: "Bandish",
                              time: "13:33"),
                         Song(name: "Sarve Sakhi Jivan (4 Pad)",
                              singers: "Arvind Parmar",
                              time: "07:57"),
                         Song(name: "Ora Aavo Mara (4 Pad)",
                              singers: "Divyakumar, Sangeet Haldipur",
                              time: "15:52"),
                         Song(name: "Mohanne Gamavane (4 Pad)",
                              singers: "Pankit Dabhi, Nayana Sharma",
                              time: "11:34")
                        ]
                ),
                Album(name: "Chittadama Chonti Gayo Re",
                      image: "Chittadama Chonti Gayo Re",
                      publisher: "Swamibapa Studio",
                      songs:
                        [Song(name: "Album 5",
                             singers: "Jayshree Shivram, Bandish",
                             time: "13:33"),
                         Song(name: "Aaj Mare Orde Re (4 Pad)",
                              singers: "Mihir Jani",
                              time: "11:35"),
                         Song(name: "Bhajyo Nahi Bhagwan (4 Pad)",
                              singers: "Bandish",
                              time: "13:33"),
                         Song(name: "Sarve Sakhi Jivan (4 Pad)",
                              singers: "Arvind Parmar",
                              time: "07:57"),
                         Song(name: "Ora Aavo Mara (4 Pad)",
                              singers: "Divyakumar, Sangeet Haldipur",
                              time: "15:52"),
                         Song(name: "Mohanne Gamavane (4 Pad)",
                              singers: "Pankit Dabhi, Nayana Sharma",
                              time: "11:34")
                        ]
                  )
              ] //ALBUMS
