//
//	BeenHere.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct BeenHere{

	var lastCheckinExpiredAt : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		lastCheckinExpiredAt = dictionary["lastCheckinExpiredAt"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if lastCheckinExpiredAt != nil{
			dictionary["lastCheckinExpiredAt"] = lastCheckinExpiredAt
		}
		return dictionary
	}

}
