<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ETC-用户管理</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="http://v3.bootcss.com/favicon.ico">
	<!-- Bootstrap core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=basePath%>css/jquery-ui.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="<%=basePath%>css/dashboard.css" rel="stylesheet">
	<link href="<%=basePath%>css/page.css" rel="stylesheet">
	<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	<script src="<%=basePath%>js/ie-emulation-modes-warning.js"></script>
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/page.js"></script>
	<script type="text/javascript" src="<%=basePath%>myjs/users.js"></script>
  </head>
  
  <body>
    <jsp:include page="../public/navheader.jsp"></jsp:include>
        <div class="container-fluid">
		<div class="row">		
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li ><a href="<%=basePath%>emp/adminindex.do">首页<span class="sr-only">(current)</span></a></li>
				<li ><a href="<%=basePath%>signed/signedinfo.do">签单客户</a></li>
				<li ><a href="<%=basePath%>signed/firstincomepay.do">收入支出</a></li>
				<%-- <li class="active"><a href="<%=basePath%>customer/manager.do">客户管理</a></li>
				<li><a href="<%=basePath%>student/management.do">学员管理</a></li>
				<li><a href="<%=basePath%>empinfo/empmanagement.do">员工管理</a></li>
				<li><a href="<%=basePath%>paycode/Codes.do">业务管理</a></li>
				<li><a href="<%=basePath%>paycode/reports.do">数据统计</a></li> --%>
			</ul>
			<ul class="nav nav-sidebar">
				<%--<li><a href="<%=basePath%>empinfo/showMe.do"><i class="manager"></i>个人中心</a></li> --%>
				<li class="active"><a href="<%=basePath%>user/haveuserinfo.do">用户管理</a></li>
				<li ><a href="<%=basePath%>roleperm/roleinfo.do">角色权限管理</a></li>
			</ul>
			<div id="tree"></div>
		</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">				
				<h1 class="page-header">用户管理</h1>
				<div class="text-right">
					 <form class="navbar-form navbar-right" role="search">
				        <div class="form-group">
				          <input class="form-control input-sm" placeholder="请输入用户姓名" type="text" id="serchName" name="serchName">
				       	  <input value="1" id="searchetype" name="searchetype" type="hidden">
				        </div>
				        <a class="btn btn-default btn-sm" onclick="searcheByName()">搜索</a>
				      </form>
				</div>
				<ul class="nav nav-pills">
					<li class="active"><a href="#haveuseremp" data-toggle="tab">已有用户的员工</a></li>
					<li><a href="#nulluseremp" data-toggle="tab">没有用户的员工</a></li>

				</ul>
				<div class="container" style="height:20px;"></div>
				<div class="tab-content">
					<div class="tab-pane fade in active" id="haveuseremp">
						<input value="${pages }" id="pagecount" type="hidden">
						<div class="btn-group"> 
							<button id="btn_edit" type="button" class="btn btn-sm btn-success" onclick="updateuserinfo()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true">修改用户</span>
							</button>
							<button id="btn_delete" type="button" class="btn btn-sm btn-warning" onclick="delectuserinfo()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true">删除用户</span>
							</button>
						</div>
						<table class="table table-striped table-hover table-responsive table-bordered " id="haveusertable">
							<thead>
								<tr>
								  <th>&nbsp;</th>
								  <th colspan="5" align="center" >员工信息</th>
								  <th colspan="3" align="center">用户信息</th>
								  </tr>
								<tr>
								  <th><input type="checkbox" id="alluseremp" ></th>
								  <th>姓名</th>
								  <th>性别</th>
								  <th>出生年月</th>
								  <th>部门</th>
								  <th>职务</th>
								  <th>用户名</th>
								  <th>角色</th>
								  <th>权限</th>
								</tr>
							  </thead>
							  <tbody>
							  	<c:if test="${empty viewUserEmpallinfo }">
							  		暂时没有相关数据
							  	</c:if>
							  	<c:forEach items="${viewUserEmpallinfo }" var="viewUser">
							  		<tr>
							  			<td><input type="checkbox" name="alluseremp_checkbox" value="${viewUser.eid }"  ></td>
							  			<td>${viewUser.ename }</td>
							  			<td>${viewUser.esex }</td>
							  			<td>${viewUser.ebrithday }</td>
							  			<td>${viewUser.dName }</td>
							  			<td>${viewUser.ejob }</td>
							  			<td>${viewUser.username }</td>
							  			<td>${viewUser.rdescription }</td>
							  			<td>${viewUser.pdescription }</td>
							  		</tr>
							  	</c:forEach>
							  </tbody>
						</table>
						<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
					</div>

					<div class="tab-pane fade" id="nulluseremp">
							<input value="${nullpages }" id="nullpagecount" type="hidden">
							<div class="btn-group">
							<button id="btn_add" type="button" class="btn btn-sm btn-success" onclick="addinfo()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true">新增用户</span>
							</button>
						</div>
						<table class="table table-striped table-hover table-responsive table-bordered" id="nullusertable"><tr><td>没有相关数据</td></tr></table>
						<!-- 分页按钮  -->
						<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
  </body>
</html>
					        		