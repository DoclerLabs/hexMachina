package;

import hex.HexAnnotationSuite;
import hex.HexCoreSuite;
import hex.HexInjectSuite;
import hex.HexLogSuite;
import hex.HexReflectionSuite;
import hex.HexUnitSuite;
import hex.HexCommandSuite;

/**
 * ...
 * @author Francis Bourre
 */
class MachinaSuite
{
	@Suite( "Machina suite" )
	public var list : Array<Class<Dynamic>> = [
		HexLogSuite,
		HexCoreSuite,
		HexReflectionSuite,
		HexAnnotationSuite,
		HexInjectSuite,
		HexCommandSuite,
		HexUnitSuite
	];
}