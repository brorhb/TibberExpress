//
//  CameraView.swift
//  TibberExpress (iOS)
//
//  Created by Bror Brurberg on 06/11/2021.
//

import SwiftUI
import SafariServices

struct CameraView: View {
    @State private var cameraId: Int?
    var camera: Camera
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                cameraId = camera.id
            }) {
                Text(camera.name)
            }
        }
        .sheet(item: $cameraId, content: { item in
            SFSafariViewWrapper(url: URL(string: "https://tavle.oppdalskisenter.no/kamera/\(item)")!)
        })
    }
}

extension Int: Identifiable {
    public var id: Int { self }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(camera: Camera(id: 1, name: "Vangslia", url: "https://player.twitch.tv/?channel=oppdal_skisenter&parent=${PARENT}&autoplay=true", zone: 1))
    }
}

struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}
