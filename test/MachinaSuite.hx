package;

import hex.HexLogSuite;
import hex.HexCoreSuite;
import hex.HexUnitSuite;
import hex.HexReflectionSuite;
import hex.HexAnnotationSuite;
import hex.HexInjectSuite;
import hex.HexDslSuite;
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
		HexUnitSuite,
		HexReflectionSuite,
		HexAnnotationSuite,
		HexInjectSuite,
		HexDslSuite,
		HexCommandSuite,
	];
}