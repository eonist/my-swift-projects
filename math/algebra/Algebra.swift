import Foundation

class Algebra{
	/**
	 * Returns a fraction in a quadratic equation
	 * PARAM: a x^2
	 * PARAM: b x
	 * PARAM: c the number
	 * EXAMPLE: Algebra.quadratic(0.5, 6, -68))//7.114877048604001
	 */
	static func quadratic(_ a:CGFloat,_ b:CGFloat,_ c:CGFloat)->CGFloat {
		let numerator:CGFloat = -b+sqrt(b*b-4*a*c)
		let denominator:CGFloat = 2*a
		return numerator/denominator/*fraction*/
	}
}