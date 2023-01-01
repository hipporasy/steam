//
//  MasterView.swift
//  Steam
//
//  Created by Marasy Phi on 28/12/22.
//

import SwiftUI

struct MasterView: View {
    
    @State var selectedTabBar: TabBarType = .home
    
    enum TabBarType: String, Identifiable, CaseIterable {
        case home, community, chat, store, profile
        
        var id: String {
            return "ic\(rawValue.capitalized)"
        }
        
        var screen: AnyView {
            switch self {
            case .home:
                return AnyView(HomeView())
            case .community:
                return AnyView(CommunityView())
            case .chat:
                return AnyView(ChatView())
            case .store:
                return AnyView(StoreView())
            default:
                return AnyView(Color.white)
            }
        }
    }
    
    var body: some View {
        TabView(selection: $selectedTabBar) {
            ForEach(TabBarType.allCases) { type in
                type.screen
                    
                    .tabItem {
                        Image(type.id)
                    }
            }
        }
        .accentColor(.lightText)
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor(Color.secondaryColor)
        }
    }
    
}

struct MasterViewPreview: PreviewProvider {
    
    static var previews: some View {
        MasterView()
    }
    
}
