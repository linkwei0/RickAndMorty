//
//  UIColor+Gradient.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 13.02.2025.
//

import UIKit

extension UIImage {
    func applyGrayscaleFilter() -> UIImage? {
        guard let ciImage = CIImage(image: self) else { return nil }
        
        let filter = CIFilter(name: "CIColorControls")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(0.0, forKey: kCIInputSaturationKey)
        
        guard let outputImage = filter?.outputImage else { return nil }
        let context = CIContext()
        
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }
        
        return nil
    }
}
