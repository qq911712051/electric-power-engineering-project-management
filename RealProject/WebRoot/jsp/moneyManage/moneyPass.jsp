<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>相关项目报账审批</title>

</head>

<body>
	<!-- 网页头部 -->
	<%@ include file="/head.jsp"%>
   <script type="text/javascript">
		menus[3].className="active nav-current";
		menus[3].role="presentation";	
	</script>
	<script type="text/javascript">
		var auditData;
		function getFunction(cur){
			var req = new XMLHttpRequest();
				req.onreadystatechange=function(){
					if(req.readyState==4){
						if(req.status==200){
							var res=req.responseText;
							//数据刷新
							var data=eval('('+res+')');
						
							auditData=data.audits;
						
							currentPage=data.currentPage;
						 	pageSize=data.pageSize;
						    pageNum=data.pageNum;  
						 	totalNum=data.totalNum; 
							refreshData();	
						}
					}
				};
				
				req.open("get", "${pageContext.request.contextPath}/web/servlet/showAuditPage?currentPage="+cur+"&pageSize=5");
				req.send(null);
		}
		
		function getAuditInfo(){
   			var req=new XMLHttpRequest();
   			req.onreadystatechange=function(){
				if(req.readyState==4){
					if(req.status==200){
						var res=req.responseText;
						var hehe=eval('('+res+')');
						auditData=hehe.audits;

					 	currentPage=hehe.currentPage;
					 	pageSize=hehe.pageSize;
					   	pageNum=hehe.pageNum;  
					 	totalNum=hehe.totalNum;
					 	currentGroup=1;
					 	groupSize=5;
					 	groupNum=pageNum%groupSize==0?parseInt(pageNum/groupSize):parseInt(pageNum/groupSize)+1;
						
					 	//刷新分页栏
					 	if(pageNum<5){
							for(var i=2;i<=pageNum;i++){
								var node=document.createElement("li");
								node.innerHTML='<a href="javascript:jmpPage('+i+')">'+i+'</a>';
								showpage.appendChild(node);
							}
						}else{
							for(var i=2;i<6;i++){
								var node=document.createElement("li");
								node.innerHTML='<a href="javascript:jmpPage('+i+')">'+i+'</a>';
								showpage.appendChild(node);
							}
						}
					 	var node1=document.createElement("li");
					 	node1.innerHTML=' <a href="javascript:getNext(showpage);" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>';
						showpage.appendChild(node1);
					 	refreshData();
					}
					
				}
			};
			req.open("get", "/RealProject/web/servlet/showAuditPage?currentPage=1&pageSize=5");
			req.send(null);
  		}
		function refreshData(){
			
			var nodes=document.getElementById("audittable").getElementsByTagName("tr");
			for(var i=0;i<auditData.length;i++){
				
				var tds=nodes[i+1].getElementsByTagName("td");
				tds[0].innerHTML=auditData[i].pname;
				tds[1].innerHTML=auditData[i].sname;
				tds[2].innerHTML=auditData[i].taskname;
				tds[3].innerHTML=auditData[i].appname;
				tds[4].innerHTML=auditData[i].stime;
				tds[5].innerHTML="￥"+auditData[i].fee+"元";
				var state=auditData[i].auditstate;
				if(state=="0"){
					tds[6].innerHTML="未审批";
					tds[6].className="text-danger";
				}
				else if(state=="2"){
					tds[6].innerHTML="审批通过";
					tds[6].className="text-success";
				}else{
					
					tds[6].innerHTML="不通过";
					tds[6].className="text-danger";
				}
				if(auditData[i].over==1){
					tds[7].innerHTML="超标";
					tds[7].className="text-danger";
				}else{
					tds[7].innerHTML="";
					
				}
				
				tds[8].innerHTML='<span class="glyphicon  glyphicon-check" data-toggle="modal"  data-target="#acInfoPass" title="详细" style="cursor: pointer" onclick="updateAuditDialog('+i+')"></span>';
			} 
			for(var i=auditData.length;i<5;i++){	
				var tds=nodes[i+1].getElementsByTagName("td");
				tds[0].innerHTML="-";
				tds[1].innerHTML="-";
				tds[2].innerHTML="-";
				tds[3].innerHTML="-";
				tds[4].innerHTML="-";
				tds[5].innerHTML="-";
				tds[6].innerHTML="-";
				tds[7].innerHTML="-";
				tds[8].innerHTML="-";
			} 
			
			
		}
		
		function updateAuditDialog(e){
   			document.getElementById("audit_pname").innerHTML=auditData[e].pname;
   			document.getElementById("audit_sname").innerHTML=auditData[e].sname;
   			document.getElementById("audit_taskname").innerHTML=auditData[e].taskname;
   			document.getElementById("audit_appname").innerHTML=auditData[e].appname;
   			document.getElementById("audit_stime").innerHTML=auditData[e].stime;
   			document.getElementById("audit_fee").innerHTML=auditData[e].fee;
   			var state=document.getElementById("audit_auditstate");
   			var tmp=auditData[e].auditstate;
   			if(tmp=="0"){
   				state.className="text-danger";
   				state.innerHTML="未审批";
   				submit_audit.removeAttribute("disabled");
   			}else if(tmp=="1"){
   				state.className="text-danger";
   				state.innerHTML="不通过";
   				submit_audit.disabled="disabled";
   			}else{
   				state.className="text-success";
   				state.innerHTML="审批通过";
   				submit_audit.disabled="disabled";
   			}
   		}
	</script>
    <section>
        <div class="container-fluid">
            <div class="row">
              <div class="col-lg-10 xumode">
              <div class="panel panel-primary">
		        <div class="panel-heading"><span>相关项目审批信息</span></div>
		        <div class="panel-body">
		        <table class="table table-striped table-condensed" style="font-size: 15px" id="audittable">
					<tr>
						<th>项目名称</th>
						<th>项目阶段</th>
						<th>任务阶段</th>
						<th>报销人</th>
						<th>报账时间</th>
						<th>报账金额</th>
						<th>状态</th>
						<th> </th>
						<th> </th>
					</tr>
					<tr>
						<td >项目A</td>
						<td >阶段一</td>
						<td >任务一</td>
						<td >甲</td>
						<td >2017-10-11</td>
						<td >￥50.00元</td>
						<td  class="text_danger">未审批</td>
						<td ></td>
						<td><span class="glyphicon glyphicon-check" data-toggle="modal"  data-target="#acInfoPass" title="详细" style="cursor: pointer"></span></td>
					</tr>
					<tr>
						<td >项目A</td>
						<td >阶段一</td>
						<td >任务一</td>
						<td >甲</td>
						<td >2017-10-11</td>
						<td >￥50.00元</td>
						<td  class="text_danger">未审批</td>
						<td ></td>
						<td><span class="glyphicon glyphicon-check" data-toggle="modal"  data-target="#acInfoPass" title="详细" style="cursor: pointer"></span></td>
					</tr>
					<tr>
						<td >项目A</td>
						<td >阶段一</td>
						<td >任务一</td>
						<td >甲</td>
						<td >2017-10-11</td>
						<td >￥50.00元</td>
						<td  class="text_danger">未审批</td>
						<td ></td>
						<td><span class="glyphicon glyphicon-check" data-toggle="modal"  data-target="#acInfoPass" title="详细" style="cursor: pointer"></span></td>
					</tr>
					<tr>
						<td >项目A</td>
						<td >阶段一</td>
						<td >任务一</td>
						<td >甲</td>
						<td >2017-10-11</td>
						<td >￥50.00元</td>
						<td  class="text_danger">未审批</td>
						<td ></td>
						<td><span class="glyphicon  glyphicon-check" data-toggle="modal"  data-target="#acInfoPass" title="详细" style="cursor: pointer"></span></td>
					</tr>
					<tr>
						<td >项目A</td>
						<td >阶段一</td>
						<td >任务一</td>
						<td >甲</td>
						<td >2017-10-11</td>
						<td >￥50.00元</td>
						<td  class="text_danger">未审批</td>
						<td ></td>
						<td><span class="glyphicon glyphicon-check" data-toggle="modal"  data-target="#acInfoPass" title="详细" style="cursor: pointer"></span></td>
					</tr>
					
	        </table>
	        <script type="text/javascript">
	        	
	        	window.onload=function(){
	        		getAuditInfo();
	        	};
        		var audittable=document.getElementById("audittable");
			 	var auditData;
			 	var currentPage=1;
			 	var pageSize=5;
			   	var pageNum;  
			 	var totalNum;
			 	var currentGroup=1;
			 	var groupSize=5;
			 	var groupNum=pageNum%groupSize==0?parseInt(pageNum/groupSize):parseInt(pageNum/groupSize)+1;
			</script>
                                <!--  分页栏-->
				<nav aria-label="Page navigation" style="text-align: center">
				  <ul class="pagination" id="showpage">
				  	<script type="text/javascript">
				  		var showpage=document.getElementById("showpage");
				  	</script>
					<li>
					  <a href="javascript:getPrevious(showpage);" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					  </a>
					</li>
					<li class="active"><a href="javascript:jmpPage(1)">1</a></li>
					<script type="text/javascript">
						
					</script>
				  </ul>
				</nav>
                </div>
              </div>
              </div>
            </div>
        </div>

  <!--      默认隐藏的内容:报账详细信息（审批）-->
  <div class="modal fade bs-example-modal-sm" id="acInfoPass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">详细信息</h4>
      </div>
      <div>
        <table class="table table-striped table-condensed">
        	<tr><td>报账项目</td><td id="audit_pname">项目A</td></tr>       	
        	<tr><td>项目阶段</td><td id="audit_sname">阶段一</td></tr>
        	<tr><td>项目任务</td><td id="audit_taskname">任务一</td></tr>
			<tr><td>报账人</td><td id="audit_appname">甲</td></tr>
        	<tr><td>报账时间</td><td id="audit_stime">2017-10-11</td></tr>        	
        	<tr><td>报账金额</td><td id="audit_fee">￥50.00元</td></tr>
            <tr><td>当前状态</td>
            <td id="audit_auditstate">未审批</td></tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
        <button type="button" class="btn btn-primary" id="submit_audit">审批</button>
        <script type="text/javascript">
        	var submit_audit=document.getElementById("submit_audit");
        </script>
      </div>
    </div>
  </div>
</div>
	
    </section>
    <footer class="copyright">
  <div class="container-fluid">
      	<p>©版权归谭莹小组所有</p>
   
  </div>
  </footer>
</body>
</html>
