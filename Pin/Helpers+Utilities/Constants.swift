//
//  Constants.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import UIKit

// MARK: - SCREENS

// MARK: Onboarding view

enum OnboardingTextConstant {
    static let titleOne = "Boutique Locations"
    static let titleTwo = "Coverage"
    static let titleThree = "Save and share"
    static let firstText = "Discover unique boutiques and concept stores anytime, anywhere."
    static let secondText = "This initial release will feature locations in the United States."
    static let thirdText = "Save your favorite boutiques and share your favorite locations for us to add to the list."
}

// MARK: Boutique list screen

enum ListScreenConstant {
    static let header = "BOUTIQUES"
}

enum USState: String, CaseIterable {
  case allStates
  case california = "CA"
  case colorado = "CO"
  case illinois = "IL"
  case michigan = "MI"
  case minnesota = "MN"
  case newYork = "NY"
  case oregon = "OR"
  case pennsylvania = "PA"
  case washington = "WA"
  case wisconsin = "WI"

  var id: String { self.rawValue }

  var stateAbbreviation: String {
    switch self {
    case .allStates:
      return "All"
    default:
      return self.rawValue
    }
  }
}

// MARK: Boutique detail screen

enum DetailScreenConstant {
    static let navigateIcon = "location.square.fill"
}

// MARK: Maps screen

// MARK: Profile screen

enum ProfileScreenConstant {
    static let favoritesButton = "Your Boutiques"
    static let submissionFormButton = "Submit a Boutique"
}

// MARK: Favorites screen

enum FavoritesScreenConstant {
    static let header = "Your Boutiques"
}

// MARK: Submission form screen

enum SubmissionScreenConstant {
    static let instructions = "We're always looking to expand our collection for you. Please share special boutiques you'd like us to add:"
    static let namePlaceholder = "Enter Boutique Name"
    static let countryPlaceholder = "Enter Boutique Country"
    static let websitePlaceholder = "Enter Boutique Website"
}

// MARK: - UTILITIES

// MARK: App theme

enum AppTheme: String {
    case system = "System"
    case lightTheme = "Light"
    case darkTheme = "Dark"
}

enum ImageDimension {
    case squareLogo, bannerImage
    
    var placeholder: UIImage {
        switch self {
        case .squareLogo:
            return PlaceholderImage.squareLogo
        case .bannerImage:
            return PlaceholderImage.bannerImage
        }
    }
}

// MARK: Placeholder images

enum PlaceholderImage {
    static let squareLogo = UIImage(resource: .appSquareLogo)
    static let bannerImage = UIImage(resource: .appBanner)
}

// MARK: CloudKit record type

enum RecordType {
    static let USBoutique = "UnitedStatesBoutique" // Has to match the CloudKit record type name
    static let userSubmission = "UserBoutiqueSubmission"
//    static let favoriteBoutique = "FavoriteBoutique"
}



