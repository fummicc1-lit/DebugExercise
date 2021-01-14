//
//  YoutubeClient.swift
//  SimpleYoutubeApp
//
//  Created by Fumiya Tanaka on 2021/01/14.
//

import Foundation
import Alamofire

struct YoutubeResponse: Decodable {
    let items: [Item]
    
    struct Item: Decodable {
        let id: ID
        
        struct ID: Decodable {
            let playlistId: String
        }
    }
}

protocol YoutubeClientDelegate: AnyObject {
    func videoDidLoad(playListId: String)
}

class YoutubeClient {
    weak var delegate: YoutubeClientDelegate?
    
    let apiKey: String = "AIzaSyDA_H75M8zesJgo5n6o3Wfv4ueyAiqJD6U"
    
    func loadVideos(word: String) {
        let url = URL(string: "https://www.googleapis.com/youtube/v3/search?key=\(apiKey)&type=playlist&part=snippet&q=\(word)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        var request = URLRequest(url: url)
        request.method = HTTPMethod.get
        AF.request(request).responseDecodable(of: YoutubeResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                let playlistIdList: [String] = response.items.map { $0.id.playlistId }
                if playlistIdList.isEmpty {
                    return
                }
                self.delegate?.videoDidLoad(playListId: playlistIdList[0])
            case .failure(let error):
                print(error)
            }
        }
    }
}
