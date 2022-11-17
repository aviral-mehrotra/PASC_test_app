//
//  CameraView.swift
//  PASC-test
//
//  Created by Aviral Mehrotra on 10/18/22.
//

import SwiftUI
import Foundation
import Photos
import PhotosUI

struct CameraView: View {
    
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    @State var delayTriggered: Bool = false
    
    private func delay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            delayTriggered = true
        }
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                Button(action: {
                    self.showCaptureImageView.toggle()
                    delay()
                }) {
                    Text("Choose photos")
                }
                GeometryReader { geometry in
                    
                    image?
                        .resizable() /// this modifier allows the image to be resized
                        .frame(width: 250, height: 250) /// the frame modifier sets the dimensions of the image to the desired pixel amounts
                        .clipShape(Circle()) /// this modifier changes the shape of the image to be a circle
                        /// the .scaledToFit() can be used to keep the original aspect ratio of the image
                        .overlay(Circle().stroke(Color.white, lineWidth: 4)) /// this modifier adds a circle border around the image
                        .shadow(radius: 10)
                        .onTapGesture {
                            print("\(Int(geometry.size.width)) x \(Int(geometry.size.height))") /// prints the dimensions of the image view (including extra space on the x and y axes)
                        }
                }
            }
            
            if (showCaptureImageView) {
                CaptureImageView(isShown: $showCaptureImageView, image: $image)
            }
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

struct CaptureImageView {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
    
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}
