<%--
  Created by IntelliJ IDEA.
  User: vedfolnir
  Date: 2019/11/18
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>登录</title>
    <c:set var="prc" value="${pageContext.request.contextPath}"/>
    <script src="${prc}/js/jquery-3.0.0.min.js"></script>
    <script src="${prc}/js/bootstrap.js"></script>
    <link href="${prc}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<c:import url="header.jsp"/>
<div class="container">
    <h2 class="<%--col-xs-offset-5 col-md-offset-5 col-lg-offset-5 col-xl-offset-5--%> text-center" style="padding-bottom: 2%">用户登录</h2>
    <form class="form-horizontal col-xs-offset-3 col-md-offset-3 col-lg-offset-3 col-xl-offset-3" action="${prc}/userManager/login.do"
          id="registform" onsubmit="return check()" method="post">
        <div class="form-group">
            <label for="inputusername" class="col-sm-2 control-label">用户名</label>
            <div class="col-xs-10">
                <input type="text" class="form-control" id="inputusername" name="username"
                       placeholder="用户名或邮箱" style="width: 50%">
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
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" >登录</button>
                <p id="msg" style="color: crimson"></p>
                <p id="register" style="color: crimson">${loginmsg}</p>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    var error = $("#msg");
    function check() {
        var inputusername=$("#inputusername");
        var username=inputusername.val();
        var emailRule=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
        var usernameRule=/^[0-9A-Za-z]{3,12}$/;
        /*先验证是否是邮箱，再做判断*/
        if(emailRule.test(username)){
            inputusername.attr("name","email");
            return checkPassword();
        }
        if(!usernameRule.test(username)){
                error.html("用户名格式错误");
                return false;
        }
        return checkPassword;
    }
    function checkPassword() {
        var password=$("#inputPassword").val();
        var passwordRule=/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,16}$/;
        if (!passwordRule.test(password)){
            error.html("密码格式错误");
            return false;
        }
        return true;
    }
</script>
</html>
