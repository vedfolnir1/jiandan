<%--
  Created by IntelliJ IDEA.
  User: vedfolnir
  Date: 2019/11/17
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>注册</title>
    <c:set var="prc" value="${pageContext.request.contextPath}"/>
    <script src="${prc}/js/jquery-3.0.0.min.js"></script>
    <script src="${prc}/js/bootstrap.js"></script>
    <link href="${prc}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<c:import url="header.jsp"/>
<div class="container">
    <h2 class="<%--col-xs-offset-5 col-md-offset-5 col-lg-offset-5 col-xl-offset-5--%> text-center" style="padding-bottom: 2%">用户注册</h2>
    <form class="form-horizontal col-xs-offset-3 col-md-offset-3 col-lg-offset-3 col-xl-offset-3" action="${prc}/userManager/register.do"
          id="registform" onsubmit="return check()" method="post">
        <div class="form-group">
            <label for="inputusername" class="col-sm-2 control-label">用户名</label>
            <div class="col-xs-10">
                <input type="text" class="form-control" id="inputusername" name="username"
                       placeholder="用户名为3-8位的字母数字组合" style="width: 50%">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">密码</label>
            <div class="col-xs-10">
                <input type="password" class="form-control" id="inputPassword" name="password"
                       placeholder="密码为数字和字母的8-16位组合" style="width: 50%">
            </div>
        </div>
        <div class="form-group">
            <label for="inputemail" class="col-sm-2 control-label">邮箱</label>
            <div class="col-xs-10">
                <input type="text" class="form-control" id="inputemail" name="email"
                       placeholder="邮箱 " style="width: 50%">
            </div>
        </div>
        <div class="form-group">
            <label for="inputnickname" class="col-sm-2 control-label">昵称</label>
            <div class="col-xs-10">
                <input type="text" class="form-control" id="inputnickname" name="nickname"
                       placeholder="昵称 选填" style="width: 50%">
            </div>
        </div>
        <div class="form-group">
            <label for="veridycode" class="col-sm-2 control-label">验证码</label>
            <div class="col-xs-10">
                <input type="text" class="form-control"  name="veridycode"
                        style="width: 20%">
                <img src="${prc}/userManager/veridyCode.do" id="veridycode" onclick="changeVeridyCode()">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" >注册</button>
                <p id="msg" style="color: crimson"></p>
                <p id="register" style="color: crimson">${registermsg}</p>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    var error = $("#msg");
    function changeVeridyCode() {
        var img=$("#veridycode");
        var newsrc="${prc}/userManager/veridyCode.do?"+new Date().getTime();
        img.attr("src",newsrc);
    }
     function check() {
         var username=$("#inputusername").val();
         var usernameRule=/^[0-9A-Za-z]{3,12}$/;
         if(!usernameRule.test(username)){
             error.html("用户名格式错误");
             return false;
         }
         var password=$("#inputPassword").val();
         var passwordRule=/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,16}$/;
         if (!passwordRule.test(password)){
             error.html("密码格式错误");
             return false;
         }
         var email = $("#inputemail").val();
         var emailRule=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
         if (!emailRule.test(email)){
             error.html("邮箱格式错误");
             return false;
         }
         return true;
     }
</script>
</html>

