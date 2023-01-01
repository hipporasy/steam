//
//  ChatView.swift
//  Steam
//
//  Created by Marasy Phi on 29/12/22.
//

import SwiftUI

struct ChatView: View {
    
    @State var selectedHeader = 0
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                ScrollView(.vertical, showsIndicators: false) {
                    headerBarView
                        .padding(.top, 20)
                    
                    ForEach(FriendItemView.Friend.data) {
                        FriendItemView(friend: $0)
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
                            Text("Chat")
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
    
    var headerBarView: some View {
        HStack {
            Button(action: {
                selectedHeader = 0
            }) {
                Text("Open chats")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background( selectedHeader == 0 ? Color.primaryBackground : .accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(2)
            }
            Button(action: {
                selectedHeader = 1
            }) {
                Text("My friends")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background( selectedHeader == 1 ? Color.primaryBackground : .accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(2)
            }
            
        }
        .frame(height: 34.0)
        .foregroundColor(.lightText)
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal)
    }
    
}

struct FriendItemView: View {
    
    let friend: Friend
    
    struct Friend: Identifiable {
        let displayName: String
        let status: Status
        let messageCount: Int
        let isRead: Bool
        let lastSent: String?
        let lastReceived: String?
        let image: String
        
        var id: UUID { .init() }
        
        
        enum Status {
            case online, idle, offline
        }
        
        static let data: [Friend] = [
            .init(displayName: "Mark Dyson", status: .online, messageCount: 1, isRead: true, lastSent: nil,
                  lastReceived: "I'm already starting to play • 14 Jun", image: "friend.1"),
            .init(displayName: "Tom Jaspser", status: .idle, messageCount: 0, isRead: false, lastSent: "Cyka blyat’  • 14 Jun",
                  lastReceived: nil, image: "friend.2"),
            .init(displayName: "Kurumi", status: .idle, messageCount: 0, isRead: true, lastSent: "Ok  • 14 Jun",
                  lastReceived: nil, image: "friend.3"),
            .init(displayName: "Mark Dyson", status: .offline, messageCount: 0, isRead: true, lastSent: nil,
                  lastReceived: "I'm already starting to play • 14 Jun", image: "friend.4"),
            .init(displayName: "Mark Dyson", status: .offline, messageCount: 0, isRead: true, lastSent: nil,
                  lastReceived: "I'm already starting to play • 14 Jun", image: "friend.3"),
            .init(displayName: "Mark Dyson", status: .offline, messageCount: 0, isRead: true, lastSent: nil,
                  lastReceived: "I'm already starting to play • 14 Jun", image: "friend.1")
        ]
            
        
    }
    
    
    var body: some View {
        HStack(spacing: 14) {
            
            ZStack(alignment: .bottomTrailing) {
                Image(friend.image)
                    .resizable()
                    .frame(width: 52, height: 52)
                    .clipShape(RoundedRectangle(cornerRadius: 26))
                
                if friend.status != .offline {
                    Circle()
                        .frame(width: 14, height: 14)
                        .foregroundColor(friend.status == .online ? Color.green : .primaryColor)
                }
                
            }
            
            VStack(alignment: .leading) {
                
                Text(friend.displayName)
                    .foregroundColor(.lightText)
                    .font(.system(size: 16, weight: .semibold))
                
                if friend.lastReceived == nil {
                    Text("You: ")
                        .foregroundColor(.lightText)
                        .font(.system(size: 14, weight: .medium))
                    +
                    Text(friend.lastSent ?? "")
                        .foregroundColor(.darkText)
                        .font(.system(size: 14, weight: .regular))
                    
                } else {
                    Text(friend.lastReceived ?? "")
                        .foregroundColor(.darkText)
                        .font(.system(size: 14, weight: .regular))
                }
            }
               
              
            Spacer()
            if friend.messageCount > 0 {
                Text(friend.messageCount.description)
                    .padding(1)
                        .frame(width: 20, height: 20)
                        .background(Color.primaryColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
            } else if friend.lastReceived == nil && !friend.isRead {
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Color.lightText)
                    .padding(.trailing, 6)
            }
            
                    
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
    
}
