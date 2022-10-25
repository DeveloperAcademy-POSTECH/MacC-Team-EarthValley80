//
//  BlurredLabel.swift
//  EarthValley80
//
//  Created by SHIN YOON AH on 2022/10/25.
//

import UIKit

final class BlurredLabel: UILabel {
    
    // MARK: - property
    
    var isBlurring = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var blurRadius: Double = 20.0 {
        didSet {
            blurFilter?.setValue(blurRadius, forKey: kCIInputRadiusKey)
        }
    }
    
    private lazy var blurFilter: CIFilter? = {
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setDefaults()
        blurFilter?.setValue(blurRadius, forKey: kCIInputRadiusKey)
        return blurFilter
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func display(_ layer: CALayer) {
        let bounds = layer.bounds
        let hasContents = !bounds.isEmpty && bounds.size.width < CGFloat(UINT16_MAX)
        guard hasContents else { layer.contents = nil; return }
        
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size,
                                               layer.isOpaque,
                                               layer.contentsScale)
        
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.draw(in: context)
            var image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
            
            layer.contents = insertBlurFilter(at: image, with: context)
        }
        
        UIGraphicsEndImageContext()
    }
    
    // MARK: - func
    
    private func configureUI() {
        self.isUserInteractionEnabled = false
        self.isOpaque = false
        self.layer.isOpaque = false
        self.layer.needsDisplayOnBoundsChange = true
        self.layer.contentsScale = UIScreen.main.scale
        self.layer.contentsGravity = .center
        self.contentMode = .redraw
    }
 
    private func insertBlurFilter(at image: CGImage?, with context: CGContext) -> CGImage {
        if isBlurring, let cgImage = image {
            let ciContext = CIContext(cgContext: context, options: nil)
            
            blurFilter?.setValue(CIImage(cgImage: cgImage), forKey: kCIInputImageKey)
            if let blurOutputImage = blurFilter?.outputImage,
               let cgImage = ciContext.createCGImage(blurOutputImage, from: blurOutputImage.extent) {
                return cgImage
            }
        }
    }
}
