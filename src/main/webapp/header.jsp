<%--
  Created by IntelliJ IDEA.
  User: vedfolnir
  Date: 2019/11/14
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="prc" value="${pageContext.request.contextPath}"/>
    <link href="${prc}/css/bootstrap.min.css" rel="stylesheet">
    <script>
        $(function () {
            var username="${currentuser.username}";
            if (username==null||username==""){
                $("#usermenu").hide();
            }
        })
    </script>
<div class="container" onclick="window.location.href='${prc}/index.jsp'">
    <div class="row">
        <div class="col-xs-1" >
            <img src="${prc}/image/logo-2018.gif">
        </div>
        <div class="col-xs-2" style="margin: 0px 5px 0px 25px">
            <p style="padding: 25px 0 15px 15px ">世界上没有新鲜事</p>
        </div>
    </div>
</div>
<div class="container">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <%--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>--%>
                <a class="navbar-brand" href="${prc}/index.jsp">首页</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li ><a href="${prc}/textpage.jsp">树洞</a></li>
                    <li><a href="#">Link</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown" id="usermenu">
                        <%--aria-expanded:表示展开状态--%>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${currentuser.username}<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${prc}/usermanager.jsp">用户管理</a></li>
                            <li><a href="${prc}/userManager/logout.do">登出</a></li>
                        </ul>
                    </li>
                    <li><a href="${prc}/login.jsp">登录</a></li>
                    <li><a href="${prc}/register.jsp">注册</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>


