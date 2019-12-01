<%--
  Created by IntelliJ IDEA.
  User: vedfolnir
  Date: 2019/11/14
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>首页</title>
    <c:set var="prc" value="${pageContext.request.contextPath}"/>
    <script src="${prc}/js/jquery-3.0.0.min.js"></script>
    <script src="${prc}/js/bootstrap.js"></script>
    <link href="${prc}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<c:import url="header.jsp"/>
<div class="container" style="padding: 0.2% 2% 2% 2%;border-style:ridge">
    <div class="col-xs-10" style="margin: 5px 0 5px 0;border-right-style: ridge" id="left-menu">
        <div class="col" id="showallblogs">
        </div>
    </div>
    <div class="col-xs-2" style="margin: 5px 0 5px 0; " id="right-menu">
        <p>公告</p>
        <p>仿煎蛋的简易论坛</p>
        <p>1.0版本</p>
        <p>后端:ssm+shiro</p>
        <p>前端:jquery+bootscarp</p>
        <p>数据库相关:mysql+druid</p>
        <p>服务器:tomcat</p>
    </div>
</div>

</ul>
</body>
<script>
    $(function () {
        fetchData(1);
    });
    function fetchData(currentpage) {
        $.ajax({
            type: "get",
            url:`${prc}/blog/findAllBlogsBybid.do`,
            data:{size:4,page:currentpage,bid:1},
            success:function (data){
                //帖子数据存储在rows中
                let rows = data["rows"];
                //在页面中给帖子添加序号
                let blognum=1;
                $("#showallblogs").empty();
                $.each(rows, function () {
                    let $ul =$(`<ul style="margin:10px 0 10px 0;border-bottom-style: ridge" ></ul>`);
                    //贴子的id
                    let bgid=this["id"];
                    $ul.prop("id",bgid);
                    $("<h3 style='text-align: center'></h3>").html(this["blogtitle"]).appendTo($ul);
                    $("<p style='font-size: large;text-wrap: normal'></p>").html(blognum+". "+this["profile"]).appendTo($ul);
                    blognum=blognum+1;
                    let img=$(`<img class="col-xs-offset-3" style="width: 300px" alt="该贴无图片"><br/><br/>`);
                    img.prop("src",this["imageurl"]);
                    img.click(function () {
                        if (img.css("width")=="300px"){
                            img.css("width","500px");
                        }else {
                            img.css("width","300px");
                        }
                    })
                    if (this["imageurl"]!=""){
                        $ul.append(img);
                    }
                    $ul.append($("<span>   </span>"));
                    $("#showallblogs").append($ul);
                });
                totalpages=(data["total"]/4)+1;
                setPage(currentpage,totalpages);
            }
        })
    }
</script>
</html>
