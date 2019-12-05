<%-- <%@page import="java.util.Map"%>
<%@page import="com.model2.mvc.common.Search"%>
<%@page import="com.model2.mvc.service.domain.Purchase"%>
<%@page import="java.util.List"%>

<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- EL / JSTL �������� �ּ�ó�� -->
    <%-- <%
        	List<Purchase> list = (List<Purchase>)request.getAttribute("list");
            Page resultPage = (Page)request.getAttribute("resultPage");
            
            Search search = (Search)request.getAttribute("search");
        %> --%>
<!DOCTYPE html>
<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="../css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
	
	$(function() {
		
		$('tr.ct_list_pop td:nth-child(1) span').click(function() {
			
			var tranNo = $(this).parent().children('input').val();
			self.location = '/purchase/getPurchase?tranNo=' + tranNo;
			console.log('/purchase/getPurchase?tranNo=' + tranNo);
		});
		
		$('tr.ct_list_pop td:nth-child(3) span').click(function() {
			
			
			self.location = '/user/getUser?userId=' + $(this).text().trim();
			console.log('/user/getUser?userId=' + $(this).text().trim());
		});
		
		$('tr.ct_list_pop td:nth-child(11) span').click(function() {
			
			var tranNo = $(this).parent().children('input').val();
			self.location = '/purchase/updateTranCode?tranNo=' + tranNo + '&tranCode=2&page=${resultPage.currentPage}';
			console.log('/purchase/updateTranCode?tranNo=' + tranNo + '&tranCode=2&page=${resultPage.currentPage}');
		});
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<%-- <td colspan="11">��ü <%=resultPage.getTotalCount()%> �Ǽ�, ���� <%=resultPage.getCurrentPage()%> ������</td> --%>
		<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<%-- <%
		for(int i = 0; i < list.size(); i++) {
		
		Purchase purchaseVO = list.get(i);
	%>
	
	<tr class="ct_list_pop">
		<td align="center">
			<a href="/getPurchase.do?tranNo=<%=purchaseVO.getTranNo()%>"><%=i + 1 %></a>
		</td>
		<td></td>
		<td align="left">
			<a href="/getUser.do?userId=<%=purchaseVO.getBuyer().getUserId()%>"><%=purchaseVO.getBuyer().getUserId()%></a>
		</td>
		<td></td>
		<td align="left"><%=purchaseVO.getReceiverName() %></td>
		<td></td>
		<td align="left"><%=purchaseVO.getReceiverPhone() %></td>
		<td></td>
		<td align="left">
		<%
		if(purchaseVO.getTranCode().equals("1")) {%>
			���籸�ſϷ���� �Դϴ�.
		<%} else if(purchaseVO.getTranCode().equals("2")) {%>
			�������߻��� �Դϴ�.
		<%} else if(purchaseVO.getTranCode().equals("3")) {%>
			�����ۿϷ���� �Դϴ�.
		<%}
		%>
			  
		
				</td>
		<td></td>
		<td align="left">
		<%
		if(purchaseVO.getTranCode().equals("2")) {%>
			<a href="/updateTranCode.do?tranNo=10082&tranCode=3">���ǵ���</a>
		<%}
		%>
		
			
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<%
	
		} 
	
	%> --%>
	
	<c:set var="i" value="0"/>
	<c:forEach var="purchase" items="${list }">
	<c:set var="i" value="${i + 1 }"/>
	<tr class="ct_list_pop">
	<td align="center">
	<%-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo }"> --%>
	<input type="hidden" value="${purchase.tranNo }"/>
	<span>${i }</span><!-- </a> -->
	</td>
	<td></td>
	<td align="left">
	<%-- <a href="/user/getUser?userId=${purchase.buyer.userId }"> --%>
	
	<span>${purchase.buyer.userId }</span><!-- </a> -->
	</td>
	<td></td>
		<td align="left">${purchase.receiverName }</td>
		<td></td>
		<td align="left">${purchase.receiverPhone }</td>
		<td></td>
		<td align="left">
			<c:if test="${purchase.tranCode.trim().equals('0') }">
			���籸�ſϷ���� �Դϴ�.
			</c:if>
			<c:if test="${purchase.tranCode.trim().equals('1') }">
			�������߻��� �Դϴ�.
			</c:if>
			<c:if test="${purchase.tranCode.trim().equals('2') }">
			�����ۿϷ���� �Դϴ�.
			</c:if>
			
		</td>
		<td></td>
		<td align="left">
		
		<c:if test="${purchase.tranCode.trim().equals('1') }">
		<%-- <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo }&tranCode=2&page=${resultPage.currentPage}"> --%>
		<input type="hidden" value="${purchase.tranNo }"/>
		<span>���ǵ���</span><!-- </a> -->
		</c:if>
		
			
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	
	</c:forEach>
	
	
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		 	<input type="hidden" id="currentPage" name="currentPage" value=""/>
		 	<!-- EL / JSTL �������� �ּ� ó�� -->
		 	<%-- <%if(resultPage.getCurrentPage() <= resultPage.getPageUnit()) {%>
		 		
		 	<%} else {%>
		 		<a href="/listPurchase.do?currentPage=<%=resultPage.getCurrentPage() - 1%>">���� </a> 
		 	<%}
		 	
		 	for(int i = resultPage.getBeginUnitPage(); i <= resultPage.getEndUnitPage(); i++) {%>
		 		<a href="/listPurchase.do?currentPage=<%=i%>"><%=i%></a>
		 	<%}
		 	
		 	if(resultPage.getEndUnitPage() >= resultPage.getMaxPage()) {%>
		 		
		 	<%} else {%>
		 		<a href="/listPurchase.do?currentPage=<%=resultPage.getEndUnitPage() + 1%>"> ����</a> 
		 	<%}
		 	%> --%>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
		
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>