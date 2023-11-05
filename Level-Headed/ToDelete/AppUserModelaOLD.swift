////
////  AppUser.swift
////  Level-Headed
////
////  Created by Zachary Monk on 10/30/23.
////
//// Model for the AppUser object containing all relevant fields for the user
//struct AppUser: Codable {
//	let id: String
//	let email: String
//	let name: String
//	let notificationPreferences: String
//	let role: String
//	let lastLogin: String
//	let appSettings: [String : String]
//	
//	// Manual Init
//	init(id: String, email: String, name: String, notificationPreferences: String, role: String, lastLogin: String, appSettings: [String : String]) {
//		self.id = id
//		self.email = email
//		self.name = name
//		self.notificationPreferences = notificationPreferences
//		self.role = role
//		self.lastLogin = lastLogin
//		self.appSettings = appSettings
//	}
//
//	
//	// Firestore key mapping
//	enum CodingKeys: String, CodingKey {
//		case id
//		case email
//		case name
//		case notificationPreferences
//		case role
//		case lastLogin
//		case appSettings
//	}
//	
//	init(from decoder: Decoder) throws {
//		let container = try decoder.container(keyedBy: CodingKeys.self)
//		id = try container.decode(String.self, forKey: .id)
//		email = try container.decode(String.self, forKey: .email)
//		name = try container.decode(String.self, forKey: .name)
//		notificationPreferences = try container.decode(String.self, forKey: .notificationPreferences)
//		role = try container.decode(String.self, forKey: .role)
//		lastLogin = try container.decode(String.self, forKey: .lastLogin)
//		appSettings = try container.decode([String:String].self, forKey: .appSettings)
//	}
//}
