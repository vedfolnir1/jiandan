<%--
  Created by IntelliJ IDEA.
  User: vedfolnir
  Date: 2019/11/20
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>树洞</title>
    <c:set var="prc" value="${pageContext.request.contextPath}"/>
    <script src="${prc}/js/jquery-3.0.0.min.js"></script>
    <script src="${prc}/js/bootstrap.js"></script>
    <script src="${prc}/js/bootstrap-paginator.js"></script>
    <link href="${prc}/css/bootstrap.min.css" rel="stylesheet">
    <script>
        $(function () {
            fetchData(1);
        })
    </script>
</head>
<body>
<c:import url="header.jsp"/>
<%--以下为主体部分--%>
<div class="container" style="padding: 0.2% 2% 2% 2%;border-style: ridge" id="showblog">
    <%--//显示帖子的地方--%>
    <div class="col" id="showallblogs">
    </div>
<%--//分页插件--%>
    <div id="pagetable" class="col-xs-offset-4">
        <table>
            <nav aria-label="Page navigation">
                <ul class="pagination pagination-lg" ></ul>
            </nav>
        </table>
    </div>
    <%--以下为发表帖子的区域--%>
    <div style="border-style:solid;border-width:1px;margin: 10px 0 0 0"  class="col-xs-offset-6" id="addblog">
        <table role="form" >
            <div class="form-group">
                <h3 class="text-center">发表帖子</h3>
            </div>
            <div class="form-group">
                <label for="bloguser">用户：</label>
                <b id="bloguser">${currentuser.username}</b>
            </div>
            <div class="form-group">
                <label for="blotitle">贴子标题：</label>
                <input class="form-control" id="blotitle" name="blogtitle" style="width: 30%">
            </div>
            <div class="form-group">
                <label for="blogtext">文本：</label>
                <textarea class="form-control" id="blogtext" name="profile" rows="3" placeholder="不超过120字"></textarea>
            </div>
            <div class="form-group">
                <label for="imgsrc">图片地址</label>
                <input id="imgsrc" type="url" name="imageurl" style="width: 30%"/>
                <button class="btn btn-default" type="button" onclick="showimgsrc()">确认</button><br/>
                <img src="" class="img-responsive" width="140px" id="blogimg" style="display: none" >
            </div>
        </table>
        <div class="form-group">
            <button class="btn btn-default" onclick="addblog()">提交贴子</button>
        </div>
    </div>
 </div>
<script type="application/javascript"></script>
<script>
    //查询贴子
    function fetchData(currentpage) {
        $.ajax({
            type: "get",
            url:`${prc}/blog/findAllBlogsBybid.do`,
            data:{size:4,page:currentpage,bid:2},
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
                    //评论系统
                    let commmentinput=$("<input type='text' style='width: 80%' placeholder='输入评论'>");
                     commmentinput.appendTo($ul);
                    $("<button >提交</button><br/>").click(function () {
                        let userid ="${currentuser.id}";
                        if (userid==""){
                            alert("请先登录");
                            return false;
                        }
                        let ctext=commmentinput.val();
                        if (ctext==null||ctext.trim("\s").length==0){
                            alert("请输入评论");
                            return false;
                        }
                        let cdate = new Date();
                        let commentdate = cdate.getFullYear()+"-"+cdate.getMonth()+"-"+cdate.getHours()+" "+cdate.getHours()+":"+cdate.getSeconds();
                        let cdata={
                            uid:userid,
                            uname:'${currentuser.username}',
                            bgid:bgid,
                            ctext:ctext,
                            cdate:commentdate
                        };
                        $.post({
                            url:"${prc}/comment/addComment.do",
                            contentType:"application/json",
                            data:JSON.stringify(cdata),
                            success:function (data) {
                                alert(data["cmsg"]);
                                commmentinput.val("");
                            },
                            error:function () {
                                alert("评论失败");
                            }
                        })
                    }).appendTo($ul);
                    //显示评论
                    let $cul=$('<ul></ul>');
                    let cbtn=$("<button class='btn btn-info '>显示评论</button>");
                    var cflag=1;
                    cbtn.click(function () {
                        $.ajax({
                            type:"get",
                            url:`${prc}/comment/findCommBybgid.do`,
                            data:{bgid:bgid,size:10,page:1},
                            success:function (cdata) {
                                $cul.empty();
                                if (cflag==1){
                                    $cul.show();
                                    cflag=0;
                                }else {
                                    $cul.hide();
                                    cflag=1;
                                }
                                let crows= cdata["rows"];
                                let cnum = 1;
                                $.each(crows ,function() {
                                    $("<li style='font-size: larger'></li>").html(cnum+". "+this["uname"]+":  "+this["ctext"]).appendTo($cul);
                                    cnum++;
                                    $cul.appendTo($ul);
                                })
                            }
                        })
                    });
                    $ul.append(cbtn);
                    $ul.append($("<span>   </span>"));
                    $("#showallblogs").append($ul);
                });
                totalpages=(data["total"]/4)+1;
                setPage(currentpage,totalpages);
            }
        })
    }
    //分页
    function setPage(currentpages,totalpages) {
        $('.pagination').bootstrapPaginator({
            bootstrapMajorVersion: 3,
            currentPage:currentpages,
            numberOfPages: 3,
            totalPages:totalpages,
            onPageClicked:function (event, originalEvent, type, page) {
                fetchData(page);
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
        //先根据用户id是否存在判断是否登录
        let userid ="${currentuser.id}";
        if (userid==""){
            alert("请先登录");
            return false;
        }
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
            bid: 2,
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
</body>
</html>
