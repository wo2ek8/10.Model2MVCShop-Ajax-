<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">

<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">
<style>
	img.lion1 {
		transition: all 3s;
		width: 30px;
		position: absolute;
		bottom: 500px;
		right: 0;
	}
	img.lion1.on {
		bottom: 0;
	}
	
</style>


<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function history() {
		popWin = window
				.open(
						"/product/getHistoryList",
						"popWin",
						"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}

	//==> jQuery ���� �߰��� �κ�
	$(function() {
		
		
		$('img.lion1').click(function() {
				$(this).toggleClass('on');
		});
		
		
		
		
		
		
		
		

		//==> ����������ȸ Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(".Depth03:contains('����������ȸ')")
				.on(
						"click",
						function() {
							//Debug..
							//alert(  $( ".Depth03:contains('����������ȸ')" ).html() );
							$(
									window.parent.frames["rightFrame"].document.location)
									.attr("href",
											"/user/getUser?userId=${user.userId}");
						});

		//==> ȸ��������ȸ Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(".Depth03:contains('ȸ��������ȸ')").on(
				"click",
				function() {
					//Debug..
					//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) );
					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/user/listUser");
				});

		$(".Depth03:contains('�ǸŻ�ǰ���')").on(
				"click",
				function() {

					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "../product/addProductView.jsp");
				});

		$(".Depth03:contains('�ǸŻ�ǰ����')").on(
				"click",
				function() {

					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/product/listProduct?menu=manage");
				});

		$(".Depth03:contains('�� ǰ �� ��')").on(
				"click",
				function() {

					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/product/listProduct?menu=search");
				});

		$(".Depth03:contains('�����̷���ȸ')").on(
				"click",
				function() {

					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/purchase/listPurchase");
				});

		$(".Depth03:contains('�Ǹ��̷���ȸ')").on(
				"click",
				function() {

					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/purchase/listSale");
				});

		$(".Depth03:contains('��ٱ���')").on(
				"click",
				function() {

					$(window.parent.frames["rightFrame"].document.location)
							.attr("href", "/product/listCart");
				});
		
		
		
		
		
	});
</script>

</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0"
	topmargin="0" marginwidth="0" marginheight="0">

	<table width="159" border="0" cellspacing="0" cellpadding="0">

		<!--menu 01 line-->
		<tr>
			<td valign="top">
				<table border="0" cellspacing="0" cellpadding="0" width="159">
					<tr>
						<c:if test="${ !empty user }">
							<tr>
								<td class="Depth03">
									<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
							<a href="/user/getUser?userId=${user.userId}" target="rightFrame">����������ȸ</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
									����������ȸ
								</td>
							</tr>
						</c:if>

						<c:if test="${user.role == 'admin'}">
							<tr>
								<td class="Depth03">
									<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
							<a href="/user/listUser" target="rightFrame">ȸ��������ȸ</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
									ȸ��������ȸ
								</td>
							</tr>
						</c:if>
					<tr>
						<td class="DepthEnd">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>

		<!--menu 02 line-->
		<c:if test="${user.role == 'admin'}">
			<tr>
				<td valign="top">
					<table border="0" cellspacing="0" cellpadding="0" width="159">
						<tr>
							<td class="Depth03">�ǸŻ�ǰ���</td>
						</tr>
						<tr>
							<td class="Depth03">�ǸŻ�ǰ����</td>
						</tr>
						<tr>
							<td class="DepthEnd">&nbsp;</td>
						</tr>
						<tr>
							<td class="Depth03">�Ǹ��̷���ȸ</td>
						</tr>
						<tr>
							<td class="DepthEnd">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</c:if>

		<!--menu 03 line-->
		<tr>
			<td valign="top">
				<table border="0" cellspacing="0" cellpadding="0" width="159">
					<tr>
						<td class="Depth03">�� ǰ �� ��</td>
					</tr>

					<c:if test="${ !empty user && user.role == 'user'}">
						<tr>
							<td class="Depth03">�����̷���ȸ</td>
						</tr>
					</c:if>

					<tr>
						<td class="DepthEnd">&nbsp;</td>
					</tr>
					<tr>
						<td class="Depth03"><a href="javascript:history()">�ֱ� ��
								��ǰ</a></td>
					</tr>

					<tr>
						<td class="DepthEnd">&nbsp;</td>
					</tr>
					<c:if test="${ !empty user && user.role == 'user'}">
					<tr>
						<td class="Depth03">��ٱ���</td>
					</tr>
					</c:if>
					
					
				</table>
			</td>
		</tr>

	</table>

	
<img class="lion1" src="../images/img/favicon.ico" alt="">

	
					
</body>

</html>