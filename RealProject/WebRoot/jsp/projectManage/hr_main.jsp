<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>01-hrfirst</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css"  type="text/css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"  type="text/css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/echarts.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css">
	<script type="text/javascript">
		function checkAll(){
			var flag=document.getElementById("ckAll").checked;
			var ids=document.getElementsByName("ids");
			for(var i=0;i<ids.length;i++)
			{
				ids[i].checked=flag;
			}
		}
		
		function delAllStaffs(){
		    alert("shaziaaaa");
			var ids = document.getElementsByName(ids);
			var str="";
			for(var i=0;i<ids.length;i++)
			{
				if(ids[i].checked)
				{
					str+="ids="+ids[i].value+"&";
				}
			}
			alert("shaziaaaa");
			str=str.substring(0,str.length-1);
			alert(str);
			if(str!="")
				alert("shazi123");
				location.herf="${pageContext.request.contextPath}/servlet/delAllStaffsServlet?"+str;
			
		}
	</script>
  </head>
  <body> 
   <!-- 页眉-->   
     <header>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!-- start logo -->
                    <span class="blanding"><img src="${pageContext.request.contextPath}/image/logo.png" width="100px">面向电力工程项目管理</span>
                    <!-- end logo -->
                </div>
            </div>
        </div>
      </header>
 <!--   导航栏-->
  	<div>
        <nav class="navbar navbar-default">
          <div class="conta{
          iner-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">Brand</a>
            </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li><a href="#">首页</a></li>
              <li class="active nav-current" role="presentation"><a href="01-projectmanagerfirst 01.html">项目管理<span class="sr-only">(current)</span></a></li>
              <li><a href="#">文档管理</a></li>
              <li><a href="moneymanage.html">资金管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="#">用户XXX</a></li>
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"  aria-haspopup="true" aria-expanded="false">通知<span class="badge">10</span> <span class="caret"></span></a>
				  <ul class="dropdown-menu">
					<li><a href="#">聊天消息<span class="badge" style="float: right">4</span></a></li>
					<li><a href="#">审核信息<span class="badge" style="float: right">4</span></a></li>
		            <li><a href="#">任务<span class="badge" style="float: right">2</span></a></li>
			      </ul>
              </li>
            </ul>
         </div><!-- /.navbar-collapse -->
       </div><!-- /.container-fluid -->
     </nav>
  </div>
<!--  主要内容-->
  <section>
    <div class=container-fluid>
    	<div class="row">
    		<main class="col-lg-12 main-content">
    		<!--图表-->
    		<div class="col-lg-8 xumode">
   	        <div class="panel panel-primary">
    	        <div class="panel-heading">当前项目已参与人员</div>
      	        <div class="panel-body">
                <div class="col-lg-12" >
 
					<div>
						<a href="${pageContext.request.contextPath}/hr_add.jsp" style="color:white;"><button type="button" class="btn btn-primary" style="float: right;">增加</button></a>
						<br/><br/>
					</div>
					
					<table class="table table-striped table-condensed" style="font-size: 15px">
						<tr>
							<th><input type="checkbox" id="ckAll" onclick="checkAll()" /></th>
							<th>员工编号</th>
							<th>员工姓名</th>
							<th>联系方式</th>
							<th>职责</th>
							<th>备注</th>
							<th>发送信息</th>
							<th>资格证</th>
						</tr>
					<c:forEach items="${Staff}" var="s" >
						<tr>
							<td align="center"><input type="checkbox" name="ids" /></td>
							<td align="center">${s.staffno }</td>
							<td align="center">${s.name }</td>
							<td align="center">${s.te }</td>
							<td align="center">${s.duty }</td>
							<td align="center">老大<span class="glyphicon glyphicon-pencil" style="cursor: pointer"></span></td>
							<td align="center"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#handupAc">发送</button></td>
							<td align="center"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#handupBc" herf="${pageContext.request.contextPath}/servlet/qualificationListServlet?staffno=${s.staffno}" >查看</button></td>
						</tr>
					</c:forEach>
					</table>
					
					
						<!--  分页栏-->
					<nav aria-label="Page navigation" style="text-align: center">
				  <ul class="pagination">
					<li>
					  <a href="#" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					  </a>
					</li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li>
					  <a href="#" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					  </a>
					</li>
				  </ul>
				</nav>
					<div>
                <button type="button" class="btn btn-primary" style="float: right;" data-toggle="modal" onclick="delAllStaffs()" >删除</button>
                <br/><br/>
            </div>		
                </div>
                </div>
				
            </div> 
				<button type="button" class="btn btn-primary" style="float: right;"><a href="main.html"></a>返回</button>	
    		</div>
    		</main>
    	</div>
    </div>
</section>
<!--默认隐藏的内容:发送消息-->
  <div class="modal fade" id="handupAc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">发送消息</h4>
      </div>
      <div class="modal-body">
		  <form class="form-horizontal">

		  		<div class="form-group">
				<label for="projectname" class="col-sm-2 control-label">消息主题</label>
				<div class="col-sm-8">
		            <input class="form-control" id="projectname">
				</div>
				</div>
				<div class="form-group">
				<label for="projecttype" class="col-sm-2 control-label">发件地址</label>
				<div class="col-sm-8">
			    wangnima@gmail.com
				</div>
			  	</div>
				<div class="form-group">
				<label for="projecttype" class="col-sm-2 control-label">收件地址</label>
				<div class="col-sm-8">
			    12345677@gmail.com
				</div>
			  	</div>
			  	<div class="form-group">
				<label for="addfile" class="col-sm-2 control-label">相关附件</label>
				<div class="col-sm-8">
		            <input type = "file" id="checkman">
				</div>
			  </div>

			  
             <div class="form-group">
				<label for="others" class="col-sm-2 control-label">主要内容</label>
				<div class="col-lg-8">
				  <textarea class="form-control" rows="4"></textarea>
				</div>
			  </div>
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
        <button type="button" class="btn btn-primary">发送</button>
      </div>
    </div>
  </div>
</div>
<!-- 资格证-->

<div class="modal fade" id="handupBc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">资格证查看</h4>
      </div>
      <div class="modal-body">
		  <table class="table table-striped table-condensed" style="font-size: 15px">
		<tr>
			<th>职业资格证</th>
		</tr>
	<c:forEach items="${Qualification}" var="q" >
		<tr>
			<td><abbr title="大学时获得">${q.qualifdesc }</abbr></td>
		</tr>
	</c:forEach>
	 </table>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
        
      </div>
    </div>
  </div>
</div>

<!-- 确认删除 -->
<div class="modal fade" id="handupCc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">确定删除</h4>
      </div>
      <div class="modal-body">
		  <div>您确定要删除以下人员吗？</div>
		  <table class="table table-striped table-condensed" style="font-size: 15px">
		<tr>
			<th>人员名单</th>
		</tr>
		<tr>
			<td><abbr title="员工编号：xyz11111119">yy</abbr></td>
		</tr>
		<tr>
			<td><abbr title="员工编号：xyz22221111">rr</abbr></td>
		</tr>
		<tr>
			<td><abbr title="员工编号：xyz33211111">kk</abbr></td>
		</tr>
		
	 </table>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
        <button type="button" class="btn btn-primary">确定</button>
      </div>
    </div>
  </div>
</div>
  
  <footer class="copyright">
  <div class="container-fluid">
      	<p>©版权归谭莹小组所有</p>
  </div>
  </footer>
  </body>
</html>