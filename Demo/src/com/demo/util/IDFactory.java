package com.demo.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class IDFactory {

	private static final SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private static String Id = "";
	
	public static synchronized String createId(){
		String id = format.format(Calendar.getInstance().getTime());
		while(id.equals(Id)){
			id = format.format(Calendar.getInstance().getTime());
		}
		Id = id;
		return id;
	}
}
