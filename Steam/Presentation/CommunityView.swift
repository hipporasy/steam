//
//  CommunityView.swift
//  Steam
//
//  Created by Marasy Phi on 28/12/22.
//

import SwiftUI

struct CommunityView: View {
    
    @State var selectedCommunityType: CommunityTypeView.CommunityType = .all
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading, spacing: 16) {
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Community and official content for all games and software on Steam")
                        .font(.system(size: 14))
                        .foregroundColor(.darkText)
                        .padding(.horizontal)
                    
                    CommunityTypeView(selectedType: $selectedCommunityType)
                    
                    Color.secondaryBackground
                        .frame(maxWidth: .infinity)
                        .frame(height: 8)
                    
                    
                    CommunityContentView()
                    CommunityContentView()
                    CommunityContentView()
                    CommunityContentView()
                    CommunityContentView()
                }
                
            }
            
            .background(Color.primaryBackground)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image("logo")
                        Group {
                            Text("Steam ")
                                .font(.primary(.bold, size: 28)) +
                            Text("Community")
                                .font(.primary(.medium, size: 28))
                        }
                    }
                    .foregroundColor(.lightText)
                }
            }
            
        }
    }
    
    
}


struct CommunityTypeView: View {
    
    enum CommunityType: String, Identifiable, CaseIterable {
        case search
        case all
        case screenshot
        case artwork
        case workshop
        
        var id: Self { self }
    }
    
    @Binding var selectedType: CommunityType
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(CommunityType.allCases) { type in
                    Button(action: {
                        selectedType = type
                    }) {
                        if type == .search {
                            Image(systemName: "magnifyingglass")
                                .padding(8)
                        } else {
                            Text(type.rawValue.capitalized)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 14)
                        }

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

struct CommunityContentView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image("icProfile")
                    .resizable()
                    .frame(width: 38, height: 38)
                VStack(alignment: .leading) {
                    HStack(spacing: 8) {
                        Text("Jasper the Tom")
                            .foregroundColor(.lightText)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("News")
                            .padding(4)
                            .foregroundColor(.lightText)
                            .font(.system(size: 8, weight: .bold))
                            .background(Color.init(hex: 0xB63DB6))
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                    }
                                   
                    Text("yesterday • 2:20 pm")
                        .foregroundColor(.darkText)
                        .font(.system(size: 12, weight: .regular))
                }
                Spacer()
                Image(systemName: "ellipsis")
            }
            
            Image("frog")
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            Text("Florida tourist attraction sues Fortnite, seeks removal of in-game castle")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.lightText)
                .padding(.horizontal, 4)
            
            Text("Coral Castle Museum, a tourist attraction near Miami, is suing Fortnite maker Epic Games for trademark infringement and unfair competition.")
                .font(.system(size: 14))
                .foregroundColor(.darkText)
                .padding(.horizontal, 4)
            
            Color.accentColor
                .frame(height: 1)
            
            HStack(spacing: 34) {
                Button(action: {
                    
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "hand.thumbsup")
                        Text("324")
                    }
                }
                .foregroundColor(.green)
                
                Button(action: {
                    
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "message")
                        Text("12")
                    }
                }
                .foregroundColor(.darkText)
                
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "arrow.uturn.right")
                }
                .foregroundColor(.darkText)
            }
            
            Spacer()
        }
        .padding()
    }
    
}

class CommunityView_Preview: PreviewProvider {
    
    static var previews: some View {
        CommunityContentView()
    }
    
}
