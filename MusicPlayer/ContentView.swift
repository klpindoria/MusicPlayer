//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Ketan Pindoria on 25/06/2022.
//

import SwiftUI

struct Album: Hashable {
    let id = UUID()
    let name: String
    let image: String
    let publisher: String
    let songs: [Song]
}

struct Song: Hashable {
    let id = UUID()
    let name: String
    let singers: String
    let time: String
}

struct ContentView: View {
    
    let albums = [Album(name: "Aaj Mare Orde Re",
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
    
    let songs = [Song(name: "Aaj Sakhi Aanandni Heli (4 Pad)",
                      singers: "Jayshree Static, Bandish",
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
                 ] // SONGS
    
    @State private var currentAlbum: Album?
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView (.horizontal) {
                    LazyHStack {
                        ForEach(self.albums, id: \.self, content: {
                            album in
                            AlbumArtView(album: album, isWithText: true).onTapGesture {
                                self.currentAlbum = album
                            }
                        })
                        .padding(.trailing, 8)
                    } // LAZYHSTACK
                    .padding(.bottom)
                } // SCROLLVIEW
                LazyVStack {
                    ForEach((self.currentAlbum?.songs ?? self.albums.first?.songs) ?? self.songs, id: \.self, content: {
                        song in
                        SongCellView(album: currentAlbum ?? albums.first!, song: song)
                    })
                } // LAZYVSTACK
            } // SCROLLVIEW
            .navigationTitle("Kirtans")
            .padding([.leading, .trailing], 16)
        } // NAVVIEW
        
    }
}

struct AlbumArtView: View {
    var album: Album
    var isWithText: Bool
    var body: some View {
        ZStack (alignment: .bottom) {
            
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(10)
                .padding()
                .padding(.bottom, 35)
            
            if isWithText == true {
                ZStack {
                    Image(album.image)
                        .resizable()
                        .frame(width: 200, height: 45, alignment: .center)
                        .cornerRadius(10)
                    Blur(style: .regular)
                    Text("\(album.name)")
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                        .shadow(radius: 2)
                        .multilineTextAlignment(.center)
                } // ZSTACK
                .frame(width: 200, height: 45, alignment: .bottom)
                .cornerRadius(10)
            }
            
        } // ZSTACK
        .frame(width: 200, alignment: .center)
        .cornerRadius(10)
        .shadow(radius: 2)
        
    }
}

struct SongCellView: View {
    var album: Album
    var song: Song
    var body: some View {
        NavigationLink(destination: PlayerView(album: album, song: song), label: {
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 50, alignment: .center)
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color("WhiteBlack")/*@END_MENU_TOKEN@*/)
                        Circle()
                            .frame(width: 10, alignment: .center)
                            .foregroundColor(.accentColor)
                    } // ZSTACK
                    .padding(.trailing, 2)
                    VStack (alignment: .leading) {
                        Text(song.name)
                            .padding(.bottom, 2)
                        Text(song.singers)
                            .font(.caption)
                    }
                    Spacer()
                    Text(song.time)
                } // HSTACK
                .padding(.vertical, 16)
                .padding(.horizontal, 2)
                Divider()
                    .padding(.horizontal, 16)
            } // VSTACK
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
