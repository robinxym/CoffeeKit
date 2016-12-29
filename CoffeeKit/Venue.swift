//
//	Venue.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Venue{

	var allowMenuUrlEdit : Bool!
	var beenHere : BeenHere!
	var categories : [Category]!
	var contact : Contact!
	var hasMenu : Bool!
	var hasPerk : Bool!
	var hereNow : HereNow!
	var id : String!
	var location : Location!
	var menu : Menu!
	var name : String!
	var referralId : String!
	var specials : Special!
	var stats : Stat!
	var storeId : String!
	var url : String!
	var venueChains : [VenueChain]!
	var venuePage : VenueChain!
	var venueRatingBlacklisted : Bool!
	var verified : Bool!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		allowMenuUrlEdit = dictionary["allowMenuUrlEdit"] as? Bool
		if let beenHereData = dictionary["beenHere"] as? NSDictionary{
				beenHere = BeenHere(fromDictionary: beenHereData)
			}
		categories = [Category]()
		if let categoriesArray = dictionary["categories"] as? [NSDictionary]{
			for dic in categoriesArray{
				let value = Category(fromDictionary: dic)
				categories.append(value)
			}
		}
		if let contactData = dictionary["contact"] as? NSDictionary{
				contact = Contact(fromDictionary: contactData)
			}
		hasMenu = dictionary["hasMenu"] as? Bool
		hasPerk = dictionary["hasPerk"] as? Bool
		if let hereNowData = dictionary["hereNow"] as? NSDictionary{
				hereNow = HereNow(fromDictionary: hereNowData)
			}
		id = dictionary["id"] as? String
		if let locationData = dictionary["location"] as? NSDictionary{
				location = Location(fromDictionary: locationData)
			}
		if let menuData = dictionary["menu"] as? NSDictionary{
				menu = Menu(fromDictionary: menuData)
			}
		name = dictionary["name"] as? String
		referralId = dictionary["referralId"] as? String
		if let specialsData = dictionary["specials"] as? NSDictionary{
				specials = Special(fromDictionary: specialsData)
			}
		if let statsData = dictionary["stats"] as? NSDictionary{
				stats = Stat(fromDictionary: statsData)
			}
		storeId = dictionary["storeId"] as? String
		url = dictionary["url"] as? String
		venueChains = [VenueChain]()
		if let venueChainsArray = dictionary["venueChains"] as? [NSDictionary]{
			for dic in venueChainsArray{
				let value = VenueChain(fromDictionary: dic)
				venueChains.append(value)
			}
		}
		if let venuePageData = dictionary["venuePage"] as? NSDictionary{
				venuePage = VenueChain(fromDictionary: venuePageData)
			}
		venueRatingBlacklisted = dictionary["venueRatingBlacklisted"] as? Bool
		verified = dictionary["verified"] as? Bool
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if allowMenuUrlEdit != nil{
			dictionary["allowMenuUrlEdit"] = allowMenuUrlEdit
		}
		if beenHere != nil{
			dictionary["beenHere"] = beenHere.toDictionary()
		}
		if categories != nil{
			var dictionaryElements = [NSDictionary]()
			for categoriesElement in categories {
				dictionaryElements.append(categoriesElement.toDictionary())
			}
			dictionary["categories"] = dictionaryElements
		}
		if contact != nil{
			dictionary["contact"] = contact.toDictionary()
		}
		if hasMenu != nil{
			dictionary["hasMenu"] = hasMenu
		}
		if hasPerk != nil{
			dictionary["hasPerk"] = hasPerk
		}
		if hereNow != nil{
			dictionary["hereNow"] = hereNow.toDictionary()
		}
		if id != nil{
			dictionary["id"] = id
		}
		if location != nil{
			dictionary["location"] = location.toDictionary()
		}
		if menu != nil{
			dictionary["menu"] = menu.toDictionary()
		}
		if name != nil{
			dictionary["name"] = name
		}
		if referralId != nil{
			dictionary["referralId"] = referralId
		}
		if specials != nil{
			dictionary["specials"] = specials.toDictionary()
		}
		if stats != nil{
			dictionary["stats"] = stats.toDictionary()
		}
		if storeId != nil{
			dictionary["storeId"] = storeId
		}
		if url != nil{
			dictionary["url"] = url
		}
		if venueChains != nil{
			var dictionaryElements = [NSDictionary]()
			for venueChainsElement in venueChains {
				dictionaryElements.append(venueChainsElement.toDictionary())
			}
			dictionary["venueChains"] = dictionaryElements
		}
		if venuePage != nil{
			dictionary["venuePage"] = venuePage.toDictionary()
		}
		if venueRatingBlacklisted != nil{
			dictionary["venueRatingBlacklisted"] = venueRatingBlacklisted
		}
		if verified != nil{
			dictionary["verified"] = verified
		}
		return dictionary
	}

}
