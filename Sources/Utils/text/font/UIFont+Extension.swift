#if os(OSX)
    //nothing
#else
    import UIKit.UIFont
    /**
     * Example: let titleLabel = UILabel()
     * titleLabel.font = titleLabel.font.bold //no need to include size!
     */
    var bold:UIFont {
        return withTraits(traits: .traitBold)
    }
    func withTraits(traits:UIFontDescriptorSymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptorSymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }
#endif


