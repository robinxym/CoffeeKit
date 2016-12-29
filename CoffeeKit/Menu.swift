//
//	Menu.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Menu{

	var anchor : String!
	var label : String!
	var mobileUrl : String!
	var type : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		anchor = dictionary["anchor"] as? String
		label = dictionary["label"] as? String
		mobileUrl = dictionary["mobileUrl"] as? String
		type = dictionary["type"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if anchor != nil{
			dictionary["anchor"] = anchor
		}
		if label != nil{
			dictionary["label"] = label
		}
		if mobileUrl != nil{
			dictionary["mobileUrl"] = mobileUrl
		}
		if type != nil{
			dictionary["type"] = type
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}
