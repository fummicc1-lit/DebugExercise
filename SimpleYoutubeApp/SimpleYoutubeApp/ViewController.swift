//
//  ViewController.swift
//  SimpleYoutubeApp
//
//  Created by Fumiya Tanaka on 2021/01/14.
//

import UIKit
import youtube_ios_player_helper

class ViewController: UIViewController, YoutubeClientDelegate {

    @IBOutlet var videoPlayer: YTPlayerView!
    
    var playListId: String = ""
    var youtubeClient: YoutubeClient!
    
    // 注意: Int32という型になっているが、Int型と同じ扱いで大丈夫
    var index: Int32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeClient = YoutubeClient()
        youtubeClient.delegate = self
        
        
        youtubeClient.loadVideos(word: "Quiznock")
    }
    
    @IBAction func tapPauseButton() {
        videoPlayer.pauseVideo()
    }
    
    @IBAction func tapNextButton() {
        index += 1
        videoPlayer.playVideo(at: index)
    }
    
    @IBAction func tapBackButton() {
        index -= 1
        videoPlayer.playVideo(at: index)
    }

    func videoDidLoad(playListId: String) {
        self.playListId = playListId
        index = 0
        videoPlayer.load(withPlaylistId: playListId, playerVars: ["playsinline": 1])
    }
}
