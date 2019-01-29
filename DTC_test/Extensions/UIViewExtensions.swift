//
//  UIViewExtensions.swift
//  DTC_test
//
//  Created by Evgeniy Fes on 26/01/2019.
//  Copyright © 2019 Test. All rights reserved.
//

extension UIView {

    private class func viewInNibNamed<T: UIView>(_ nibNamed: String) -> T {
        return Bundle.main.loadNibNamed(nibNamed, owner: nil, options: nil)!.first as! T
    }

    class func nib() -> Self {
        return viewInNibNamed(nameOfClass)
    }

    class func nib(_ frame: CGRect) -> Self {
        let view = nib()
        view.frame = frame
        view.layoutIfNeeded()
        return view
    }

    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
}

extension UIView {

    func takeScreenshot(shouldSave: Bool = true, completion: SaveImageHandler?) {
        var screenshotImage: UIImage?
        let layer = self.layer
        let scale = UIScreen.main.scale

        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);

        guard let context = UIGraphicsGetCurrentContext() else {
            completion?(nil)
            return
        }

        layer.render(in: context)
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        if let image = screenshotImage, shouldSave {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        completion?(screenshotImage)
    }
}
