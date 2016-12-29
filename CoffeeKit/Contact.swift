//
//	Contact.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Contact{

	var facebook : String!
	var facebookName : String!
	var facebookUsername : String!
	var formattedPhone : String!
	var phone : String!
	var twitter : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		facebook = dictionary["facebook"] as? String
		facebookName = dictionary["facebookName"] as? String
		facebookUsername = dictionary["facebookUsername"] as? String
		formattedPhone = dictionary["formattedPhone"] as? String
		phone = dictionary["phone"] as? String
		twitter = dictionary["twitter"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if facebook != nil{
			dictionary["facebook"] = facebook
		}
		if facebookName != nil{
			dictionary["facebookName"] = facebookName
		}
		if facebookUsername != nil{
			dictionary["facebookUsername"] = facebookUsername
		}
		if formattedPhone != nil{
			dictionary["formattedPhone"] = formattedPhone
		}
		if phone != nil{
			dictionary["phone"] = phone
		}
		if twitter != nil{
			dictionary["twitter"] = twitter
		}
		return dictionary
	}

}
