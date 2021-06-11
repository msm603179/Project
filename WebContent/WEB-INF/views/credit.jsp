<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var='timet' value="${timet }"/>
    <c:set var='timeb' value="${time }"/>
    <c:set var='timepc' value="${timep }"/>
    <c:set var='name' value="${name }"/>
        <c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
var IMP = window.IMP; 
IMP.init('imp27909889'); 
          
IMP.request_pay({
    pg : 'kakaopay', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '${timet}',
    amount : '${timep}',
    buyer_email : 'chin410@naver.com',
    buyer_name : '최인영',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 마포구 양화로 72 420호',
    buyer_postcode : '04044',
    m_redirect_url : '${root}'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        const uri=encodeURI('${root}creditsuc?timet=${timet}&time=${time}&timep=${timep}&name=${name}');
        location.href = uri
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});
</script>

</head>
<body>

</body>
</html>