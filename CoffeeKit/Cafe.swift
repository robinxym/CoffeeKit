//
//  Cafe.swift
//  CoffeeKit
//
//  Created by Xue Yong Ming on 28/12/2016.
//  Copyright © 2016 Robin. All rights reserved.
//

import Foundation

struct Location {
  var address: String
  var cc: String
  var city: String
  var country: String
  var crossStreet: String
  var distance: String
  var lat: String
  var lng: String
  var postalCode: String
  var state: String
}

struct States {
  var checkinsCount: Int
  var tipCount: Int
  var usersCount: Int
}

struct Contact {
  var formattedPhone: String
  var phone: String
  var twitter: String
}

struct Venue {
  var id: String
  var name: String
  var location: Location
  var contact: Contact
  var stats: States

  init() {
    id = ""
    name = ""
    location = Location(address: "", cc: "", city: "", country: "", crossStreet: "", distance: "", lat: "", lng: "", postalCode: "", state: "")
    contact = Contact(formattedPhone: "", phone: "", twitter: "")
    stats = States(checkinsCount: 0, tipCount: 0, usersCount: 0)
  }

  init(dict: Dictionary<String, Any>) {
    self.init()
    id = dict["id"] as! String
    name = dict["name"] as! String
  }
}

struct Response {
  var venues: [Venue]
}

struct Cafe {
  var response: Response

  init() {
    self.response = Response(venues: [])
  }

  init?(data: Data) {
    let jsonDict = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
    guard let responseDict = jsonDict["response"] as? Dictionary<String, Any> else {return nil}
    guard let venueArray = responseDict["venues"] as? Array<Dictionary<String, Any>> else {return nil}

//    var venue = Venue()
//    venue.id = venueArray.first!["id"] as! String
//    venue.name = venueArray.first!["name"] as! String
    let venues = venueArray.map({Venue(dict: $0)})

    response = Response(venues: venues)
  }

}
