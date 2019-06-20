package com.yd.util;

import java.math.BigDecimal;

/**
* @author YD
* @version 1.0
* @Description 运算工具
*/
public class Arith {
	private Arith() {
	}
	/**
	* @author YD
	* @version 1.0
	* @Description 默认除法运算精度
	*/
	private static final int DEF_DIV_SCALE = 10;

	/**
	* @param 被加数 加数
	* @return double
	* @author YD
	* @version 1.0 
	* @Description 加
	*/
	public static double add(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.add(b2).doubleValue();
	}

	/**
	* @param 被减数 减数
	* @return double
	* @author YD
	* @version 1.0
	* @Description 减
	*/
	public static double sub(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.subtract(b2).doubleValue(); 

	}

	/**
	* @param  被乘数 乘数
	* @return double
	* @author YD
	* @version 1.0
	* @Description 乘
	*/
	public static double mul(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.multiply(b2).doubleValue();
	}

	/**
	* @param 被除数 除数
	* @return double
	* @author YD
	* @version 1.0
	* @Description 除
	*/
	public static double div(double v1, double v2) {
		return div(v1, v2, DEF_DIV_SCALE);
	}

	/**
	* @param 被除数 除数 scale
	* @return double
	* @author YD
	* @version 1.0
	* @Description 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指 定精度，以后的数字四舍五入。
	*/
	public static double div(double v1, double v2, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException(
					"The scale must be a positive integer or zero");
		}
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	* @param 需要四舍五入的数字 scale
	* @return 四舍五入后的结果
	* @author YD
	* @version 1.0
	* @Description
	*/
	public static double round(double v, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException(
					"The scale must be a positive integer or zero");
		}
		BigDecimal b = new BigDecimal(Double.toString(v));
		BigDecimal one = new BigDecimal("1");
		return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
}
