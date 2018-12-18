/**
 * Makes it possible to add padding to UILabel.
 * EXAMPLE: $0.padding = UIEdgeInsets(top: -10, left: 0, bottom: -10, right: 0)
 */
extension UILabel {
   private struct AssociatedKeys {
      static var padding = UIEdgeInsets()
   }

   public var padding: UIEdgeInsets? {
      get {
         return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
      }
      set {
         if let newValue = newValue {
            objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
         }
      }
   }

   override open func draw(_ rect: CGRect) {
      if let insets = padding {
         self.drawText(in: rect.inset(by: insets))
      } else {
         self.drawText(in: rect)
      }
   }

   override open var intrinsicContentSize: CGSize {
      guard let text = self.text else { return super.intrinsicContentSize }

      var contentSize = super.intrinsicContentSize
      var textWidth: CGFloat = frame.size.width
      var insetsHeight: CGFloat = 0.0
      var insetsWidth: CGFloat = 0.0

      if let insets = padding {
         insetsWidth += insets.left + insets.right
         insetsHeight += insets.top + insets.bottom
         textWidth -= insetsWidth
      }

      let newSize = text.boundingRect(with: CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude),
                                      options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                      attributes: [NSAttributedString.Key.font: self.font], context: nil)

      contentSize.height = ceil(newSize.size.height) + insetsHeight
      contentSize.width = ceil(newSize.size.width) + insetsWidth

      return contentSize
   }
}
