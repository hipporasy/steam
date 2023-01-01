//
//  HomeView.swift
//  Steam
//
//  Created by Marasy Phi on 28/12/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedHeader = 0
    @State var currentProgress: CGFloat = 0.0
    @State var currentActivationCode: String = "N5KCV"
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                
                headerBarView
                    .padding(.top)
                steamGuardView
                
                Text("You’ll enter your code each time you enter your\npassword to sign in to your Steam account.")
                    .font(.system(size: 14))
                    .foregroundColor(.lightText)
                    .padding(.horizontal)
                
                Text("Tip: If you don't share your PC, you can select \"Remember my password\" when you sign in to the PC client to enter your password and authenticator code less often.")
                    .font(.system(size: 14))
                    .foregroundColor(.primaryColor)
                    .padding(.horizontal)
                
                VStack {
                    HStack(alignment: .center) {
                        Text("Remove Authenticator")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.darkText)
                    }
                    .padding()
                    
                    Color.primaryBackground
                        .frame(height: 1.5)
                    
                    HStack(alignment: .center) {
                        Text("My Recovery Code")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.darkText)
                    }
                    .padding()
                    
                    Color.primaryBackground
                        .frame(height: 1.5)
                    
                    HStack(alignment: .center) {
                        Text("Help")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.darkText)
                    }
                    .padding()
                }
                .background(Color.secondaryDark)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal)
                
                Spacer()
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
                            Text("Safety")
                                .font(.primary(.medium, size: 28))
                        }
                    }
                    .foregroundColor(.lightText)
                }
            }
            
        }
        .onAppear {
            startLoading()
        }
    }
    
    var headerBarView: some View {
        HStack {
            Button(action: {
                selectedHeader = 0
            }) {
                Text("Steam Guard")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background( selectedHeader == 0 ? Color.primaryBackground : .accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(2)
            }
            Button(action: {
                selectedHeader = 1
            }) {
                Text("Confirmations")
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
    
    var steamGuardView: some View {
        VStack(spacing: 5) {
            Group {
                Text("Logged in as ")
                    .font(.system(size: 14)) +
                Text("Tom")
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(.darkText)
            
            Text(currentActivationCode)
                .font(.primary(.bold, size: 54))
                .foregroundColor(.lightText)
            Spacer()
                .frame(height: 10)
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 3.5)
                    .foregroundColor(.primaryBackground)
                    .frame(width: 160, height: 8)
                
                RoundedRectangle(cornerRadius: 3.5)
                    .foregroundColor(.primaryColor)
                    .frame(width: 160 * currentProgress, height: 8)
            }
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
        .background(
            Image("bgGuard")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
                .aspectRatio(contentMode: .fill)
        )
    }
    
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                currentProgress += 0.01
                if currentProgress >= 1.0 {
                    
                    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
                    currentProgress = 0.0
                    currentActivationCode = String((0..<5)
                        .map { _ in letters.randomElement()! })
                    .uppercased()
                }
            }
        }
    }
    
}

class HomeView_Preview: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
    
}
