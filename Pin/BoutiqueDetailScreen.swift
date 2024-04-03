//
//  BoutiqueDetailScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueDetailScreen: View {
        
    var body: some View {
        
        ZStack {
            Color(.brandPrimary)
                .ignoresSafeArea()
            VStack {
                BoutiqueNameView(name: "Colbo")
                BoutiqueLogoView()
                Spacer()
                BoutiqueInfoView(address: "51 Orchard St",
                                 cityStatePostalCode: "New York, NY 10002",
                                 categories: ["Apparel", "Homegoods", "Records"]
                )
                ScrollView {
                    Text("Colbo is more than a traditional store. Derived from the Hebrew word for department store — “col” = “everything” + “bo” = “in it” — Colbo is a multidisciplinary space that brings together the worlds of fashion, music, art + food and beverage under one roof for a full sensory experience. It is a place to shop, but also discover, hang out, and connect. Upon entering the space, which opened in 2021 on the Lower East Side of Manhattan, visitors will find a tranquil area to sit, read books and magazines, and enjoy Colbo’s full-service coffee and tea bar. Music is always playing over a state-of-the-art sound system, with a diverse library of vinyl records also available to peruse and purchase. During the week, the space serves as a neighborhood watering hole + on weekends, Colbo will host a range of designers, artists, chefs, DJs, and other creative friends for pop-up events with food, wine, and, of course, music — drawing crowds that often spill out onto Orchard street.On the racks, customers will find Colbo’s in-house label, which is designed by co-founder Tal Silberstein and seeks to embody the space’s casually luxurious spirit, with roomy silhouettes, a natural color palette, and high-quality fabrics. Made using mostly deadstock materials sourced from around the world, almost every piece is produced locally in New York City in small batches. In addition to its own label, Colbo also carries a tight selection of items by other designers its founders admire, including Hed Mayner, Camiel Fortgens, Karu, Adish, and more — some of whom the brand has collaborated with in the past on exclusive capsule collections. In the back space, a rotating curation of globally-sourced vintage can be found as well.")
                        .font(.custom(UniversFont.light, size: 14))
                }
                .padding(.bottom)
                
                Link(destination: URL(string: "https://colbo.nyc")!) { LinkButtonView() }
            }
            .padding()
        }
        
    }
}

#Preview {
        BoutiqueDetailScreen()
}

fileprivate struct BoutiqueLogoView: View {
    
    var body: some View {
        // TODO: Can use AsyncImage
        // TODO: Can do .white in dark mode and .gray in light mode for shadow
        Image(.sampleRec)
            .resizable()
            .scaledToFit()
            .shadow(radius: 3)
    }
}

fileprivate struct BoutiqueNameView: View {
    
    var name: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(name)
                .font(.custom(BaskervilleFont.italic, size: 30))
                .kerning(1.5)
        }
    }
}

fileprivate struct BoutiqueInfoView: View {
    
    var address: String
    var cityStatePostalCode: String
    var categories: [String]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(address)
                Text(cityStatePostalCode)
                    .padding(.bottom)
                ForEach(categories, id: \.self) { category in
                        Text(category)
                        .font(.custom(UniversFont.light, size: 16))
                }
            }
            .font(.custom(UniversFont.light, size: 20))
            .kerning(1.5)
            Spacer()
        }
        .padding(.vertical)
    }
}

fileprivate struct LinkButtonView: View {
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 40)
                .foregroundStyle(.brandAccent)
            Text("colbo.nyc")
                .font(.custom(UniversFont.light,size: 16))
                .kerning(1.5)
                .foregroundStyle(.brandPrimary)
        }
    }
}
