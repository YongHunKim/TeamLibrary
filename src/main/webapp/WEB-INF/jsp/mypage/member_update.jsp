<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ����</title>
<script>
function check_field() {
	var f = $('#join_form');
	var email = $('#mem_email').val();
	var tel = $('#mem_tel').val();
	var pwd = $('#mem_pwd').val();
	if (pwd == '' || pwd.length < 4 || pwd.length >12) {
		alert('��й�ȣ�� �˸°� �Է����ּ���. ��й�ȣ�� 4~12�ڸ��Դϴ�.');
		return;
	}
	
	var regTel = new RegExp("(^[0][1][0,1,6,7,9]-[0-9]{3,4}-[0-9]{4}$)");
	if(tel != '' && !regTel.test(tel)){
		alert('��ȭ��ȣ ������ �ùٸ��� �ʽ��ϴ�.');
		return;
	}
	
	var regEmail = new RegExp("(^[a-zA-Z][a-zA-Z0-9]{1,}@[a-zA-Z0-9]{1,}.[a-z]{1,}$)");
	if(email != '' && !regEmail.test(email)){
		alert('�̸��� ������ �ùٸ��� �ʽ��ϴ�.');
		return;
	}
	
	f.submit();
}

function updatecancel(){
	location.href="/main/main.do";
}
</script>
</head>
<body>
	<div align="center">
		<form action="member_update_ok.do" method="post">
			<table>
				<tr>
					<th style="line-height: 2.2;">ȸ��ID</th>
					<td class="lLine">${id}</td>
				</tr>
				<tr>
					<th style="line-height: 2.2;">��й�ȣ</th>
					<td class="lLine"><input type="password" name="pwd"
						id="mem_pwd" value="" class="form-controll" size="16"
						maxlength="16"></td>
				</tr>
				<tr>
					<th>��й�ȣ ���Է�</th>
					<td><input type="password" name="pwd" value="" size="16"
						maxlength="16" /></td>
				</tr>
				<tr>
					<th style="line-height: 2.2;">�̸�</th>
					<td class="lLine">${name}</td>
				</tr>
				<tr>
					<th style="line-height: 2.2;">�޴�����ȣ</th>
					<td class="lLine"><input type="text" name="tel" id="mem_tel"
						value="${ tel }" class="form-controll" size="16" maxlength="16">
					</td>
				</tr>
				<tr>
					<th style="line-height: 2.2;">�̸���</th>
					<td class="lLine"><input type="text" name="email"
						id="mem_email" value="${ email }" class="form-controll" size="16"
						maxlength="16"></td>
				</tr>
				<tr>
					<th style="line-height: 2.2;">�����ȣ <span class="essential"></span></th>
					<td class="lLine"><input type="text" name="post" id="mem_post"
						value="" class="form-controll" size="16" maxlength="16" readonly>
						<input type="button" class="btn btn-diable" value="�����ȣ ã��"
						onclick="getpostcode('mem_post','mem_addr1');" /></td>
				</tr>

				<tr>
					<th style="line-height: 2.2;">�ּ� <span class="essential"></span></th>
					<td class="lLine"><input type="text" name="addr1"
						id="mem_addr1" value="${ addr2 }" class="form-controll" size="30"
						maxlength="25" readonly>&nbsp;&nbsp; <input type="text"
						name="addr2" id="mem_addr2" value="${ addr2 }"
						class="form-controll" size="30" maxlength="25"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="����"
						class="btn btn-primary" id="update_submit_btn"
						onclick="check_field()" />&nbsp;&nbsp; <input type="button"
						value="���" class="btn btn-primary" onclick="updatecancel()" /></td>
				</tr>

			</table>
		</form>
	</div>
	<div id="postcode-layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		<img
			src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeDaumPostcode()" alt="�ݱ� ��ư">
	</div>

</body>
<script>
// �����ȣ ã�� ȭ���� ���� element
var element_layer = document.getElementById('postcode-layer');

function closeDaumPostcode() {
    // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
    element_layer.style.display = 'none';
}

function getpostcode(elemzip,elemaddr) {
    new daum.Postcode({
        oncomplete: function(data) {
            // �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

            // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var fullAddr = data.address; // ���� �ּ� ����
            var extraAddr = ''; // ������ �ּ� ����

            // �⺻ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
            if(data.addressType === 'R'){
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
            document.getElementById(elemzip).value = data.zonecode; //5�ڸ� �������ȣ ���
            document.getElementById(elemaddr).value = fullAddr;

            // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
            // (autoClose:false ����� �̿��Ѵٸ�, �Ʒ� �ڵ带 �����ؾ� ȭ�鿡�� ������� �ʴ´�.)
            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%'
    }).embed(element_layer);

    // iframe�� ���� element�� ���̰� �Ѵ�.
    element_layer.style.display = 'block';

    // iframe�� ���� element�� ��ġ�� ȭ���� ����� �̵���Ų��.
    initLayerPosition();
}

// �������� ũ�� ���濡 ���� ���̾ ����� �̵���Ű���� �ϽǶ�����
// resize�̺�Ʈ��, orientationchange�̺�Ʈ�� �̿��Ͽ� ���� ����ɶ����� �Ʒ� �Լ��� ���� ���� �ֽðų�,
// ���� element_layer�� top,left���� ������ �ֽø� �˴ϴ�.
function initLayerPosition(){
    var width = 500; //�����ȣ���񽺰� �� element�� width
    var height = 460; //�����ȣ���񽺰� �� element�� height
    var borderWidth = 5; //���ÿ��� ����ϴ� border�� �β�

    // ������ ������ ������ ���� element�� �ִ´�.
    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    // ����Ǵ� ������ ȭ�� �ʺ�� ���� ���� �����ͼ� �߾ӿ� �� �� �ֵ��� ��ġ�� ����Ѵ�.
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}
</script>

</html>