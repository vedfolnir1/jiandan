<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>用户管理</title>
    <c:set var="prc" value="${pageContext.request.contextPath}"/>
    <script src="${prc}/js/jquery-3.0.0.min.js"></script>
    <script src="${prc}/js/bootstrap.js"></script>
    <script src="${prc}/js/bootstrap-paginator.js"></script>
    <link href="${prc}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        td{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container-fluid" style="border-style:solid;border-color:dimgrey;margin:0 0 1px 0;padding: 0 0 0 0">
        <nav class="navbar navbar-inverse" style="margin: 0 0 0 0">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="${prc}/index.jsp">首页</a>
                </div>
                <div class="col-xs-offset-6 ">
                    <a class="navbar-brand" href="#" style="font-size:xx-large ">用户管理</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" >
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown" id="usermenu">
                            <%--aria-expanded:表示展开状态--%>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">欢迎你${currentuser.username}<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a  href="#" >用户管理</a></li>
                            </ul>
                        </li>
                        <li><a href="${prc}/userManager/logout.do">登出</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
</div>
<%--正文区域--%>
<div class="container-fluid" style="margin: 1px 0 0 0;border-style: solid;padding: 0 2px 0 2px;">
    <%--左边--%>
    <div class="col-xs-2  nav" style="background-color:inherit;border-right-style: solid;margin: 5px 0 5px 0" id="left-menu" >
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation"><a href="#blogtable" class="btn btn-primary">查询帖子</a></li>
            <li role="presentation"><a href="#commenttable" class="btn btn-primary">查询评论</a></li>
            <li role="presentation"><a href="#addblog" class="btn btn-primary">发布公告</a></li>
        </ul>
    </div>
        <%--右边--%>
    <div class="col-xs-10 " style="margin: 5px 0 5px 0; overflow-y:auto; height:650px;" id="right-menu">
        <%--查询帖子--%>
        <h3 class="text-center">查询您的贴子</h3>
        <table class="table table-bordered table-condensed" id="blogtable">
            <tr id="btitle">
                <td>序号</td>
                <td>贴子id</td>
                <td>贴子标题</td>
                <td>贴子内容</td>
                <td>图片地址</td>
                <td>发帖时间</td>
            </tr>
        </table>
        <div id="blogpagetable" class="col-xs-offset-4">
            <table>
                <nav aria-label="Page navigation">
                    <ul id="blogpage" class="pagination pagination-lg" ></ul>
                </nav>
            </table>
        </div>
            <%--查询评论--%>
            <h3 class="text-center">查询您的贴子</h3>
            <table class="table table-bordered table-condensed" id="commenttable">
                <tr id="bcomment">
                    <td>序号</td>
                    <td>评论id</td>
                    <td>所评论帖子的id</td>
                    <td>评论内容</td>
                    <td>评论时间</td>
                </tr>
            </table>
            <div id="commentpagetable" class="col-xs-offset-4">
                <table>
                    <nav aria-label="Page navigation">
                        <ul id="commentpage" class="pagination pagination-lg" ></ul>
                    </nav>
                </table>
            </div>
            <%--以下为发表帖子的区域--%>
            <div style="border-top-style: solid;border-width:1px;margin: 20px 0 0 0"  class="col-xs-offset-6" id="addblog">
                <table role="form" >
                    <div class="form-group">
                        <h3 class="text-center">发表公告</h3>
                    </div>
                    <div class="form-group col-xs-offset-1">
                        <label for="bloguser">用户：</label>
                        <b id="bloguser">${currentuser.username}</b>
                    </div>
                    <div class="form-group col-xs-offset-1">
                        <label for="blotitle">贴子标题：</label>
                        <input class="form-control" id="blotitle" name="blogtitle" style="width: 30%">
                    </div>
                    <div class="form-group col-xs-offset-1">
                        <label for="blogtext">文本：</label>
                        <textarea class="form-control" id="blogtext" name="profile" rows="3" placeholder="不超过120字"></textarea>
                    </div>
                    <div class="form-group col-xs-offset-1">
                        <label for="imgsrc">图片地址</label>
                        <input id="imgsrc" type="url" name="imageurl" style="width: 30%"/>
                        <button class="btn btn-default" type="button" onclick="showimgsrc()">确认</button><br/>
                        <img src="" class="img-responsive" width="140px" id="blogimg" style="display: none" >
                    </div>
                </table>
                <div class="form-group col-xs-offset-1">
                    <button class="btn btn-default" onclick="addblog()">发布公告</button>
                </div>
            </div>
    </div>
</div>
</body>
<script>
    $(function () {
        fetchData(1);
        fetchDataforcom(1);
    });
    function fetchData(currentpage) {
        $.ajax({
            type: "get",
            url:`${prc}/blog/findAllBlogsByuid.do`,
            data:{size:4,page:currentpage,uid:${currentuser.id}},
            success:function (data) {
                let brows = data["rows"];
                let bnum=1;
                $("#btitle").nextAll().remove();
                $.each(brows,function () {
                    let $tr = $("<tr></tr>");
                    $("<td></td>").html(bnum).appendTo($tr);
                    bnum++;
                    $("<td></td>").html(this["id"]).appendTo($tr);
                    $("<td></td>").html(this["blogtitle"]).appendTo($tr);
                    let $button = $("<button class='btn btn-info'>正文</button>");
                    let profile=this["profile"];
                    $button.click(function () {
                        alert(profile);
                    });
                    $("<td></td>").html($button).appendTo($tr);
                    let $a=$("<a>图片</a>");
                    if (this["imageurl"]!=""){
                        $a.attr("href",this["imageurl"]);
                    }else {
                        $a.html("无图");
                    }
                    $("<td></td>").html($a).appendTo($tr);
                    $("<td></td>").html(this["jdate"]).appendTo($tr);
                    $("#blogtable").append($tr);
                });
                totalpages=(data["total"]/4)+1;
                setPage(currentpage,totalpages);
            }
        })
    }
    function setPage(currentpage,totalpages) {
        $("#blogpage").bootstrapPaginator({
            bootstrapMajorVersion: 3,
            currentPage:currentpage,
            numberOfPages: 3,
            totalPages:totalpages,
            onPageClicked:function (event, originalEvent, type, page) {
                fetchData(page);
            }
        })
    }
    //查询贴子
    function fetchDataforcom(currentpage) {
        $.ajax({
            type: "get",
            url:`${prc}/comment/findCommByuid.do`,
            data:{size:4,page:currentpage,uid:${currentuser.id}},
            success:function (data) {
                let crows = data["rows"];
                let cnum=1;
                $("#bcomment").nextAll().remove();
                $.each(crows,function () {
                    let $tr = $("<tr></tr>");
                    $("<td></td>").html(cnum).appendTo($tr);
                    cnum++;
                    $("<td></td>").html(this["id"]).appendTo($tr);
                    $("<td></td>").html(this["bgid"]).appendTo($tr);
                    let $button = $("<button class='btn btn-info'>正文</button>");
                    let ctext=this["ctext"];
                    $button.click(function () {
                        alert(ctext);
                    });
                    $("<td></td>").html($button).appendTo($tr);
                    $("<td></td>").html(this["cdate"]).appendTo($tr);
                    $("#commenttable").append($tr);
                });
                totalpages=(data["total"]/4)+1;
                setPageforcom(currentpage,totalpages);
            }
        })
    }
    function setPageforcom(currentpage,totalpages) {
        $("#commentpage").bootstrapPaginator({
            bootstrapMajorVersion: 3,
            currentPage:currentpage,
            numberOfPages: 3,
            totalPages:totalpages,
            onPageClicked:function (event, originalEvent, type, page) {
                fetchDataforcom(page);
            }
        })
    }
    //输入图片地址，点击确认后能够显示缩略图
    function showimgsrc() {
        let imgsrc=$("#imgsrc").val();
        let blogimg = $("#blogimg");
        blogimg.attr("src",imgsrc);
        if (imgsrc!=null||imgsrc!=""){
            blogimg.css("display","inline")
        }
    }
    //提交帖子
    function addblog() {
        let userid=${currentuser.id}
        if(userid!=1){
            alert("您非管理员");
            return false;
        }
        //先根据用户id是否存在判断是否登录
        //判断正文内容是否存在或者是否超过120字
        let blogtext= $("#blogtext").val();
        if (blogtext==null||blogtext.trim("\s").length==0){
            alert("请输入正文");
            return false;
        }
        if (blogtext.length>120){
            let overlettercount=blogtext.length-120;
            alert("正文字数超出了"+overlettercount);
            return false;
        }
        //转换date为字符串
        let bdate = new Date();
        let blogdate = bdate.getFullYear()+"-"+bdate.getMonth()+"-"+bdate.getHours()+" "+bdate.getHours()+":"+bdate.getSeconds();
        //定义数据
        let blogdata={
            uid:'${currentuser.id}',
            jdate:blogdate,
            bid: 1,
            profile:blogtext,
            imageurl:$("#imgsrc").val(),
            blogtitle:$("#blotitle").val()
        };
        //提交数据
        $.ajax({
            type:"post",
            url:"${prc}/blog/addblog.do",
            contentType:"application/json",
            data:JSON.stringify(blogdata),
            success:function (data) {
                alert(data["message"]);
                location.reload();
            }
        })
    }
</script>
</html>