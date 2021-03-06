//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Cafe {

	var meta : Meta!
	var response : Response!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let metaData = dictionary["meta"] as? NSDictionary{
				meta = Meta(fromDictionary: metaData)
			}
		if let responseData = dictionary["response"] as? NSDictionary{
				response = Response(fromDictionary: responseData)
			}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if meta != nil{
			dictionary["meta"] = meta.toDictionary()
		}
		if response != nil{
			dictionary["response"] = response.toDictionary()
		}
		return dictionary
	}

}
