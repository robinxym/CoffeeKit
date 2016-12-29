//
//	Category.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Category{

	var icon : Icon!
	var id : String!
	var name : String!
	var pluralName : String!
	var primary : Bool!
	var shortName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let iconData = dictionary["icon"] as? NSDictionary{
				icon = Icon(fromDictionary: iconData)
			}
		id = dictionary["id"] as? String
		name = dictionary["name"] as? String
		pluralName = dictionary["pluralName"] as? String
		primary = dictionary["primary"] as? Bool
		shortName = dictionary["shortName"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if icon != nil{
			dictionary["icon"] = icon.toDictionary()
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if pluralName != nil{
			dictionary["pluralName"] = pluralName
		}
		if primary != nil{
			dictionary["primary"] = primary
		}
		if shortName != nil{
			dictionary["shortName"] = shortName
		}
		return dictionary
	}

}
