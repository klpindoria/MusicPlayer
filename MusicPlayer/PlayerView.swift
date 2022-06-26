//
//  PlayerView.swift
//  MusicPlayer
//
//  Created by Ketan Pindoria on 25/06/2022.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage
import AVFoundation

struct PlayerView: View {
    @State var album: Album
    @State var song: Song
    
    @State var player = AVPlayer()
    
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
        .onAppear() {
            self.playMusic()
        }
    }
    
    func playMusic() {
        let storage = Storage.storage().reference(forURL: self.song.file)
        storage.downloadURL { (url, error) in
            if error != nil {
                print(error)
            } else {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                }
                catch {
                    // report for an error
                }
                player = AVPlayer(playerItem: AVPlayerItem(url: url!))
                player.play()
                isPlaying = true
            }
        }
    }
    
    func playPause() {
        self.isPlaying.toggle()
        if isPlaying == false {
            player.pause()
        } else {
            player.play()
        }
    }
    
    func next() {
        if let currentIndex = album.songs.firstIndex(of: song) {
            if currentIndex == album.songs.count - 1 {
                // do nothing
            } else {
                player.pause()
                song = album.songs[currentIndex + 1]
                self.playMusic()
            }
        }
    }
    
    func previous() {
        if let currentIndex = album.songs.firstIndex(of: song) {
            if currentIndex == 0 {
                // do nothing
            } else {
                player.pause()
                song = album.songs[currentIndex - 1]
                self.playMusic()
            }
        }
    }
}
