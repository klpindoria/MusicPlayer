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
    let file: String
}

struct ContentView: View {
    
    @ObservedObject var data: LocalData
    
    let songs = [Song(name: "Aaj Sakhi Aanandni Heli (4 Pad)",
                      singers: "Jayshree Static, Bandish",
                      time: "13:33",
                      file: "https://youtube.com/"
                     ),
                 
                  Song(name: "Aaj Mare Orde Re (4 Pad)",
                       singers: "Mihir Jani",
                       time: "11:35",
                       file: "https://youtube.com/"
                      )]
    
    @State private var currentAlbum: Album?
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView (.horizontal) {
                    LazyHStack {
                        if self.data.albums.first == nil {
                            EmptyView()
                        } else {
                            ForEach(self.data.albums, id: \.self, content: {
                                album in
                                AlbumArtView(album: album, isWithText: true).onTapGesture {
                                    self.currentAlbum = album
                                }
                            })
                            .padding(.trailing, 8)
                        }
                    } // LAZYHSTACK
                    .padding(.bottom)
                } // SCROLLVIEW
                LazyVStack {
                    if self.data.albums.first == nil {
                        EmptyView()
                    } else {
                        ForEach((self.currentAlbum?.songs ?? self.data.albums.first?.songs) ?? self.songs, id: \.self, content: {
                            song in
                            SongCellView(album: currentAlbum ?? self.data.albums.first!, song: song)
                        })
                    }
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
                            .foregroundColor(Color("WhiteBlack"))
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
