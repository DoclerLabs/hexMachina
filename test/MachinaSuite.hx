package;

import hex.HexAnnotationSuite;
import hex.HexCoreSuite;
import hex.HexDslSuite;
import hex.HexInjectSuite;
import hex.HexIoCSuite;
import hex.HexLogSuite;
import hex.HexMVCSuite;
import hex.HexReflectionSuite;
import hex.HexServiceSuite;
import hex.HexUnitSuite;
import hex.state.HexStateSuite;

/**
 * ...
 * @author Francis Bourre
 */
class MachinaSuite
{
	@Suite( "Machina suite" )
	public var list : Array<Class<Dynamic>> = [
		HexUnitSuite,
		HexCoreSuite,
		HexReflectionSuite,
		HexAnnotationSuite,
		HexInjectSuite,
		HexDslSuite,
		HexServiceSuite,
		HexMVCSuite,
		HexStateSuite,
		HexIoCSuite,
		HexLogSuite
	];
}