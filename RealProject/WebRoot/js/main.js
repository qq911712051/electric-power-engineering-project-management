//获取下一页
function getNextTaskPage(){
	if(task_cur==1){
		var page=document.getElementById("task_page");
		var node1=page.getElementsByTagName("a")[0];
		node1.className="";
	}
	task_cur++;
	
	//进行数据获取
	task_getTaskData();
	
	
}


//获取下一页  项目
function getNextProjectPage(){
	if(project_cur==1){
		var page=document.getElementById("project_page");
		var node1=page.getElementsByTagName("a")[0];
		node1.className="";
	}
	project_cur++;
	if(project_cur==project_pageNum){
		//进行数据获取
		project_getProjectData();
		var page=document.getElementById("project_page");
		var node1=page.getElementsByTagName("a")[1];
		node1.className="disabled";
	}else if(project_cur<project_pageNum){
		//进行数据获取
		project_getProjectData();
	}
	
}
//获取上一页  项目
function getPreProjectPage(){
	if(project_cur==project_pageNum){
		var page=document.getElementById("project_page");
		var node1=page.getElementsByTagName("a")[1];
		node1.className="";
	}
	project_cur--;
	if(project_cur==1){
		//进行数据获取
		project_getProjectData();
		var page=document.getElementById("project_page");
		var node1=page.getElementsByTagName("a")[0];
		node1.className="disabled";
	}else if(project_cur>1){
		//进行数据获取
		project_getProjectData();
	}
	
}
