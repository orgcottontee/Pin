//
//  MockData.swift
//  Pin
//
//  Created by adobada on 4/5/24.
//

import CloudKit

struct MockData {
    static var boutiqueLocation: CKRecord {
        let record = CKRecord(recordType: RecordType.USBoutique)
        
        record[UnitedStatesBoutique.kAddress] = "1257 N La Brea Ave"
        record[UnitedStatesBoutique.kBoutiqueStory] = "My journey with TOIRO started with just one donabe, Kamado-san rice cooker and my passion to introduce this amazing donabe in the US on August 27, 2008. As a native of Tokyo, Japan, I not only have grown up eating rice, but also have developed a palate to appreciate the best quality Japanese and international cuisines thanks to my parents. When I first tasted the rice made by this double-lid donabe rice cooker, Kamado-san from Iga, Japan back in 2007, I was blown away! It was no doubt the best quality rice I had ever tasted and didn’t even need any condiments because it was just so delicious as itself. The rice made in Kamado-san was so shiny and fluffy, and it was so easy to prepare. It tasted better than any rice cooked with any kinds of rice cooking tools I had ever tried. So, I contacted Nagatani-en, our relationship was established immediately, and I started importing only a few pieces of Kamado-san at a time in 2008. I built the website myself just to sell this one product, and sold out of my house in LA."
        record[UnitedStatesBoutique.kCategories] = ["Kitchenware", "Homegoods"]
        record[UnitedStatesBoutique.kCity] = "Los Angeles"
        record[UnitedStatesBoutique.kLocation] = CLLocation(latitude: 34.094924401599656, longitude: -118.34434975940319)
        record[UnitedStatesBoutique.kName] = "TOIRO"
        record[UnitedStatesBoutique.kShortURL] = "shopandson.com"
        record[UnitedStatesBoutique.kState] = "California"
        record[UnitedStatesBoutique.kWebsiteURL] = "https://toirokitchen.com/"
        record[UnitedStatesBoutique.kZipCode] = 90038

        return record
    }
}
