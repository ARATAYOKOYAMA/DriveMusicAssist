//
//  ArtistViewPresenter.swift
//  DriveMusicAssist
//
//  Created by 横山　新 on 2018/07/31.
//  Copyright © 2018年 横山　新. All rights reserved.
//

import Foundation
import MediaPlayer
import StoreKit


protocol ArtistView: class {
    func hoge()
}

class ArtistViewPresenter {
    
    private let view: ArtistView
    let player = MPMusicPlayerController.systemMusicPlayer
    let cloudServiceController = SKCloudServiceController()
    
    
    init(view: ArtistView) {
        self.view = view
    }
    
    func testHoge(){
        print("hoge")
    }
    
    //To do ミュージックライブラリへのアクセス許可
    func acceptLibrary(){
        SKCloudServiceController.requestAuthorization { status in
            guard status == .authorized else { return }
        }
    }
    
    
    //To do 音楽再生
    func playMusic(artist: String){
        
        // 「曲」を取得
        let query = MPMediaQuery.songs()
        
        // アーティスト名で絞り込む
        let predicate = MPMediaPropertyPredicate(value: artist, forProperty: MPMediaItemPropertyArtist, comparisonType: MPMediaPredicateComparison.contains)
        query.addFilterPredicate(predicate)
        
        player.setQueue(with: query)
        
        // シャッフル
        player.shuffleMode = .songs
        // リピート設定
        player.repeatMode = .all
        // 再生
        player.play()

    }
    
    
    //To do 一覧表示
    func checkMusicitem(){
        let albumsQuery = MPMediaQuery.albums()
        if let albums = albumsQuery.collections {
            for album in albums {
                for song in album.items {
                    
                    // アーティスト名
                    guard let artist = song.value(forProperty: MPMediaItemPropertyArtist) else {
                        continue
                    }
                    
                    // 楽曲のタイトル
                    guard let title = song.value(forProperty: MPMediaItemPropertyTitle) else {
                        continue
                    }
                    print("artist: \(artist)")
                    print("title: \(title)")
                    
                    }
                    
                    print("=======")
                }
            }
        }
    
}
