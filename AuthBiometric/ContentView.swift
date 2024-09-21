//
//  ContentView.swift
//  AuthBiometric
//
//  Created by Pouya Sadri on 21/09/2024.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
	@State private var isAuthorize = false
	@State private var showAlert = false
	@State private var alertMessage : String?{
		didSet{
			showAlert = true
		}
	}
	
    var body: some View {
		VStack{
			if isAuthorize{
				Text("Welcome, You're authenticated!")
					.font(.largeTitle)
			}else{
				Text("Please authenticate to continue.")
					.font(.headline)
					.padding()
				
				Button("Authenticate"){
					authenticate()
				}
				.buttonStyle(.borderedProminent)
				.padding()
			}
		}
		.alert(isPresented: $showAlert){
			Alert(title: Text("Authentication Error"),message: Text(alertMessage ?? "Error"),dismissButton: .default(Text("OK")))
		}
    }
	
	private func authenticate(){
		let context = LAContext()
		var error : NSError?
		
		if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
			let reason = "Please authenticate to continue."
			
			context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){
				success, authenticatedError in
				
				DispatchQueue.main.async{
					if success{
						self.isAuthorize = true
					}else{
						self.isAuthorize = false
						alertMessage = authenticatedError?.localizedDescription
					}
				}
			}
		}else{
			alertMessage = error?.localizedDescription
		}
	}
}

#Preview {
    ContentView()
}
