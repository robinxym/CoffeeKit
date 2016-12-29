//
//	HereNow.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct HereNow{

	var count : Int!
	var groups : [AnyObject]!
	var summary : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		count = dictionary["count"] as? Int
		groups = dictionary["groups"] as? [AnyObject]
		summary = dictionary["summary"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if count != nil{
			dictionary["count"] = count
		}
		if groups != nil{
			dictionary["groups"] = groups
		}
		if summary != nil{
			dictionary["summary"] = summary
		}
		return dictionary
	}

}
