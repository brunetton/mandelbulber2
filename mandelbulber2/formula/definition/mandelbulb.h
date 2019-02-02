/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.         ______
 * Copyright (C) 2018 Mandelbulber Team   _>]|=||i=i<,      / ____/ __    __
 *                                        \><||i|=>>%)     / /   __/ /___/ /_
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    / /__ /_  __/_  __/
 * The project is licensed under GPLv3,   -<>>=|><|||`    \____/ /_/   /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * Classic Mandelbulb fractal.
 * @reference http://www.fractalforums.com/3d-fractal-generation/true-3d-mandlebrot-type-fractal/
 */

#ifndef MANDELBULBER2_FORMULA_DEFINITION_FRACTAL_MANDELBULB_H_
#define MANDELBULBER2_FORMULA_DEFINITION_FRACTAL_MANDELBULB_H_

#include "abstract_fractal.h"

namespace fractal
{

class cFractalMandelbulb : public cAbstractFractal
{
public:
	const fractal::enumColoringFunction getColoringFunction() override
	{
		return coloringFunctionDefault;
	}
	const fractal::enumCPixelAddition getCpixelAddition() override { return cpixelEnabledByDefault; }
	const fractal::enumDEAnalyticFunction getDeAnalyticFunction() override
	{
		return analyticFunctionLogarithmic;
	}
	const double getDefaultBailout() override { return 10.0; }
	const fractal::enumDEFunctionType getDeFunctionType() override { return logarithmicDEFunction; }
	const fractal::enumDEType getDeType() override { return analyticDEType; }
	const QString &getInternalName() override { return "mandelbulb"; }
	const QString &getNameInComboBox() override { return "Mandelbulb"; }

	const inline void FormulaCode(CVector4 &z, const sFractal *fractal, sExtendedAux &aux) override
	{
		// if (aux.r < 1e-21) aux.r = 1e-21;
		const double th0 = asin(z.z / aux.r) + fractal->bulb.betaAngleOffset;
		const double ph0 = atan2(z.y, z.x) + fractal->bulb.alphaAngleOffset;
		double rp = pow(aux.r, fractal->bulb.power - 1.0);
		const double th = th0 * fractal->bulb.power;
		const double ph = ph0 * fractal->bulb.power;
		const double cth = cos(th);
		aux.DE = (rp * aux.DE) * fractal->bulb.power + 1.0;
		rp *= aux.r;
		z.x = cth * cos(ph) * rp;
		z.y = cth * sin(ph) * rp;
		z.z = sin(th) * rp;
	}
};

} /* namespace fractal */

#endif /* MANDELBULBER2_FORMULA_DEFINITION_FRACTAL_MANDELBULB_H_ */
