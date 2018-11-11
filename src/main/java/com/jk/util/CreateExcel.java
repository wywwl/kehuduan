package com.jk.util;

import java.util.List;

import com.jk.model.UserBean;
import com.jk.service.CommentService;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;



public class CreateExcel implements Runnable {
	@Autowired
	private CommentService commentService;
	
	private SXSSFWorkbook workbook;
	
	private UserBean users;
	
	private Integer c;

	@Override
	public void run() {
		excel();
	}

	private void excel() {
			synchronized (workbook) {
			List<UserBean> userList = commentService.findUserInfo(users);
			if (userList.size() > 0) {
				Sheet sheet = workbook.createSheet("sheet"+c);
				Row row = sheet.createRow(0);  
				Cell cell = row.createCell(0);  
				cell.setCellValue("用户主键");
				cell = row.createCell(1);  
				cell.setCellValue("用户名");  
				cell = row.createCell(2);  
				cell.setCellValue("用户年龄");
				cell = row.createCell(3);
				cell.setCellValue("注册时间");
				cell = row.createCell(4);
				cell.setCellValue("登录证号");
				cell = row.createCell(5);
				cell.setCellValue("地址");
				cell = row.createCell(6);
				cell.setCellValue("用户邮箱");
				int size = userList.size();
				cell = row.createCell(7);
				cell.setCellValue("头像文件的地址");
				cell = row.createCell(8);
				cell.setCellValue("注册时间");
				cell = row.createCell(9);
				cell.setCellValue("用户的纽币数");
				cell = row.createCell(10);

				cell.setCellValue("最后登陆日期");
				cell = row.createCell(11);
				cell.setCellValue("注册IP");
				cell = row.createCell(12);
				cell.setCellValue("登录IP");
				cell = row.createCell(13);
				cell.setCellValue("用户所拥有的积分");
				for (int j = 0; j < size; j++) {
					UserBean d = userList.get(j);
					row = sheet.createRow(j+1);
					row.createCell(0).setCellValue(d.getId());
					row.createCell(1).setCellValue(d.getName());
					row.createCell(2).setCellValue(d.getAge()+"岁");
					row.createCell(3).setCellValue(d.getCreatetime());
					row.createCell(4).setCellValue(d.getLogin());
					row.createCell(5).setCellValue(d.getAddress());
					row.createCell(6).setCellValue(d.getUemial());
					row.createCell(7).setCellValue(d.getFile());
					row.createCell(8).setCellValue(d.getCreatetime());
					row.createCell(9).setCellValue(d.getNbcount());
					row.createCell(10).setCellValue(d.getLastlogintime());
					row.createCell(11).setCellValue(d.getZhuceip());
					row.createCell(12).setCellValue(d.getLoginip());
					row.createCell(13).setCellValue(d.getJifen());
				}
			}
		}
	}

	public CreateExcel() {
	}

	public CreateExcel(CommentService commentService, SXSSFWorkbook workbook, UserBean users,Integer c) {
		super();
		this.commentService = commentService;
		this.workbook = workbook;
		this.users = users;
		this.c = c;
	}
	
}
