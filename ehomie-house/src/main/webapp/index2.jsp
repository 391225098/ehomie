<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lesee管理系统</title>
<style type="text/css">


</style>
   <link href="/storeadmin/css/index.css" rel="stylesheet" type="text/css" />
  <script
	src="/storeadmin/easyui/jquery.min.js"
	type="text/javascript"></script>
 <script type="text/javascript">
	$(document).ready(function() {
		$(".menu_common_li").each(function(){
			$(this).click(function(){
				if($(this).hasClass("menu_ignore_li")){
					$(".menu_focus_li").each(function(){
						$(this).removeClass("menu_focus_li").addClass("menu_ignore_li");
						$(this).children("ul").css("display","none");
					});
					$(this).removeClass("menu_ignore_li").addClass("menu_focus_li");
					$(this).children("ul").css("display","block");
					
				}else if($(this).hasClass("menu_focus_li")){
					$(this).removeClass("menu_focus_li").addClass("menu_ignore_li");
					$(this).children("ul").css("display","none");
				}
			});
			
			$(this).hover(function(){
			 $(this).css("cursor","pointer");
			});
		});
				
		$(".second_menu_li").each(function(){
			$(this).click(function(event){
				event.stopPropagation();
			});
		});
		
		$(".second_menu_li > a").each(function(){
			$(this).click(function(){
				$(".second_menu_li > a").each(function(){
					$(this).removeClass("menu_a_selected").addClass("menu_a_ignore");
				});
				$(this).removeClass("menu_a_ignore").addClass("menu_a_selected");
			});
		});
		
		$("#search_input").focus(function(){
			$(this).select();
		});
		
		
		$(".h_menu").each(function(){
			$(this).click(function(){
				$(".active").each(function(){
					$(this).addClass("noactive").removeClass("active");
				});
				$(this).removeClass("noactive").addClass("active");
			$(".container").each(function(){
				$(this).hide();
			});
			var did = $(this).attr("data-tab");
			$("#"+did).show();
			});
		});
		
		(function(){
				$(".h_menu").each(function(){
					var did = $(this).attr("data-tab");
					var b = $(this).hasClass("active");
					if(b){
						$("#"+did).show();
					}else{
						$("#"+did).hide();
					}
				});
				
				var h1 = $("html").height();
				var h2 = $("#top_color").height();
				var h3=$("#header").height();
			    var height=h1-h2-h3-250;
				
				
				$(".myframe").each(function(){
					$(this).css("height",height);
					$(this).load(function(){
						var mainheight = $(this).contents().height();
						$(this).height(mainheight);
						});
				});
			})();
	});

     function check() {
         $.get("/storeadmin/login/setSession.action");
     }
 </script>

</head>
<body>
	<div id="layout">
	<div id="top_color"></div>
		<div id="header">
			<div class="header_content">
				<div id="logo"></div>
				<ul id="navigation">
					<li id="home_icon" class="h_menu noactive" data-tab="home">首页</li>
					<li id="data_icon" class="h_menu  active" data-tab="data">数据分析</li>
					<li id="check_icon" class="h_menu noactive" data-tab="check" onclick="check()">店面自检</li>
					<li id="manage_icon" class="h_menu noactive" data-tab="manage">管理</li>
				</ul>
				<div id="interactive">
					<div class="interactive_focus">简体中文</div>
					<div class="interactive_ignore">English</div>
					<div class="interactive_ignore">帮助中心</div>
					<div class="interactive_ignore">问题反馈</div>
					<div class="interactive_ignore">
						<select><option>用户xxx</option></select>
					</div>
				</div>
				<div id="search">
					<input id="search_input" value="请输入关键词" type="text" />
				</div>
			</div>
		</div>
		<div id="body">
			<div class="space">
			<div id="check" class="container">
				<div class="sidebar">
						<ul >
							<li class="menu_common_li menu_ignore_li"><span>任务管理</span>
							<ul class="second_menu_ui">
									<li class="second_menu_li"><a class="menu_a_ignore" href="/storeadmin/adminuser/userPage.action" target="check_iframe">用户测试</a></li>
									<li class="second_menu_li"><a class="menu_a_ignore" href="/storeadmin/task/findTaskPageList.action" target="check_iframe">任务信息</a></li>
									<li class="second_menu_li"><a class="menu_a_ignore" href="/storeadmin/question/findQuestionPageList.action" target="check_iframe">题目信息</a></li>
							</ul>
							</li>
						 
							<li class="menu_common_li menu_ignore_li"><span>成绩管理</span>
								<ul class="second_menu_ui">
									<li class="second_menu_li"><a href="/storeadmin/score/findScorePageList.action" target="check_iframe">成绩查询</a></li>
									<li class="second_menu_li"><a href="/storeadmin/score/findScoreRecheck1PageList.action" target="check_iframe">一次成绩复核</a></li>
									<li class="second_menu_li"><a href="/storeadmin/score/findScoreRecheck2PageList.action" target="check_iframe">二次成绩复核</a></li>
									<li class="second_menu_li"><a href="/storeadmin/score/findScoreFinalPageList.action" target="check_iframe">最终分修改记录</a></li>
								</ul></li>
								<li class="menu_common_li menu_ignore_li"><span>申诉管理</span>
								<ul class="second_menu_ui">
									<li class="second_menu_li"><a href="/storeadmin/appeal/findAppealPageList.action" target="check_iframe">申诉列表</a></li>
								</ul></li>
						</ul>
	
					</div>
						<div class="content">
							<iframe id="check_iframe" name="check_iframe" class="myframe" src=""> </iframe>
						</div>
					</div>
			<div id="data" class="container">
			<div class="sidebar">
					<ul >
						<li class="menu_common_li "><span>出样管理</span></li>
						<li class="menu_common_li menu_ignore_li"><span>出样预警</span>
						<ul class="second_menu_ui">
								<li class="second_menu_li"><a class="menu_a_ignore" href="${pageContext.request.contextPath}/setting/quarter/show" target="data_iframe">季度设置</a></li>
								<li class="second_menu_li"><a class="menu_a_ignore" href="${pageContext.request.contextPath}/setting/month/show" target="data_iframe">财月设置</a></li>
								<li class="second_menu_li"><a class="menu_a_ignore" href="${pageContext.request.contextPath}/pages/setting/network/networkset" target="data_iframe">网络设置</a></li>
								<li class="second_menu_li"><a class="menu_a_ignore" href="${pageContext.request.contextPath}/pages/show/alarm/network/showstorenetwork" target="data_iframe">网络查看</a></li>
								<li class="second_menu_li"><a class="menu_a_ignore" href="${pageContext.request.contextPath}/pages/show/alarm/app/monthalarm" target="data_iframe">财月目标达成预警</a></li>
								<li class="second_menu_li"><a class="menu_a_ignore" href="${pageContext.request.contextPath}/pages/show/alarm/app/quarteralarm" target="data_iframe">季度目标达成预警</a></li>
								<li class="second_menu_li"><a class="menu_a_ignore" href="${pageContext.request.contextPath}/pages/show/alarm/report/pagesratealarm" target="data_iframe">当季展位使用率</a></li>
								<li class="second_menu_li"><a class="menu_a_ignore" href="${pageContext.request.contextPath}/pages/show/alarm/exception/exceptionalarmdata" target="data_iframe">周转预警</a></li>
								<li class="second_menu_li"><a class="menu_a_ignore" href="${pageContext.request.contextPath}/pages/alarm/app" target="data_iframe">预警数据展现</a></li>
							</ul>
						
						
						</li>
						<li class="menu_common_li menu_ignore_li"><span>出样统计</span></li>
						<li class="menu_common_li menu_ignore_li"><span>出样详情</span></li>
						<li class="menu_common_li menu_ignore_li"><span>壁纸管理</span></li>
						<li class="menu_common_li menu_ignore_li"><span>客流分析</span>
							<ul class="second_menu_ui">
								<li class="second_menu_li"><a>客流量</a></li>
								<li class="second_menu_li"><a>体验人次</a></li>
								<li class="second_menu_li"><a>回头客率</a></li>
								<li class="second_menu_li"><a>成交率</a></li>
							</ul></li>
						<li class="menu_common_li menu_ignore_li"><a>展陈分析</a></li>
						<li class="menu_common_li menu_ignore_li"><a>店面视图</a></li>
						<li class="menu_common_li menu_ignore_li"><a>店面管理</a></li>
					</ul>

				</div>
				<div class="content">
					<iframe id="data_iframe" name="data_iframe" class="myframe"   src="">
					</iframe>
				</div>
				</div>
			</div>
		</div>
		<div id="foot">
			<div style=" height: 14px; line-height: 14px;width:auto;text-align: center;padding-left:420px;margin:40px auto 0px auto;">
						<div class="foot_label"><a href="#">关于我们</a></div> 
						<div class="foot_label"><a href="#">问题反馈</a></div> 
						<div class="foot_label"><a href="#">帮助中心</a></div> 
						<div class="foot_end_label"><a href="#">Switch to English Version</a></div>
			 
			</div>
			<div class="version">2015-2019 Lesee.com, All Rights Reserved.</div>
		</div>
	</div>
</body>
</html>
