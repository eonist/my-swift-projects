import Foundation

class AdvanceStringParser{
	static func height(string:String, withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
		 let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		 let boundingBox = (string as NSString).boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

		 return ceil(boundingBox.height)
	}

	static func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
		 let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		 let boundingBox = (string as NSString).boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

		 return ceil(boundingBox.width)
	}

	static func attributedStringWithLineSpacing(_ space: CGFloat) -> NSAttributedString {
		 let paragraphStyle = NSMutableParagraphStyle()
		 paragraphStyle.lineSpacing = space

		 let attrString = NSMutableAttributedString(string: string)
		 attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attrString.length))

		 return attrString
	}
	
	static func makeBulletPointFrom(stringList: [String], font: UIFont, bullet: String = "\u{2022}", indentation: CGFloat = .mediumLargeSpacing, lineSpacing: CGFloat = .verySmallSpacing, paragraphSpacing: CGFloat = .mediumSpacing, textColor: UIColor = .licorice, bulletColor: UIColor = .licorice) -> NSAttributedString {
		 let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]
		 let bulletAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: bulletColor]

		 let paragraphStyle = NSMutableParagraphStyle()
		 let nonOptions = [NSTextTab.OptionKey: Any]()
		 paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
		 paragraphStyle.defaultTabInterval = indentation
		 paragraphStyle.lineSpacing = lineSpacing
		 paragraphStyle.paragraphSpacing = paragraphSpacing
		 paragraphStyle.headIndent = indentation

		 let bulletList = NSMutableAttributedString()
		 for string in stringList {
			  let formattedString = "\(bullet)\t\(string)"
			  let attributedString = NSMutableAttributedString(string: formattedString)
			  let lineShift = "\n"
			  let attributedLineShift = NSMutableAttributedString(string: lineShift)

			  let attributeRange = NSRange(location: 0, length: attributedString.length)
			  attributedString.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: attributeRange)
			  attributedString.addAttributes(textAttributes, range: attributeRange)

			  let nsString: NSString = NSString(string: formattedString)
			  let rangeForBullet: NSRange = nsString.range(of: bullet)
			  attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
			  bulletList.append(attributedString)

			  if let lastString = stringList.last, !string.isEqual(lastString) {
					bulletList.append(attributedLineShift)
			  }
		 }
		 return bulletList
	}

}
