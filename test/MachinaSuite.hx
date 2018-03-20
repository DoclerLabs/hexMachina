package;

import hex.HexLogSuite;
import hex.HexCoreSuite;
import hex.HexReflectionSuite;
import hex.HexAnnotationSuite;
import hex.HexInjectSuite;
import hex.HexDSLSuite;
import hex.HexCommandSuite;
import hex.HexUnitSuite;

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
		HexDSLSuite,
		HexCommandSuite,
		HexUnitSuite
	];
}