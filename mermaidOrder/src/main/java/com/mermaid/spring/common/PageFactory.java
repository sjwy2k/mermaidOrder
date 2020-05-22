package com.mermaid.spring.common;

public class PageFactory {
	
	public static String getPage(int totalData, int cPage, int numPerPage, String url) {
		String pageBar="";
		
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		
		pageBar+="<ul class='col pagination justify-content-center pagination-sm mx-auto'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			} else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		
		pageBar+="</ul>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage";
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}
	
	public static String getAjaxPage(int totalData, int cPage, int numPerPage, String url) {
		
		String pageBar="";
		
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			} else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="	requestListAjax(cPage,'"+url+"');";
		pageBar+="}"; //fn_paging
		
		pageBar+="function requestListAjax(cPage,url){";
		pageBar+="	$('#pro-content1').hide();";
		pageBar+="	$.ajax({";
		pageBar+="		url:url,";
		pageBar+="		data:{cPage:cPage},";
		pageBar+="		dataType:'json',";
		pageBar+="		contentType: 'application/json',";
		pageBar+="		success:function(data){";
		pageBar+="			if(data.flag){";
		pageBar+="				var result=JSON.parse(data.storeList);";
		pageBar+="				var tbody=$('.table.sto-table').eq(0).children('tbody');";
		pageBar+="				var html='';";
		pageBar+="				html += '<input type=\"hidden\" name=\"sto-li-ownid\" value=\"${loginOwner.ownerNo}\">';";
		pageBar+="				for(let i=0;i<result.length;i++){";
		pageBar+="					html += '<tr>';";
		pageBar+="					html += '<th scope=\"row\" class=\"stoNo\">'+result[i].STORENO+'</th>';";
		pageBar+="					html += '<td class=\"stoName\">'+result[i].STORENAME+'</td>';";
		pageBar+="					html += '<td class=\"stoType\">'+result[i].STORETYPE+'</td>';";
		pageBar+="					html += '<td><button class=\"btn btn-outline-success mr-4 sto-update\">수정</button><button class=\"btn btn-outline-danger sto-delete\">삭제</button></td>';";
		pageBar+="					html += '</tr>';";
		pageBar+="				}";
		pageBar+="				tbody.html(html);";
		pageBar+="				stoflag=true;";
		pageBar+="				var pgnation=$(\"#pagination\");\r\n";
		pageBar+="	    		pgnation.html(data.pageBar);";
		pageBar+="				stoflag=true;";
		pageBar+="			} else {"; //if
		pageBar+="				console.log('점포 조회 실패');";
		pageBar+="			}"; //else
		pageBar+="		}"; //success fnc
		pageBar+=" });";//ajax
		pageBar+=" $('#pro-content3').show();";
		pageBar+="}";//reqLisAjax
		pageBar+="</script>";
		
		return pageBar;
	}
	
	
	
	
	
}
