//
//  ContentView.swift
//  social-media-app
//
//  Created by Harry Bower on 23/01/2024.
//


import SwiftUI

struct ContentView: View {
    @State private var emailOrUsername = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Email or Username", text: $emailOrUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200, height: 40)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200, height: 40)

            Button(action: {
                // Handle login here
            }) {
                Text("Login")
                    .frame(width: 100)
                    .foregroundColor(.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            Spacer()
        }
        .padding(.top, 100)
    }
}

//#Preview {
//    ContentView()
//}
