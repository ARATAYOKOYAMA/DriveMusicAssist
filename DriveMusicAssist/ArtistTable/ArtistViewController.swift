//
//  ViewController.swift
//  DriveMusicAssist
//
//  Created by 横山　新 on 2018/07/31.
//  Copyright © 2018年 横山　新. All rights reserved.
//

import UIKit
import MediaPlayer

class ArtistViewController: UIViewController {
    var presenter: ArtistViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ArtistViewPresenter(view: self)
        presenter.acceptLibrary()
        //presenter.checkMusicitem()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playArtist1(_ sender: Any) {
        presenter.playMusic(artist: "乃木坂46")
    }
    
    @IBAction func playArtist2(_ sender: Any) {
        presenter.playMusic(artist: "安室奈美恵")
    }
    
    @IBAction func playArtist3(_ sender: Any) {
        presenter.playMusic(artist: "モーニング娘。")
    }
    
    @IBAction func playArtist4(_ sender: Any) {
        presenter.playMusic(artist: "Every Little Thing")
    }
    
}

extension ArtistViewController: ArtistView {
    func hoge(){
        print("hoge")
    }
}
