//
//  PlayerView.swift
//  MusicPlayer
//
//  Created by Ketan Pindoria on 25/06/2022.
//

import SwiftUI

struct PlayerView: View {
    var album: Album
    var song: Song
    
    @State var isPlaying: Bool = false
    
    var body: some View {
        ZStack {
            Image(album.image)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Blur(style: .dark)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                AlbumArtView(album: album, isWithText: false)
                Text(song.name)
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.light)
                Spacer()
                ZStack {
                    Color("BlackWhite")
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 16, x: 0, y: -5)
                    
                    HStack {
                        Button(action: self.previous, label: {
                            Image(systemName: "backward.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(Color("WhiteBlack").opacity(0.85))
                        })
                        Button(action: self.playPause, label: {
                            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .resizable()
                                .frame(width: 70, height: 70, alignment: .center)
                                .padding(8)
                        })
                        Button(action: self.next, label: {
                            Image(systemName: "forward.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(Color("WhiteBlack").opacity(0.85))
                        })
                    }
                    
                }
                .edgesIgnoringSafeArea(.bottom)
                .frame(height: 200, alignment: .center)
            }
            
        }
    }
    
    func playPause() {
        self.isPlaying.toggle()
    }
    
    func next() {
        
    }
    
    func previous() {
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(album: Album(name: "Aaj Mare Orde Re",
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
                                    ]),
                   song: Song(name: "Aaj Sakhi Aanandni Heli (4 Pad)",
                                                                singers: "Jayshree Static, Bandish",
                                                                time: "13:33"))
        .preferredColorScheme(.light)
    }
}
