//
//	Icon.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Icon{

	var prefix : String!
	var suffix : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		prefix = dictionary["prefix"] as? String
		suffix = dictionary["suffix"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if prefix != nil{
			dictionary["prefix"] = prefix
		}
		if suffix != nil{
			dictionary["suffix"] = suffix
		}
		return dictionary
	}

}
