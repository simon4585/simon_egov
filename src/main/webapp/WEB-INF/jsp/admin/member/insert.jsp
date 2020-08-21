<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>

  <!-- Content Wrapper. Contains page content -->
   <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
         <div class="container-fluid">
            <div class="row mb-2">
               <div class="col-sm-6">
                  <h1 class="m-0 text-dark">DashBoard Management</h1>
               </div>
               <!-- /.col -->
               <div class="col-sm-6">
                  <ol class="breadcrumb float-sm-right">
                     <li class="breadcrumb-item"><a href="#">Home</a></li>
                     <li class="breadcrumb-item active">Starter Page</li>
                  </ol>
               </div>
               <!-- /.col -->
            </div>
            <!-- /.row -->
         </div>
         <!-- /.container-fluid -->
         <div class="col-md-12">
            <!-- general form elements disabled -->
            <div class="card card-warning">
               <div class="card-header">
                  <h3 class="card-title">insert Member</h3>
               </div>
               <!-- /.card-header -->
               <div class="card-body">
                  <form id="insertForm" name="insertForm" role="form" action="<c:url value='/'/>admin/member/insertMember.do" method="post">
                     <div class="row">
                        <div class="col-sm-12">
                           <div class="form-group">
                              <label>사용자아이디</label> 
                              <input type="text" class="form-control"
                                 id="EMPLYR_ID" name="EMPLYR_ID" value="${memberVO.EMPLYR_ID}" >
                           </div>
                        </div>
                        <div class="col-sm-12">
                           <div class="form-group">
                              <label>사용자 암호</label> 
                              <input type="text" class="form-control"
                                 name="PASSWORD" value="" >
                           </div>
                        </div>
                        <div class="col-sm-12">
                           <!-- text input -->
                           <div class="form-group">
                              <label>사용자 이름</label> 
                              <input type="text" class="form-control"
                                 name="USER_NM" value="${memberVO.USER_NM}" >
                           </div>
                        </div>

                        <div class="col-sm-12">
                           <!-- text input -->
                           <div class="form-group">
                              <label>우편번호</label> 
                              <input type="text" class="form-control"
                                 name="ZIP" value="${memberVO.ZIP}" >
                           </div>
                        </div>

                        <div class="col-sm-12">
                           <!-- text input -->
                           <div class="form-group">
                              <label>집주소</label> 
                              <input type="text" class="form-control"
                                 name="HOUSE_ADRES" value="${memberVO.HOUSE_ADRES}" >
                           </div>
                        </div>
                           <div class="col-sm-12">
                           <div class="form-group">
                              <label>이메일</label> 
                              <input type="text" class="form-control"
                                 name="EMAIL_ADRES" value="${memberVO.EMAIL_ADRES}" >
                           </div>
                        </div>
                        <div class="col-sm-12">
                           <div class="form-group">
                              <label>권한레벨</label> 
                              <select name="GROUP_ID" class="form-control">
                                      <c:forEach var="auth" items="${authVO}">
                                         <option value="${auth.GROUP_ID}"
                                         <c:if test="${auth.GROUP_ID == memberVO.GROUP_ID}">selected="selected"</c:if>
                                         >
                                         ${auth.GROUP_NM}</option>
                                      </c:forEach>               
                                 </select>
                           </div>
                        </div>
                        <div class="col-sm-12">
                           <div class="form-group">
                              <label>소속기관</label> 
                              <input type="text" class="form-control"
                                 name="ORGNZT_ID" value="${memberVO.ORGNZT_ID}" >
                           </div>
                        </div>
                        <div class="col-sm-12">
                           <div class="form-group">
                              <label>휴면계정여부</label> 
                              <input type="text" class="form-control"
                                 name="EMPLYR_STTUS_CODE" value="P" readonly="" >
                           </div>
                        </div>
                        
                        <div class="form-group">
                      </div>
                      <input type="hidden" name="ESNTL_ID" value="${memberVO.ESNTL_ID}" />
                      <input type="hidden" name="PASSWORD_HINT" value="${memberVO.PASSWORD_HINT }"/>
                      <input type="hidden" name="PASSWORD_CNSR" value="${memberVO.PASSWORD_CNSR }"/>
                    <div class = "buttons">
                        <button type="button"  id="btn_insert" disavled class="btn btn-warning">CREATE</button>
                        <button type="button" onclick='location.href="<c:url value='/'/>admin/member/selectMember.do"' class="btn btn-primary">이전페이지</button>
                     </div>
                     </div>
                     
                  </form>
               </div>
               <!-- /.content-header -->

               <!-- Main content -->
               <div class="content"></div>
               <!-- .content  -->
            </div>
            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
               <!-- Control sidebar content goes here -->
               <div class="p-3">
                  <h5>Title</h5>
                  <p>Sidebar content</p>
                  <button type="button" class="btn btn-primary btn-lg btn-block">로그아웃</button>
               </div>
            </aside>
            <!-- /.control-sidebar -->
         </div>
      </div>
   </div>
  <!-- ./Contents Wrap -->
  
<%@ include file="../include/footer.jsp" %>
<script>
$(document).ready(function(){
	$("#EMPLYR_ID").blur(function)({
		$.ajax({
			type : "get",
			url:"",
			success:function(result){
				if(result == '1') {
					//전송버튼 비활성화
	               alert("중복아이디가 존재합니다.");
	               $("#btn_insert").attr("disabled", true);
	               $("#btn_insert").css({"opacity":"0.5","background-color":"grayscale"});
						
				}else{
					//전송버튼 활성화
		               alert("사용가능한 아이디 입니다.");
		               $("#btn_insert").attr("disabled", false);
		               $("#btn_insert").css({"opacity":"1","background-color":"white"});
				
			},
			error:function(){
	            alert("RestAPI서버가 작동하지 않습니다.");
			
		});
		
	});
   $("#btn_insert").click(function(){
      var submitOK = true; // 기본값은 전송하십시오
      $("#insertForm .form-control").each(function(){
         if($(this).val() == ''){
            alert($(this).attr("name") + "폼 내용은 필수 입력 값입니다.");
            submitOK = false;//빈 값이 발생하면 전송하지 마세요
            return false;//each 반복문을 중지하세요.
         }
      });
      if(submitOK == true){//OK변수 빈 값이 없을때만 전송합니다.
         $("#insertForm").submit();
      }
   });
});
</script>