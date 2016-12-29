//
//	Response.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Response{

	var confident : Bool!
	var venues : [Venue]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		confident = dictionary["confident"] as? Bool
		venues = [Venue]()
		if let venuesArray = dictionary["venues"] as? [NSDictionary]{
			for dic in venuesArray{
				let value = Venue(fromDictionary: dic)
				venues.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if confident != nil{
			dictionary["confident"] = confident
		}
		if venues != nil{
			var dictionaryElements = [NSDictionary]()
			for venuesElement in venues {
				dictionaryElements.append(venuesElement.toDictionary())
			}
			dictionary["venues"] = dictionaryElements
		}
		return dictionary
	}

}
