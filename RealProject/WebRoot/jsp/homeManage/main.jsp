<%@page import="java.util.HashMap"%>
<%@page import="com.holyshit.domain.Document"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
<%@include file="/head.jsp" %>
	<script type="text/javascript">
		menus[0].className="active nav-current";
		menus[0].role="presentation";	
	</script>
    <!-- Bootstrap -->
	
</head>

<body>
	
	
	<script type="text/javascript">
		//ajax请求上传文件
		function submitNotice(){
			
			var formdata=new FormData();
			var file=document.getElementById("newsfile").files;
			var filename=document.getElementById("newsfile").value;
			//数据校验
			if(document.getElementById("newstitle").value==""){
				alert("请输入公告标题");
				return;
			}
			if(filename==""){
				alert("请选择上传公告文件");
				return;
			}
			var houzhui=filename.substring(filename.indexOf(".")+1,filename.length);
			if(houzhui!="html"){
				alert("请上传html文件");
				return;
			}
			formdata.append("file_1",file[0]);
			formdata.append("noticetitle",document.getElementById("newstitle").value);
			var req=new XMLHttpRequest();
			req.onreadystatechange=function(){
				if(req.readyState==4){
					if(req.status==200){
						if(req.responseText=="ok"){
							alert("公告发布成功");
							location.reload(true);
						}else{  //显示报错信息
							alert(req.responseText);	
						}
					}
				}
			};
			
			req.open("post", "${pageContext.request.contextPath}/web/servlet/uploadNotice");
			req.send(formdata);
		}
	</script>
    <section>
    	<div class="container-fluid">
    	  <div class="row">
    	    <div class="col-lg-12">  
			  <div class="col-lg-8"> 
    	        <div class="panel panel-primary">
    	            <div class="panel-heading">项目任务列表<span class="more">more..</span></div>
    	            <div class="panel-body">
    	              <div class="row">
					    <div class="col-lg-12">
							<span>当前任务数量：</span><span>${fn:length(tasks)}</span>
							<span class="more">
							 <a href="#" style="margin-right: 15px" onclick = "">按时间排序</a>
							</span>
						</div>
   	                  <div class="col-lg-10 jimode">
    	              <table class="table table-striped">
    	                <tr>
    	                <th>项目名称</th>
    	                <th>任务</th>
    	                <th>开始时间</th>
    	                <th>截止时间</th>
    	                <th>状态</th>
    	                </tr>
						<c:forEach items="${tasks }" var="task" varStatus="hehe" begin="0" end="4" step="1">
						  <c:choose>
  							<c:when test="${task.tstate=='1' }">
    	                      <tr>
							  <td onclick="window.open(${pageContext.request.contextPath})" title="${projectNames[hehe.index] }" name="myabbr" >${projectNames[hehe.index] }<span class="badge">new</td>
							  <td title="${task.taskname }" name="myabbr" >${task.taskname }</td>
							  <td>${task.stime }</td>
							  <td>${task.etime }</td>	
							  <td class="text-success">正常进行中</td>	
							  </tr>
							</c:when>
							<c:when test="${task.tstate=='2' }">
							  <tr>
						      <td onclick="window.open()" title="${projectNames[hehe.index] }" name="myabbr" >${projectNames[hehe.index] }<span class="badge">new</td>
							  <td title="${task.taskname }" name="myabbr" >${task.taskname }</td>
							  <td>${task.stime }</td>
							  <td>${task.etime }</td>	
							  <td class="text-danger">逾期进行中</td>	
							  </tr>
							  </c:when>
  						  </c:choose>
  						</c:forEach>
    	              </table>
    	              </div>
    	            </div>
    	        </div>
    	      </div>
    	        <div class="panel panel-primary">
						<div class="panel-heading">项目进度列表<span class="more">more..</span></div>
						<div class="panel-body">
						  <div class="row">
						  <div class="col-lg-12">
								<span>当前参与的项目数量：</span><span>${fn:length(projects) }</span>
								<span class="more">
								 <a href="#" style="margin-right: 15px" onclick = "">按时间排序</a>
								</span>
							</div>
						  <div class="col-lg-10 jimode">
					<!--	  进度条的占比需要修改标签内的style:width属性-->
						  <table class="table table-striped">
							<tr>
							<th>项目名称</th>
							<th>项目进度</th>
							<th>开始时间</th>
							<th>截止时间</th>
							<th>状态</th>
							</tr>
							<c:forEach items="${projects }" var="project" begin="0" end="4">
							
							<c:choose>
	  							<c:when test="${project.pstate=='1' }">
								<tr>
							    <td onclick="window.open('/RealProject/web/servlet/judgeStageExist?pno=${project.pno }')" title="${project.pname }" name="myabbr" >${project.pname }</td>
							    <td><div class="progress">
							    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${project.pstage*100}%;min-width: 2em;">
							    ${project.pstage*100}%
							    </div>
							    </div></td>
							    <td>${project.stime }</td>
							    <td>${project.etime }</td>
								<td class="text-success">正在进行中</td>
								</c:when>
	  						</c:choose>
	  						<c:choose>
	  							<c:when test="${project.pstate=='2' }">
								<tr>
							    <td onclick="window.open('/RealProject/web/servlet/judgeStageExist?pno=${project.pno }')" title="${project.pname }" name="myabbr" >${project.pname }</td>
							    <td><div class="progress">
							    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${project.pstage*100}%;min-width: 2em;">
							    ${project.pstage*100}%
							    </div>
							    </div></td>
							    <td>${project.stime }</td>
							    <td>${project.etime }</td>
								<td class="text-danger">逾期进行中</td>
								</c:when>
	  						</c:choose>
	  						
						  </c:forEach>   	          
						  </table>
						  </div>
						</div>
					</div>
				  </div>
    	      </div>
    	     <!-- 公告栏部分 -->
    	      <div class="col-lg-4">
    	        <div class="panel panel-primary">
    	        	<div class="panel panel-heading">公告中心<span class="more" onclick="window.open('${pageContext.request.contextPath}/jsp/homeManage/news.jsp')">more..</span></div>
						<div class="list-group">
						<c:forEach items="${notices['noticelist'] }" var="notice" begin="0" end="4" step="1" varStatus="status">
							<a href="${pageContext.request.contextPath}/web/servlet/lookNotice?noticeno=${notice.noticeno}" class="list-group-item">${notice.noticetitle }<br><span class="uptime small"><fmt:formatDate value="${notice.pubtime }" type="both"/></span></a>
						</c:forEach>
						  
						<c:forEach begin="${fn:length(notices['noticelist']) }" end="4" step="1">
							<a href="#" class="list-group-item">-<br><span class="uptime small">-</span></a>
						</c:forEach>
						  <a class="list-group-item">&nbsp;
						  <!-- 指定管理员 -->
						  <c:if test="${staff.staffno=='201526010001' }">
						  	<button type="button" class="btn btn-primary" style="float: right;" data-toggle="modal" data-target="#handupNews">发布</button>
						 	<br><br>
						  </c:if>
	
						  </a>
						</div>
    	        </div>
    	    <!--    你们先做成这个地方点击就能直接下载文件吧……-->
    	        <div class="panel panel-primary">
    	        	<div class="panel panel-heading">最新消息<span class="more" onclick="window.open('${pageContext.request.contextPath}/jsp/homeManage/info.jsp')">more..</span></div>
						<div class="list-group">
  						    <c:forEach items="${staffDoc['docs'] }" begin="0" end="7" step="1" var="doc">
						      <a href="${pageContext.request.contextPath}/web/servlet/downLoadMessage?dno=${doc.dno}" class="list-group-item"><span class="glyphicon glyphicon-file"></span>${doc.dtitle }<br><div class="small"><span class="uptime">><fmt:formatDate value="${doc.uploadtime }" type="both"/></</span>&nbsp;&nbsp;&nbsp;<span>上传者：${doc.uloadpno }</span>&nbsp;&nbsp;&nbsp;<span>文件类型：${doc.ftype }</span></div></a>
						    </c:forEach>
						</div>
    	        </div>
    	        </div>
    	      </div>
    	    </div>
    	  </div>
    	</div>
    </section>
    
    <!--  默认隐藏的内容:发布公告-->
  <div class="modal fade" id="handupNews" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">发布公告</h4>
      </div>
      <div class="modal-body">
		  <form class="form-horizontal">
			  <div class="form-group">
					<span style="color: red;position: relative;left: 10%;">提示：请上传正确的html文件</span>
			  </div>
		  		<div class="form-group">
				<label for="newsname" class="col-sm-2 control-label">公告主题</label>
				<div class="col-sm-8">
		            <input type = "text" id="newstitle">
				</div>
			  </div>
		  
			  	<div class="form-group">
				<label for="addfile" class="col-sm-2 control-label">公告文件</label>
				<div class="col-sm-8">
		            <input type = "file" id="newsfile" multiple="multiple">
				</div>
			  </div>
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
        <button type="button" class="btn btn-primary" onclick="submitNotice();">发布</button>
      </div>
    </div>
  </div>
</div>
    
    <%@include file="/footer.jsp" %>
	<!--实现文本缩略-->
	<script type="text/javascript"> 
    var mylist = document.getElementsByName("myabbr");
	for (var i = 0; i < mylist.length; i++){
		mylist[i].innerHTML = mylist[i].innerHTML.substring(0, 8)+"...";
	}
	</script>
</body>
</html>
