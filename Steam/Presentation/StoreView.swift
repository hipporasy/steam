//
//  StoreView.swift
//  Steam
//
//  Created by Marasy Phi on 29/12/22.
//

import SwiftUI

struct StoreView: View {
    
    @State var selectedHeader = 0
    @State var selectedStoreType: StoreTypeView.StoreType = .topSellers
    @State var currentStore: Store = .features.first!
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                ScrollView(showsIndicators: false) {
                    TabView(selection: $currentStore) {
                        ForEach(Store.features) { item in
                            StoreFeatureView(store: item)

                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 230)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.top)
                    
                    StoreTypeView(selectedType: $selectedStoreType)
                        .padding(.top)
                    
                    
                    ForEach(Store.items) { store in
                        StoreItemView(store: store)
                    }
                    
                }
                
            }
            .background(Color.primaryBackground)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(alignment: .center) {
                        Image("logo")
                        Group {
                            Text("Steam ")
                                .font(.primary(.bold, size: 28)) +
                            Text("Store")
                                .font(.primary(.medium, size: 28))
                        }
                    }
                    .foregroundColor(.lightText)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.darkText)
                }
            }
            
        }
    }
    
}

struct StoreFeatureView: View {
    
    let store: Store
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(store.title)
                .font(.primary(.bold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(store.subtitle)
                .font(.system(size: 13))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                HStack(alignment: .center) {
                    Spacer().frame(width: 4)
                    Text("-" + (store.discount * 100).description + "%")
                        .font(.system(size: 12, weight: .bold))
                        .padding(2)
                    
                    HStack(spacing: 4) {
                        Text("$ " + store.price.description)
                            .font(.system(size: 12, weight: .medium))
                            .strikethrough()
                        Text("$ " + store.discountedPrice.description)
                            .font(.system(size: 12, weight: .bold))
                    }
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 4)
                    .background(Color.black)
                    
                }
                .frame(height: 22)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                
                Spacer()
                
                Image("window")
            }
            
        }
        .padding()
        .foregroundColor(.lightText)
        .frame(width: UIScreen.main.bounds.width - 40, height: 230)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                
                Image(store.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 40, height: 230)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                LinearGradient(gradient:Gradient(colors: [.black.opacity(0.01), .black.opacity(0.3), .black.opacity(0.6)]),
                                           startPoint: .top,
                                           endPoint: .bottom)
                .frame(width: UIScreen.main.bounds.width - 40, height: 230)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        )

        .padding(.horizontal)
    }
    
}


struct StoreTypeView: View {
    
    enum StoreType: String, Identifiable, CaseIterable {
        case topSellers = "Top Sellers"
        case freeToPlay = "Free to play"
        case earlyAccess = "Early Access"
        case topWeekly = "Top Weekly"
        case gameOfTheYear = "Game of the Year"
        
        var id: Self { self }
    }
    
    @Binding var selectedType: StoreType
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(StoreType.allCases) { type in
                    Button(action: {
                        selectedType = type
                    }) {
                        Text(type.rawValue.capitalized)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                    }
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.lightText)
                    .background(selectedType == type ? Color.primaryColor : .accentColor)
                    .cornerRadius(8)
                }
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
    
}

struct StoreItemView: View {
    
    let store: Store
    
    var body: some View {
        HStack {
            Image(store.image)
                .resizable()
                .frame(width: 72, height: 50)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(store.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.lightText)
                HStack(spacing: 2) {
                    Image("window")
                    Text("Windows")
                        .font(.system(size: 14, weight: .regular))
                }
                .foregroundColor(.lightText)
            }
            
            Spacer()
            Text("$" + store.price.description)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.lightText)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
    
}

struct StoreViewPreview: PreviewProvider {
    
    static var previews: some View {
        StoreView()
    }
    
    
}
