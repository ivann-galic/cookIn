//
//  About.swift
//  Cook'in
//
//  Created by Ivann Galic on 08/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//

import SwiftUI

struct About: View {
    var body: some View {
        NavigationView() {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 60, alignment: .center)
                    .padding()
                Text("Version: 0.0.1")
                    
                    .fontWeight(.bold)
                    .font(.system(size: 22))
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                Text("Développeurs:")
                    .fontWeight(.bold)
                    .font(.system(size: 22))
                    .padding(.bottom, 30)
                Text("Kévin RUAULT")
                    .font(.headline)
                    .padding(.bottom, 15)
                Text("Ivann GALIC")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 15)
                Text("Antoine NOUHAUD")
                    .font(.headline)
                    .padding(.bottom, 15)
                Text("Hugo PAVARD")
                    .font(.headline)
                Button("Plus d'infos") {UIApplication.shared.open(URL(string: "https://linktr.ee/cookin")!)}
                    .frame(maxWidth: .infinity)
                    .padding(.top, 30)
                
                Spacer()
            }
        } .navigationBarTitle(
            Text("A PROPOS")
            , displayMode: .inline)
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
