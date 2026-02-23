//
//  CurrentTemp.swift
//  Project02
//
//  Created by Molly Yang on 2/22/26.
//

import SwiftUI

struct CurrentTemp: View {
    var body: some View {
        VStack{
            Text("Chapel Hill")
                .foregroundStyle(Color.white)
                .font(.system(size: 50, weight: .thin, design: .default))
            Text("55°")
                .foregroundStyle(Color.white)
                .font(.system(size: 75, weight: .thin))
            Text("Sunny")
                .foregroundStyle(Color.white)
                .font(.system(size: 25))
            Text("H: 57°  L: 45°")
                .foregroundStyle(Color.white)
                .font(.system(size: 25))
        }
    }
}
