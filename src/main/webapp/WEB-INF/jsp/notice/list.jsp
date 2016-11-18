<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%
	String[] options = {"���̵�","����","����"};
%>
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/notice/table.css">

</head>
<body>
	<center>
		<h3>��������</h3>
		<table border="0" width="700" id="crud">
			<tr>
				<td align="left">
				<a href="/notice/insert.do?type=${type }" type="button" class="btn btn-default">�۾���</a>
				</td>
			</tr>
		</table>
		
		<table id="table_content" width="700" > 
			<tr>
				<th width="10%" id="menubar">��ȣ</th>
				<th width="45%" id="menubar">����</th>
				<th width="15%" id="menubar">���̵�</th>
				<th width="20%" id="menubar">�ۼ���</th>
				<th width="10%" id="menubar">��ȸ��</th>	
			</tr>
			
		<c:forEach var="vo2" items="${list2 }">
			<tr style="background: yellow;">
				<td width="10%" align="center"><img src="/images/notice/topNotice.png" border="0"></td>
				<td width="45%" align="center"><a href="/notice/content.do?nt_no=${vo2.nt_no }">${vo2.nt_subject }</a></td>
				<td width="15%" align="center">${vo2.id }</td>
				<td width="20%" align="center">
					<fmt:formatDate value="${vo2.nt_regdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td width="10%" align="center">${vo2.nt_hit }</td>
			</tr>
		</c:forEach>
		
		<c:forEach var="vo" items="${list }">                                                                              
			<tr id="dataTr">
				<td width="10%" align="center">${vo.nt_no }</td>
				<td width="45%" align="center"><a href="/notice/content.do?nt_no=${vo.nt_no }">${vo.nt_subject }</a></td>
				<td width="15%" align="center">${vo.id }</td>
				<td width="20%" align="center">
					<fmt:formatDate value="${vo.nt_regdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td width="10%" align="center">${vo.nt_hit }</td>			
			</tr>
		</c:forEach>
			</table>

		<form action="/notice/list.do" method="post">
			<!-- �׼ǿ� ���� �ּҷ� �� ���� ������ �����ڴٴ°���. ���� request.getparameter�� �����ϴ� �κ��� �׼��ִ� ������ ���������ϳ� -->
			<div class="box-tools">

				<!-- �˻� Ÿ�� ���� ����Ʈ -->
				<select name="fs" class="form-control input-sm" style="width: 88px">
					<option value="n">---</option>
					<option value="id">���̵�</option>
					<option value="nt_subject">����</option>
					<option value="nt_content">����</option>
				</select>
				<!-- �˻� Ÿ�� ���� ����Ʈ  �� -->
			</div>

			<div class="input-group input-group-sm" value="" style="width: 142px">

				<!-- Ű���� �Է� �κ� -->
				<input type="text" name="sk"
					class="form-control pull-right" placeholder="Search" />

				<!-- �˻� ��ư -->
				<!--  <div class="input-group-btn">
                  <button type="submit" id="searchBtn" class="btn btn-default"></button>
                  </div> -->
			</div>
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">�˻�</button>
			</div>
		</form>

		<table border="0" width="700">
			<tr>
				<td align="right">
				 		<img src="/images/notice/begin.gif" border="0">
				 		<a href="list.do?page=${curpage>1?curpage-1:curpage }">����</a>&nbsp;
					 </a>
				<c:forEach var="i" begin="${frompage }" end="${topage}">				
					<a href="list.do?page=${i}">[${i}]</a>
				</c:forEach>		 
				<a href="list.do?page=${curpage<totalpage?curpage+1:curpage }">����</a>&nbsp;
					<img src="/images/notice/end.gif" border="0">
					 	</a>
					 	${curPage }page / ${totalPage }page 
				</td>
				

			<%-- </tr>
				<td width="50%">
				<form action="list.do" method="post" name="frm">
				<c:set var="na" value="<%=options %>">
				</c:set>
		
				<select name="fs" id="fs">										
					<c:forEach var="name" items="${na }">
						<c:if test="${name==ss }">
							<option value="${name}" selected>
							${name }														
							</option>
						</c:if>
						<c:if test="${name!=ss }">
							<option value="${name}">
							${name }														
					    	</option>
						</c:if>
					</c:forEach>
					</select>
				
					<label for="fs">
					<input name="fs"  id="fs"  placeholder="�Է��ϼ���." type="text"></input>
					</label>
				    <input type="text" name="ss" value="${(ss==null)?'':ss }">
					<input type="hidden" name="type" value=${type }/> 
					<input type="submit" value="�˻�"> 
				</form>
				</td> --%>     		
         
				<%-- <c:choose>
					<c:otherwise>
					<c:if test="${fs != null }">
				<div class="fs" style="margin-top: 50px;">
					<ul>
					<ol>�˻���<span>${fs}</span>�� �˻��� ����� �����ϴ�!
					</ol>
					</ul>
				</div>
				</c:if>	
					</c:otherwise>
				</c:choose> --%>
				
				
			<tr>
		</tr>
		</table> 
	</center>
</body>
</html>