//
//  WSManager.swift
//  CoffeeKit
//
//  Created by Xue Yong Ming on 28/12/2016.
//  Copyright © 2016 Robin. All rights reserved.
//

import Foundation

class WSManager {
  let categoryId = "4bf58dd8d48988d1e0931735"
  let clientId = ""
  let clientSecret = ""
  var dateString: String  {
    let df = DateFormatter()
    df.dateFormat = "yyyyMMdd"
    let dateString = df.string(from: Date()) as String
    return dateString
  }

  static let shared = WSManager()
  var timeoutInterval = 30.0
  var baseURLString = "https://api.Foursquare.com/"
  var defaultParametersDictionary: [String: Any] = [:]
  enum RequestMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
  }


  init() {
    defaultParametersDictionary = ["client_id": clientId, "client_secret": clientSecret, "categoryId": categoryId, "v": dateString]
  }

  func callWebService(do requestMethod: RequestMethod = .GET, to baseURL: String = "", at urlPath: String = "", with parameters: [String: Any] = [:], success: @escaping (Dictionary<String, Any>) -> (), failure: @escaping (_ error: Error?) -> ()) {
    var baseURLStr = baseURL
    if baseURLStr.isEmpty {
      baseURLStr = baseURLString
    }
    if !baseURLStr.hasSuffix("/") {
      baseURLStr.append("/")
    }

    var urlPathStr = urlPath
    if urlPath.hasSuffix("/") {
      urlPathStr.remove(at: urlPathStr.characters.endIndex)
    }

    let parameterDict = mergeWithDefaultParameters(parameterDictionary: parameters)
    let parameterString = buildParameterString(from: parameterDict)
    print(parameterString)

//    var fullURLStr = "\(baseURLStr)\(urlPathStr)?\(parameterString)"
//    print(fullURLStr)
//    //    let urlStr = "\(baseURLStr)\(urlPathStr)?"
//    //    print(urlStr)
//
//    var percentEncodingURLStr = addingPercentEncodingForURLString(urlString: fullURLStr)
//    print(percentEncodingURLStr)
//
//    var url = URL(string: percentEncodingURLStr)!
//    var request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeoutInterval)

    var fullURLStr: String
    var percentEncodingURLStr: String
    var url: URL
    var request: URLRequest

    switch requestMethod {
    case .POST, .PUT, .DELETE:
      fullURLStr = "\(baseURLStr)\(urlPathStr)?"
      percentEncodingURLStr = addingPercentEncodingForURLString(urlString: fullURLStr)
      url = URL(string: percentEncodingURLStr)!
      request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeoutInterval)

      request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
      print("POST PARAMS (form)")
      request.httpBody = parameterString.data(using: String.Encoding.utf8)
    case .GET:
      fullURLStr = "\(baseURLStr)\(urlPathStr)?\(parameterString)"
      print(fullURLStr)
      //    let urlStr = "\(baseURLStr)\(urlPathStr)?"
      //    print(urlStr)

      percentEncodingURLStr = addingPercentEncodingForURLString(urlString: fullURLStr)
      print(percentEncodingURLStr)

      url = URL(string: percentEncodingURLStr)!
      request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeoutInterval)
    }
    request.httpMethod = requestMethod.rawValue

    let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        failure(error)
      }else if let data = data, let dict = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String, Any> {
        //        let cafe = Cafe(fromDictionary: dict)
        //        successHandler(cafe)
        success(dict)
      }else{
        //        failHandler(error)
        failure(error)
      }
    }
    dataTask.resume()

  }

  private func mergeWithDefaultParameters(parameterDictionary: [String: Any]) -> [String: Any] {
    var parameterDict = defaultParametersDictionary

    for (key, value) in parameterDictionary {
      parameterDict[key] = value
    }
    return parameterDict
  }

  //  func getCafes(by coordinate: String, successHandler: @escaping (Cafe) -> (), failHandler: @escaping (_ error: Error?) -> () ) {
  //    var urlString = String(format: "https://api.Foursquare.com/v2/venues/search?client_id=%@&client_secret=%@&v=%@&ll=%@&categoryId=%@", clientId, clientSecret, dateString, coordinate, categoryId)
  //    print(urlString)
  //
  //    urlString = addingPercentEncodingForURLString(urlString: urlString)
  //    print(urlString)
  //
  //    let url = URL(string: urlString)!
  //    var request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
  //    request.httpMethod = "GET"
  //    let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
  //      if let error = error {
  //        failHandler(error)
  //      }else if let data = data, let dict = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary {
  //        let cafe = Cafe(fromDictionary: dict)
  //        successHandler(cafe)
  //      }else{
  //        failHandler(error)
  ////        successHandler(cafe!)
  //      }
  //    }
  //    dataTask.resume()
  //  }

  private func addingPercentEncodingForURLString(urlString: String) -> String {
    //    let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
    let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~/&:?=,")
    return urlString.addingPercentEncoding(withAllowedCharacters: allowedCharacters)!
  }

  //MARK: testDict
  //  private let dict = [
  //    "id" : "5814d76538fa3f16869546fe",
  //    "name": "Starbucks Reserve Bar",
  //    "location": [
  //      "address": "2227 Broadway St",
  //      "lat": 37.486342,
  //      "lng": -122.229906
  //    ],
  //    "items": ["Coffee", "Rise", "Bread"]
  //    ] as [String : Any]

  private func buildParameterString(from parameters: [String: Any]) -> String {
    let flattenedParameter = flattenParameter(parameters: parameters)
    print(flattenedParameter)
    let parameterString = (flattenedParameter.map { "\($0.0)=\($0.1)" } as [String]).joined(separator: "&")
    print(parameterString)
    return parameterString
  }

  private func flattenParameter(parameters: [String: Any]) -> [(String, String)] {
    var components: [(String, String)] = []
    for (key, value) in parameters {
      if let dict = value as? [String: AnyObject] {

        for (dictKey, dictValue) in dict {
          components += flattenParameter(parameters: ["\(key)\(dictKey)": dictValue])
        }

      }else if let array = value as? [Any] {

        for (index, arrayValue) in array.enumerated() {
          components += flattenParameter(parameters: ["\(key)\(index)": arrayValue])
        }

      }else{
        components.append((key, String(format: "%@", value as! CVarArg)))
      }
    }

    return components
  }

  //  func escape(string: String) -> String {
  //    let legalURLCharactersToBeEscaped: CFString = ":&=;+!@#$()',*" as CFString
  //    return CFURLCreateStringByAddingPercentEscapes(nil, string as CFString!, nil, legalURLCharactersToBeEscaped, CFStringBuiltInEncodings.UTF8.rawValue) as String
  //  }

}

//extension WSManager: URLSessionDataDelegate {
//  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
//
//  }
//}
