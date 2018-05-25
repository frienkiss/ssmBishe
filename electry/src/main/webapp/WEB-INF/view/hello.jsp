<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
 <%@ page isELIgnored="false" %> 
 <%String path = request.getContextPath();  
//http://localhost:8080/项目名/   %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Welcome</title>
<!-- 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<style type="text/css">
html{font-size:16px;}
 body{font-weight:300;font-family:'微软雅黑';margin:0;}
 .el-menu-vertical-demo{height:100%;}
 .el-header{background:#5D656C;position:fixed;width:100%;margin-top:0;z-index:999;top:0}
 .block{margin-right:50px;margin-top:40px;float:left;margin-left:20px}
 .user{float:right;margin-right:3rem;margin-top:20px;font-weight:350;color:rgb(255, 208, 75)}
 .el-submenu__title i{color:#f8f8f8}
 h2{color:rgb(255, 208, 75);margin-top:14px;float:left;width:70%;font-weight:400;font-family:kai}
 h4{color:#828EA8}
 .item{display:none} 
 .item-0{display:block}
.el-table th{background-color:#f8f8f8!important}
.left{width:20%;border-right:1px solid #C9C6C9;height:600px;padding-right:20px;}

    .panel{width:45%;margin:10px;height:200px;float:left;border:1px solid #E0E2E7;margin-right:3%}.panel-header{width:100%;height:30px;background-color:#E0E2E7}
    .panel-header p{margin:0;text-align:center}.panel-body{height:85%;width:100%}
    .panel-sec{width:30%;height:220px;float:left;border:1px solid #E0E2E7;margin-right:1%;margin-left:10px;margin-top:20px}
    .panel-item{float:left;width:49%;height:100%;text-align:center}.panel-body-left{border-right:1px solid #E0E2E7}
    .elec-today,.elec-todaymoney{color:#E79D58;font-size:2rem;margin-right:3px;}.elec-month,.elec-monthmoney{color:#4CB7E7;font-size:2rem;margin-right:3px}
    .foot{font-size:14px;color:rgb(255, 255, 255);}
    .left,.right{float:left}.right{width:78%}.el-select{width:220px;}
    .searchicon{position:relative;top:-32px;left:200px;}
    .alertinfo{position:absolute;top:15px;right:12%;color:rgb(255, 208, 75);font-size:23px}
    .alertNum{border:1px solid red;border-radius:8px;width:16px;height:16px;color:white;background:red;position:absolute;left:16px;top:0;text-align:center
    ;font-size:12px}
    .alertinfo:hover,.searchicon:hover,.index{cursor:pointer}
    .chart{width:47%;height:320px;border:1px solid #999;float:left;}
    .page{position:absolute;right:20px;margin-top:20px;margin-bottom:30px;}
 /*    .el-table-filter:nth-child(1){left:220px!important} */
</style>
</head>
<body>

<div id="app">
<el-container>
  <el-header class="el-header"><h2>电力能源管理平台</h2>
   <div class="alertinfo"><i class="el-icon-bell"></i><div class="alertNum"></div></div> 
  <div class="user">您好:${user.getUsername()}</div></el-header><!-- 或者写user.username -->
  <el-container>
    <el-aside width="200px" style="position:fixed;top:60px;height:100%;">
    	<el-row class="tac" style="height:100%"> 
  <el-col :span="24" style="height:100%">
    <el-menu default-active="0"  class="el-menu-vertical-demo" @open="handleOpen"
      @close="handleClose" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
       <el-menu-item index="0" class="total">
        <i class="el-icon-menu"></i>
        <span slot="title">综合预览</span>
      </el-menu-item>
      <el-submenu index="1">
        <template slot="title">
          <i class="el-icon-view"></i>
          <span>能效管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="1-1" class="fuzai_total">负载总览</el-menu-item>
          <el-menu-item index="1-2" class="fuzai_special">负载特性</el-menu-item>
          <el-menu-item index="1-3" class="max">最值分析</el-menu-item>
          <el-menu-item index="1-4" class="power_view">能流可视化</el-menu-item>
        <!--   <el-menu-item index="1-5">负荷预测</el-menu-item> -->
          <el-menu-item index="1-6" class="co-analysis">碳排放分析</el-menu-item>
        </el-menu-item-group>
      </el-submenu>
     <el-submenu index="2">
        <template slot="title">
          <i class="el-icon-bell"></i>
          <span>节能服务</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="2-1">优化方案</el-menu-item>
          <el-menu-item index="2-2">节能量认定</el-menu-item>
        </el-menu-item-group>
      </el-submenu>
      <el-submenu index="3">
      <template slot="title">
        <i class="el-icon-setting"></i>
        <span>用能分析</span>
        </template>
               <el-menu-item-group>
          <el-menu-item index="3-1">实时汇总</el-menu-item>
          <el-menu-item index="3-2">耗电类比</el-menu-item>
          <el-menu-item index="3-3">耗电时比</el-menu-item>
          <el-menu-item index="3-4">项目对比</el-menu-item>
          <el-menu-item index="3-5" class="error-ana">异常分析</el-menu-item>
          <el-menu-item index="3-6">安全分析</el-menu-item> 
        </el-menu-item-group>
      </el-submenu>
         <el-menu-item index="4" id="message">
        <i class="el-icon-menu"></i>
        <span slot="title">派单处理</span>
      </el-menu-item>
       <el-menu-item index="0" class="total"  style="bottom:0px;position:fixed;width:200px">
         <div class="foot">@CopyRight By bobo</div>
      </el-menu-item>
     
    </el-menu>
  </el-col>
</el-row>

    </el-aside>
    <el-main style="margin-left:200px;margin-top:60px;width:85%">
    <!-- 综合预览 -->
   <!--  style=' background:url("<%=path %>/static/images/indexbg.png") repeat;margin:-20px;padding:20px' -->
    <div class="item item-0">
    		<template>
    			<div class="header-tit">
		  	<h4 style="margin-top:0">综合预览</h4>
		  	<hr style="border:1px solid #f8f8f8"/></div>
		  	<div class="content">
		  		<div class="panel panel-1">
		  			<div class="panel-header"><p>电量</p></div>
		  			<div class="panel-body">
		  				<div class="panel-item panel-body-left"><h4>今日电量</h4>
		  				<span class="elec-today">12123</span><span>kWh</span></div>
		  				<div class="panel-item panel-body-right"><h4>当月累计电量</h4>
		  				<span class="elec-month">121123</span><span>kWh</span></div>
		  			</div>
		  		</div>
		  		<div class="panel panel-2">
		  			<div class="panel-header"><p>电费</p></div>
		  			<div class="panel-body">
		  				<div class="panel-item panel-body-left"><h4>今日电费</h4>
		  				<span class="elec-todaymoney">12123</span><span>元</span></div>
		  				<div class="panel-item panel-body-right"><h4>当月累计电费</h4>
		  				<span class="elec-monthmoney">121123</span><span>元</span></div>
		  			</div>
		  		</div>
		  		<div class="panel-sec panel-3">
		  			<div class="panel-header"><p>实时负荷</p></div>
		  			<div class="panel-body" id="time-fuhe">
		  				
		  			</div>
		  		</div>
		  			<div class="panel-sec panel-4">
		  			<div class="panel-header"><p>当月最大需量</p></div>
		  			<div class="panel-body" id="monthmax">
		  				
		  			</div>
		  		</div>
		  			<div class="panel-sec panel-5">
		  			<div class="panel-header"><p>当日耗电情况</p></div>
		  			<div class="panel-body" id="today-ele">
		  				
		  			</div>
		  		</div>
	  			<div class="panel-sec panel-6">
	  			<div class="panel-header"><p>碳排放对比分析</p></div>
	  			<div class="panel-body" id="co-ana">
	  		
	  			</div>
	  		</div>
	  			<div style="clear:both"></div>
		  		</div>
		  		
    		</template>
    </div> 
    <!-- 负载总览 -->
    <div class="item item-1">
    <el-breadcrumb separator="/" style="margin-bottom:14px">
	  <el-breadcrumb-item class="index">首页</el-breadcrumb-item>
	  <el-breadcrumb-item><a href="/">能效管理</a></el-breadcrumb-item>
	  <el-breadcrumb-item>负载总览</el-breadcrumb-item>
	</el-breadcrumb>
	<template>
	  	<div class="header-tit">
	  	<h4 style="margin-top:0">负载总览</h4>
	  	<hr style="border:1px solid #f8f8f8"/></div>
	    <div class="block">
	    <span class="demonstration">选择日期1</span>
	    <el-date-picker  v-model="powervalue1" id="powervalue1" type="date"  placeholder="选择日期"></el-date-picker>
	    </div>
	    <div class="block">
	    <span class="demonstration">选择日期2</span>
	    <el-date-picker  v-model="powervalue2" id="powervalue2" type="date"  placeholder="选择日期"></el-date-picker>
	   </div>
	    <div class="block">
	    <span class="demonstration">选择日期3</span>
	    <el-date-picker  v-model="powervalue3" id="powervalue3" type="date" placeholder="选择日期"></el-date-picker>
	  </div>
	    <div class="block">
	    <span class="demonstration">选择日期4</span>
	    <el-date-picker v-model="powervalue4"  id="powervalue4" type="date" placeholder="选择日期"> </el-date-picker>
	  </div>
	    <div class="block">
	    <span class="demonstration">选择日期5</span>
	    <el-date-picker v-model="powervalue5" id="powervalue5" type="date"  placeholder="选择日期"></el-date-picker>
	  </div>
	    <div class="block">
	    <span class="demonstration">对比日期&nbsp;</span>
	    <el-date-picker v-model="powervalue6" type="date"  placeholder="选择日期"></el-date-picker>
	  </div>
	  <div style="clear:both"></div>
	  <el-button type="info" style="float:right;position:relative;right:7%;font-weight:300;margin-top:1rem;margin-bottom:1rem;">查询</el-button>
	  <div id="fuhe_total" style="width:96%;height:400px;margin:0 auto;"></div>
</template>
</div>

<!-- 最值分析 -->
<div class="item item-2">
<template>
    <el-breadcrumb separator="/" style="margin-bottom:14px">
	  <el-breadcrumb-item class="index">首页</el-breadcrumb-item>
	  <el-breadcrumb-item><a href="/">能效管理</a></el-breadcrumb-item>
	  <el-breadcrumb-item>最值分析</el-breadcrumb-item>
	</el-breadcrumb>
	<div class="header-tit">
  	<h4 style="margin-top:0">最值分析</h4>
  	<hr style="border:1px solid #f8f8f8"/></div>
    <div class="block" style="margin-left:50px">
    <span class="demonstration">起始日期</span>
    <el-date-picker  v-model="maxStartTime" type="date" placeholder="选择日期"  id="startTime"></el-date-picker>
  </div>
    <div class="block">
    <span class="demonstration">终止日期</span>
    <el-date-picker v-model="maxEndTime"  type="date" placeholder="选择日期" id="endTime"></el-date-picker>
  </div>
  <div class="block">
      <span class="demonstration">时段选择</span>
  <el-select v-model="maxSelectTime" placeholder="请选择">
    <el-option v-for="item in maxOptions" :key="item.value" :label="item.label" :value="item.value"></el-option>
    </div>
  </el-select>
  <div style="clear:both"></div>
  <el-button type="info" id="select" style="float:right;position:relative;right:7%;font-weight:300;margin-top:1rem;margin-bottom:2rem;">查询</el-button>
    <div style="clear:both"></div>
 
</template>
<div id="max_analysis" style="width:96%;height:400px;margin:0 auto;"></div>

  <el-table  :data="maxTableData" stripe  style="width: 100%">
    <el-table-column prop="date" label="日期" width="180"></el-table-column>
    <el-table-column prop="maxload" label="最大负荷" width="180"></el-table-column>
    <el-table-column prop="maxloadtime" label="最大负荷时间"  width="180"></el-table-column>
    <el-table-column  prop="minload" label="最小负荷"></el-table-column>
    <el-table-column prop="minloadtime" label="最小负荷时间"></el-table-column>
  </el-table>
  <el-button :plain="true" @click="open3" id="alert" style="visibility:hidden;position:fixed;">警告</el-button>
</div>

<!-- 能流可视化 -->
<div class="item item-3">
  <el-breadcrumb separator="/" style="margin-bottom:14px">
  <el-breadcrumb-item class="index">首页</el-breadcrumb-item>
  <el-breadcrumb-item><a href="/">能效管理</a></el-breadcrumb-item>
  <el-breadcrumb-item>能流可视化</el-breadcrumb-item>
</el-breadcrumb>
	 <div class="header-tit">
  	<h4 style="margin-top:0">能流可视化</h4>
  	<hr style="border:1px solid #f8f8f8"/></div>
	<div class="left">
		<el-input v-model="filterText"style="margin-top:20px" placeholder="请输入筛选内容"></el-input><i class="el-icon-search searchicon"></i>
		<el-tree class="filter-tree" style="margin-top:1rem" :data="powerViewData" :props="defaultProps" @node-click="handleNodeClick" ref="tree2" :filter-node-method="filterNode"></el-tree>
	</div>
</div>

<!-- 碳排放量分析 -->
<div class="item item-4">
	<template>
		<el-breadcrumb separator="/" style="margin-bottom:14px">
	  <el-breadcrumb-item class="index">首页</el-breadcrumb-item>
	  <el-breadcrumb-item><a href="/">能效管理</a></el-breadcrumb-item>
	  <el-breadcrumb-item>碳排放量分析</el-breadcrumb-item>
	</el-breadcrumb>
	 <div class="header-tit">
  	<h4 style="margin-top:0">碳排放量分析</h4>
  	<hr style="border:1px solid #f8f8f8"/></div>
  	<div class="block" style="margin-top:1rem">
	    <span class="demonstration">选择年月</span>
	    <el-date-picker  v-model="coSelectDate" type="month"  placeholder="选择年月" id="selectCoInput"></el-date-picker>
	   </div>
  <el-button type="info" id="selectCo" style="float:right;position:relative;right:8%;font-weight:300;margin-top:1rem;margin-bottom:2rem;">查询</el-button>
	<div class="ana-content" id="ana-content" style="width:80%;height:320px;margin:0 auto;margin-top:140px"></div>
	<el-button :plain="true" @click="open3" id="alertco" style="visibility:hidden;position:fixed;">警告</el-button>
	</template>
</div>

<!-- 负载特性 -->
	<div class="item item-5">
	  <el-breadcrumb separator="/" style="margin-bottom:14px">
		  <el-breadcrumb-item class="index">首页</el-breadcrumb-item>
		  <el-breadcrumb-item><a href="/">能效管理</a></el-breadcrumb-item>
		  <el-breadcrumb-item>负载特性</el-breadcrumb-item>
	  </el-breadcrumb>
		 <div class="header-tit">
	  	<h4 style="margin-top:0">负载特性</h4>
	  	<hr style="border:1px solid #f8f8f8"/></div>
		<div class="left">
			<el-input v-model="filterText"style="margin-top:20px" placeholder="请输入筛选内容"></el-input><i class="el-icon-search searchicon"></i>
			<el-tree class="filter-tree" style="margin-top:1rem" :data="fuheAnaData" :props="defaultProps" @node-click="handleNodeClick" ref="tree2" :filter-node-method="filterNode"></el-tree>
		</div>
		<div class="right">
			<div class="block">
				<span class="demonstration">指标项目</span>
				<el-select v-model="fuzaivalue" placeholder="请选择">
			    <el-option
			      v-for="item in fuzaioptions"
			      :key="item.value"
			      :label="item.label"
			      :value="item.value">
			    </el-option>
			  </el-select>
			</div>
		<div class="block">
			<span class="demonstration">指标项目</span>
			  <el-select v-model="fuzaivalue2" placeholder="请选择">
				    <el-option
				      v-for="item in fuzaioptions2"
				      :key="item.value"
				      :label="item.label"
				      :value="item.value">
				    </el-option>
				  </el-select>
		</div>
				<div class="block">
				    <span class="demonstration">选择日期</span>
				    <el-date-picker v-model="fuheAnaDate"  type="date" placeholder="选择日期"></el-date-picker>
				  </div>
				  <div class="block">
				      <span class="demonstration">时段选择</span>
				  <el-select v-model="fuheValue" placeholder="请选择">
				    <el-option v-for="item in fuheSelectOptions" :key="item.value" :label="item.label" :value="item.value"></el-option>
			    </div>
		</div>
</div>

<!-- 异常分析 -->
<div class="item item-6">
	<template>
		<el-breadcrumb separator="/" style="margin-bottom:14px">
	  <el-breadcrumb-item class="index">首页</el-breadcrumb-item>
	  <el-breadcrumb-item><a href="/">用户分析</a></el-breadcrumb-item>
	  <el-breadcrumb-item>异常分析</el-breadcrumb-item>
	</el-breadcrumb>
	 <div class="header-tit">
  	<h4 style="margin-top:0">异常分析</h4>
  	<hr style="border:1px solid #f8f8f8"/></div>
  	<div class="block" style="margin-top:1rem">
	    <span class="demonstration">选择年月</span>
	    <el-date-picker  v-model="coSelectDate" type="month"  placeholder="选择年月" id="selectCoInput"></el-date-picker>
	   </div>
  <el-button type="info" style="float:right; position:relative;right:8%;font-weight:300;margin-top:1rem;margin-bottom:2rem;">查询</el-button>
	<div class="ana-content" id="ana-content" style="width:80%;height:320px;margin:0 auto;margin-top:140px"></div>
	
	</template>
	
</div>

<div class="item item-dispatch">
	<template>
			<el-breadcrumb separator="/" style="margin-bottom:14px">
	  <el-breadcrumb-item class="index">首页</el-breadcrumb-item>

	  <el-breadcrumb-item>派单处理</el-breadcrumb-item>
	</el-breadcrumb>
	<div id="alertChart" class="chart" style="margin-right:5%" ></div>
	<div id="alertPie" class="chart" ></div>
	<div style="clear:both"></div>
	 <el-table
    :data="tableData"
    style="width: 100%;margin-top:30px;s">
    <el-table-column
   
      prop="date"
      label="日期"
      sortable
      width="180"
      :filters="alertDate"
      :filter-method="filterHandler"
    >
    </el-table-column>
    <el-table-column
      prop="name"
      label="监测点"
      width="180">
    </el-table-column>
    <!--    v-if='show'可以控制列的显示隐藏，直接不加载到页面 -->
        <el-table-column
     
      prop="alertId"
      label="报警id"
   	  data-id="alert"
   	  class="alertIditem"
      width="180">
    </el-table-column>
    
          <el-table-column
      prop="person"
      label="负责人"
      >
    </el-table-column>
    <el-table-column
      prop="tel"
      label="联系方式"
    >
    </el-table-column>

    
    <el-table-column
      prop="tag"
      label="解决状态"
      width="100"
      :filters="[{ text: '待解决', value: '待解决' }, { text: '已解决', value: '已解决' }]"
      :filter-method="filterTag"
      filter-placement="bottom-end">
      <template slot-scope="scope">
        <el-tag
          :type="scope.row.tag === '待解决' ? 'danger' : 'success'"
          disable-transitions>{{scope.row.tag}}</el-tag>
      </template>
 
    </el-table-column>
         
 <el-table-column
      fixed="right"
      label="操作"
      width="100">
      <template slot-scope="scope">
        <el-button @click="handleClick(scope.row)" type="text" size="small">查看</el-button>
          <el-button class="delalert"
          @click.native.prevent="deleteRow(scope.$index, tableData)"
          type="text"
          size="small">
          移除
        </el-button>
        
  <!--        <el-button  @click="openSure" id="Sure" style="visibility:hidden;position:fixed;">提示</el-button> -->
        
        </div>

      </template>
    </el-table-column>
  </el-table>
<!--    @size-change="handleSizeChange" 改变每页的数据量-->  
         <el-pagination class="page"
  background

   @current-change="handleCurrentChange"
                  :page-size="6"
                  layout="total, prev, pager, next, jumper"
  :total="totalCount">
</el-pagination>
	</template>
</div>

</el-main>
  </el-container>
</el-container>

</div>
 
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/echarts/3.8.5/echarts.js"></script>
<script src="<%=path %>/static/scripts/drawCharts.js"></script>
<script src="<%=path %>/static/scripts/function.js"></script>
<script src="<%=path %>/static/scripts/totalindex.js"></script>
<script src="<%=path %>/static/scripts/itemClick.js"></script>
<script src="https://cdn.bootcss.com/vue-resource/1.5.0/vue-resource.js"></script>
<!-- <script src="https://cdn.bootcss.com/echarts/4.0.4/echarts-en.common.js"></script> -->
<script>
var datajson;//监测点数据
var alertjson;
var alertNum;

$.ajax({
	 url:"selectAllMonitor",
	 type:'post',
	 datatype:"json",
	 async:false,
	 success:function(data){
		console.log(data.data);
		datajson=data.data;
		
	 }
});
//报警总数
$.ajax({
	 url:"queryCount",
	 type:'post',
	 async:false,
	 success:function(count){
		 alertNum=count.count;
	
	 }
})
//报警数据，后台数据库分页


//vue加载页面

var vue=new Vue({
    el: '#app',
    watch:{
	   	  filterText(val) {
          this.$refs.tree2.filter(val);
        },
        filterText1(val){
        	return filterText(val)
        }
    },
    data: function() {
      return { visible: false, fuheAnaInput:'',filterText:'', powervalue1: '', powervalue2: '', powervalue3: '', powervalue4: '', powervalue5: '', 
    	 		   powervalue6: '2018-01-02',coSelectDate:'',maxStartTime:'',maxEndTime:'',fuheAnaDate:'',
   			//下拉框--最值分析
   		     maxOptions: [{value: '选项1',label: '时' }, {value: '选项2',label: '天' },{value: '选项3',label: '周'}],
   		  	maxSelectTime: '天',
   		     fuheSelectOptions:[{value: '选项1',label: '时' }, {value: '选项2',label: '天' },{value: '选项3',label: '周'}],
   		     fuheValue:'时',
 		     //负载特性
 		     //左侧菜单
 		      fuheAnaData:datajson,
 		      defaultProps: {
		              children: 'children',
		              label: 'label'
		            },
 		      //下拉框 
 		      fuzaioptions: [{value: '选项1',label: '黄金糕'}, {value: '选项2', label: '双皮奶'}, {value: '选项3',label: '蚵仔煎'},
 		        	 				{value: '选项4',label: '相电压'},{value: '选项5',label: '皮皮虾'}, {value: '选项6', label: '烤面筋'}],
	          fuzaivalue: '相电压',
	        
	          fuzaioptions2: [{value: '选项1',label: '波波'}, {value: '选项2',label: '尘尘'}, {value: '选项3',label: '小杰'}, 
	        					{value: '选项4',label: '娃娃'}, {value: '选项5',label: '浩浩'}, {value: '选项6',label: '老师'}],
	          fuzaivalue2: '波波',
   		        //最值分析--表格
   		       maxTableData: [{ date: '--',maxload:'--', maxloadtime:'--',minload:'--',minloadtime:'--'},],
   		       alertDate: [{text: '2016-05-01', value: '2016-05-01'}, {text: '2016-05-02', value: '2016-05-02'}, {text: '2016-05-03', value: '2016-05-03'}, {text: '2016-05-04', value: '2016-05-04'}],
				//能流可视化--菜单
  	            powerViewData: datajson,
  	            defaultProps: {
  		              children: 'children',
  		              label: 'label'
  		            },
  		          
  		          //表格当前页数据
  	                tableData: [],

  	                //多选数组
  	             //   multipleSelection: [],

  	                //请求的URL
  	                url:'queryPageInfo',

  	                //搜索条件
  	               // criteria: '',

  	                //下拉菜单选项
  	                //select: '',

  	                //默认每页数据量
  	                pagesize: 6,

  	                //默认高亮行数据id
  	                highlightId: -1,

  	                //当前页码
  	                currentPage: 1,

  	                //查询的页码
  	                start: 1,

  	                //默认数据总数
  	                totalCount:alertNum, 
  		     
	        }
    },
   
    methods:{
    	   //从服务器读取数据
        loadData: function(criteria, pageNum, pageSize){ 
        	
        //这里用vue-resource不行，总是报500的错误，应该是没有设定返回的数据类型，导致报错
           // this.$http.get(this.url,{parameter:criteria, pageNum:pageNum, pageSize:pageSize}).then(function(res){
            	$.ajax({
	 url:"queryPageInfo",
	 type:'post',
	 data:{"pageNum":pageNum},
	 datatype:"json",
	 async:false,
	 success:function(data){
		console.log(data);
		//alertjson=data;
		var msgarr=[];
	
		for(let i=0;i<data.length;i++){
			var msg={};//放在for循环外会导致msg只保存最后一个i的值
		//	msgdate.push(data[i].recvTime);
			msg.date=data[i].recvTime;
			msg.name=data[i].monitor;
			msg.person=data[i].user;
			msg.alertId=data[i].alertId;
			msg.tel=data[i].mobile;
			if(data[i].status){
				msg.tag="已解决";
				
			}else{
				msg.tag="待解决";
			}
			msg.deltail="查看详情";
			msgarr.push(msg)
			console.log(msg);
		}
		console.log("转换"+msgarr);
		alertjson=msgarr;
	 }
});
            	var msgdate=[{text: '2016-12-01', value: '2016-12-01'}, {text: '2016-05-02', value: '2016-05-02'}, {text: '2016-05-03', value: '2016-05-03'}, {text: '2016-05-04', value: '2016-05-04'}];
        		//alertNum=data.length;
        		this.alertDate=msgdate;
                this.tableData = alertjson;
                //this.totalCount = res.data.number;
                  
        },

  	  handleOpen(key, keyPath) {
  	        console.log(key, keyPath);
  	      },
  	      handleClose(key, keyPath) {
  	        console.log(key, keyPath);
  	      },
  	
  	    filterNode(value,data) {
  	        if (!value) return true;
  	        return data.label.indexOf(value) !== -1;
  	      },
  	      handleNodeClick(data) {
	            console.log(data);
	          },
          open3() {
              this.$message({
                message: '警告哦,没有这段时期的数据',
                type: 'warning'
              });
            },
        

            formatter(row, column) {
		          return row.address;
		        },
		   filterTag(value,row) {
		          return row.tag === value;
		        },
		   filterHandler(value, row, column) {
		          const property = column['property'];
		          return row[property] === value;
		        },
		  deleteRow(index, rows) {
		        		//openSure();
		        		//这个click中用了then catch，es6中的promise，属于异步
		        	//	console.log($("#Sure").click());
		        		//直接在这里进行提示确认，不再封装函数
		        	    this.$confirm('此操作将永久删除该条记录, 是否继续?', '提示', {
		                    confirmButtonText: '确定',
		                    cancelButtonText: '取消',
		                    type: 'warning',
		                    center: true
		                  }).then(() => {
		                	 	
		               		var num=$($(".alertNum")[0]).text();
		               		console.log(num);
		               		num--;
		               		$($(".alertNum")[0]).text(num);
		          	        rows.splice(index, 1);
		          	      this.handleCurrentChange(1);
		                    this.$message({
		                      type: 'success',
		                      message:'已删除成功'
		                    });
		                    
		                  }).catch(() => {
		                    this.$message({
		                      type: 'info',
		                      message: '已取消删除'
		                    });
		                    
		                  });
		  
		  	      },
		  	    handleSizeChange: function(val) {
                    this.pagesize = val;
                    this.loadData(this.criteria, this.currentPage, this.pagesize);
                },

                //页码变更
                handleCurrentChange: function(val) {
                    this.currentPage = (val-1)*6;//6为默认页码数
                    
                    console.log(this.currentPage);
                    this.loadData(this.criteria, this.currentPage, this.pagesize);
                }        
		  	    
    }
  });
vue.loadData(vue.criteria, vue.currentPage-1, vue.pagesize);
</script>
<script>
$(function(){
	$(".alertNum").text(alertNum);
	$(window).resize(function(){
		//窗口变化时echart重绘
		//total_echart.resize();
		month_echart.resize();
		today_echart.resize();
		co_echart.resize();
	})
$(".alertIditem").hide();
	$(".index").on("click",function(){
		$(".item").hide();
		$(".item-0").show();	
	})
	
	//实时更新数据状态
	//ajax短连接定时
	
	//ajax长连接
	
	//websocket协议
	
	var selectNum=$(".el-tree-node__label");
	for(var i=0;i<selectNum.length;i++){
		if($(selectNum[i]).text()=="工作站2"){
			$(selectNum[i]).parent().parent().addClass('is-current');
		}
	}
	
})
</script>
</body>
</html>