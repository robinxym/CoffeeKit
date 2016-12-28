//
//  WSManager.swift
//  CoffeeKit
//
//  Created by Xue Yong Ming on 28/12/2016.
//  Copyright © 2016 Robin. All rights reserved.
//

import Foundation

class WSManager {
  static let shared = WSManager()
  let categoryId = "4bf58dd8d48988d1e0931735"
  let clientId = "UQRJNCYNHU3OUIO3FJFZE32WSUI3N4RRWZ2LYHFZIHHIQTRS"
  let clientSecret = "TDPUSTQ5ZSCS3BO0IZW0JFQDOQSJPS0O0LSIXQE3BQUO2MVQ"
  var dateString: String  {
    let df = DateFormatter()
    df.dateFormat = "yyyyMMdd"
    let dateString = df.string(from: Date()) as String
    return dateString
  }

  func getCafes(by coordinate: String, successHandler: @escaping (Cafe) -> (), failHandler: @escaping (_ error: Error) -> () ) {
    let urlString = String(format: "https://api.Foursquare.com/v2/venues/search?client_id=%@&client_secret=%@&v=%@&ll=%@&categoryId=%@", clientId, clientSecret, dateString, coordinate, categoryId)
    print(urlString)
    let url = URL(string: urlString)!
    let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
    let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        failHandler(error)
      }else{
        let cafe = Cafe(data: data!)
        successHandler(cafe!)
      }
    }
    dataTask.resume()
  }
}

//extension WSManager: URLSessionDataDelegate {
//  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
//
//  }
//}