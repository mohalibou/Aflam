//
//  PosterView.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 5/30/22.
//

import SwiftUI

struct PosterView: View {
    
    var movie: Result
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w1280" + (movie.poster_path ?? "")),
                       content: { image in
                            image.resizable()
                                 .scaledToFill()
                                 .frame(width: 160, height: 240)
                                 .cornerRadius(10, corners: [.topLeft, .topRight])
                       },
                       placeholder: { ProgressView()
                                        .frame(width: 160, height: 240)
                                        .background(Color.gray)
                                        .cornerRadius(10, corners: [.topLeft, .topRight]) })
            VStack {
                HStack {
                    Text(movie.title)
                        .padding(10)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                Spacer()
            }
            .frame(width: 160, height: 80)
            .background(Color(UIColor.quaternaryLabel))
            .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
        }
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(movie: Result.preview)
    }
}
