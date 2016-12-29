//
//	Location.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Location{

	var address : String!
	var cc : String!
	var city : String!
	var country : String!
	var distance : Int!
	var formattedAddress : [String]!
	var labeledLatLngs : [LabeledLatLng]!
	var lat : Float!
	var lng : Float!
	var postalCode : String!
	var state : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		address = dictionary["address"] as? String
		cc = dictionary["cc"] as? String
		city = dictionary["city"] as? String
		country = dictionary["country"] as? String
		distance = dictionary["distance"] as? Int
		formattedAddress = dictionary["formattedAddress"] as? [String]
		labeledLatLngs = [LabeledLatLng]()
		if let labeledLatLngsArray = dictionary["labeledLatLngs"] as? [NSDictionary]{
			for dic in labeledLatLngsArray{
				let value = LabeledLatLng(fromDictionary: dic)
				labeledLatLngs.append(value)
			}
		}
		lat = dictionary["lat"] as? Float
		lng = dictionary["lng"] as? Float
		postalCode = dictionary["postalCode"] as? String
		state = dictionary["state"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if address != nil{
			dictionary["address"] = address
		}
		if cc != nil{
			dictionary["cc"] = cc
		}
		if city != nil{
			dictionary["city"] = city
		}
		if country != nil{
			dictionary["country"] = country
		}
		if distance != nil{
			dictionary["distance"] = distance
		}
		if formattedAddress != nil{
			dictionary["formattedAddress"] = formattedAddress
		}
		if labeledLatLngs != nil{
			var dictionaryElements = [NSDictionary]()
			for labeledLatLngsElement in labeledLatLngs {
				dictionaryElements.append(labeledLatLngsElement.toDictionary())
			}
			dictionary["labeledLatLngs"] = dictionaryElements
		}
		if lat != nil{
			dictionary["lat"] = lat
		}
		if lng != nil{
			dictionary["lng"] = lng
		}
		if postalCode != nil{
			dictionary["postalCode"] = postalCode
		}
		if state != nil{
			dictionary["state"] = state
		}
		return dictionary
	}

}
