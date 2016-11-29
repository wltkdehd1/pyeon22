<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ���� Ȯ�� �� ����</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/pos/ps_user_update"
		method="post" name="submit">
		<table id="tb_insert">
			<c:forEach items="${ list }" var="list">
			<tr>
				<th colspan="2"><label id="lb_insert"> ���������� </label></th>
			</tr>
			<tr>
				<th id="tr2_insert"><img class="img_insert"
					src="/controller/resources/images/id.png">���̵�</th>
				<th><input id="ipt_insert" type="text" name="id" readonly="readonly" value="${ list.id }"></th>
			</tr>
			<tr>
				<th id="tr2_insert"><img class="img_insert"
					src="/controller/resources/images/pwd.png">��й�ȣ</th>
				<th><input id="pwd" class="ipt_insert" type="password" name="pwd" placeholder="��й�ȣ �Է�"></th>
			</tr>
			<tr>
				<th id="tr2_insert"><img class="img_insert"
					src="/controller/resources/images/name.png">�̸�</th>
				<th><input id="ipt_insert" type="text" name="name" value="${ list.name }"></th>
			</tr>
			<tr>
				<th id="tr2_insert"><img class="img_insert"
					src="/controller/resources/images/phone.png">��ȭ��ȣ</th>
				<th><input id="ipt_insert" type="text" name="phone" value="${ list.phone }"></th>
			</tr>
			<tr>
				<th id="tr2_insert"><img class="img_insert"
					src="/controller/resources/images/age.png">�������</th>
				<th><input id="ipt_insert" type="text" name="age" value="${ list.age }"></th>
			</tr>
			<tr>
				<th id="tr2_insert"><img class="img_insert" src="/controller/resources/images/address.png">�ּ�</th>
				<th>
				<input id="postcode" type="text" id="postcode" placeholder="�����ȣ" name="postcode" value="${ list.postcode }">
				<input class="submit" type="button" onclick="execDaumPostcode()" value="�����ȣ ã��"><br>
				<input id="address" type="text" id="address" placeholder="�ּ�" name="address" value="${ list.address }">
				<input id="address2" type="text" id="address2" placeholder="���ּ�" name="address2" value="${ list.address2 }">

				</th>
			</tr>
			<tr>
				<th id="tr2_insert"><img class="img_insert"
					src="/controller/resources/images/gender.png">����</th>
				<th>
				<input id="ipt_insert" type="text" name="gender"
						value="${ list.gender }">
				</th>
			</tr>
				<tr>
					<th id="tr2_insert"><img class="img_insert"
						src="/controller/resources/images/area.png">����</th>
					<th><input id="ipt_insert" type="text" name="area"
						value="${ list.area }" readonly="readonly"></th>
				</tr>

			<tr>
				<th></th>
				<th><input id="button_insert" width="40" type="image"
					src="/controller/resources/images/check.png" onclick="checkPW();return false;">
					<input type="hidden" name="position"
						value="${ list.position }">
				</th>
			</tr>
			</c:forEach>
		</table>
	</form>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function checkPW() {
	
	var check = document.getElementById('pwd').value;
	
	if ((check == "" || check == null)) {
        alert("��й�ȣ�� �Է����ּ���");
        return false;
	} else
	document.submit.submit();
}


function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

            // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var fullAddr = ''; // ���� �ּ� ����
            var extraAddr = ''; // ������ �ּ� ����

            // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
            if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                fullAddr = data.roadAddress;

            } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                fullAddr = data.jibunAddress;
            }

            // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
            if(data.userSelectedType === 'R'){
                //���������� ���� ��� �߰��Ѵ�.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // �ǹ����� ���� ��� �߰��Ѵ�.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
            document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
            document.getElementById('address').value = fullAddr;

            // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
            document.getElementById('address2').focus();
        }
    }).open();
}
</script>
</body>
</html>