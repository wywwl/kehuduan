package com.jk.util;

import java.util.List;

public class Page1 {

	private Integer currentPage;//当前页
	private Integer pageSize;//每页条数
	private Integer totalPage;//总页数
	private Integer totalCount;//总条数
	
	private List list;

	public Integer getCurrentPage() {
		//设置当前页的默认值
		if(currentPage==null){
			currentPage=1;
		}
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		//设置每页条数的默认值
		if(pageSize==null){
			pageSize=3;
		}
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", totalPage=" + totalPage + ", totalCount=" + totalCount
				+ ", list=" + list + "]";
	}
	
}
