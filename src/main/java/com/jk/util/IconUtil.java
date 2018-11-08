package com.jk.util;

import java.util.HashMap;

public class IconUtil {

	private static HashMap<String, String> params = new HashMap<>();
	
	public static String getIcon(String type) {
		return params.get(type);
	}
	static {
		params.put(".java", "/smallicon/java.png");
		params.put(".doc", "/smallicon/word.png");
		params.put(".docx", "/smallicon/word.png");
		params.put(".xls", "/smallicon/excel.jpg");
		params.put(".xlsx", "/smallicon/excel.jpg");
		params.put(".txt", "/smallicon/txt.png");
		params.put(".zip", "/smallicon/zip.jpg");
		params.put(".pdf", "/smallicon/pdf.jpg");
		params.put(".mp3", "/smallicon/music.jpg");
		params.put(".mp4", "/smallicon/video.jpg");
		params.put(".avi", "/smallicon/video.jpg");
		params.put(".rmvb", "/smallicon/video.jpg");
		params.put(".3gp", "/smallicon/video.jpg");
		params.put(".flv", "/smallicon/video.jpg");
		params.put(".png", "/js/img/png.jpg");
		params.put(".jpg", "/js/img/png.jpg");
		params.put(".js", "/js/img/js.jpg");
		params.put(".exe", "/js/img/exe.jpg");
	}
}
