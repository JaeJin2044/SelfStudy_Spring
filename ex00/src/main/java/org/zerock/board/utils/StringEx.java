package org.zerock.board.utils;

import java.util.Arrays;

public class StringEx {

	public static void main(String[] args) {
		String ex = "이재진";
		String[] exArr = ex.split("");
		System.out.println(Arrays.toString(exArr));
		
		
		String[] exArr2 = new String[] {};
		
		System.out.println(Arrays.toString(exArr2));
	}

}
