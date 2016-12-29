//
//	Stat.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Stat{

	var checkinsCount : Int!
	var tipCount : Int!
	var usersCount : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		checkinsCount = dictionary["checkinsCount"] as? Int
		tipCount = dictionary["tipCount"] as? Int
		usersCount = dictionary["usersCount"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if checkinsCount != nil{
			dictionary["checkinsCount"] = checkinsCount
		}
		if tipCount != nil{
			dictionary["tipCount"] = tipCount
		}
		if usersCount != nil{
			dictionary["usersCount"] = usersCount
		}
		return dictionary
	}

}
