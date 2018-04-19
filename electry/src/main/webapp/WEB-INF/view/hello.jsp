<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
 <%@ page isELIgnored="false" %> 
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
 body{font-weight:300;font-family:'微软雅黑'}
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
    .elec-today{color:#E79D58;font-size:2rem}.elec-month{color:#4CB7E7;font-size:2rem}
    .foot{font-size:14px;color:rgb(255, 255, 255);}
</style>
</head>
<body>

<div id="app">
<el-container>
  <el-header class="el-header"><h2>电力能源管理平台</h2><div class="user">Hello:${user.getUsername()}</div></el-header><!-- 或者写user.username -->
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
          <el-menu-item index="1-2">负载特性</el-menu-item>
          <el-menu-item index="1-3" class="max">最值分析</el-menu-item>
          <el-menu-item index="1-4" class="power_view">能流可视化</el-menu-item>
          <el-menu-item index="1-5">负荷预测</el-menu-item>
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
          <el-menu-item index="3-5">异常分析</el-menu-item>
          <el-menu-item index="3-6">安全分析</el-menu-item> 
        </el-menu-item-group>
      </el-submenu>
       <el-menu-item index="0" class="total"  style="bottom:0px;position:fixed;width:200px">
         <div class="foot">@CopyRight By bobo</div>
      </el-menu-item>
     
    </el-menu>
  </el-col>
</el-row>

    </el-aside>
    <el-main style="overflow:scroll;margin-left:200px;margin-top:60px;width:85%">
    <!-- 综合预览 -->
   
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
		  				<span class="elec-today">12123</span><span>元</span></div>
		  				<div class="panel-item panel-body-right"><h4>当月累计电费</h4>
		  				<span class="elec-month">121123</span><span>元</span></div>
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
		  		</div>
    		</template>
    </div> 
    <!-- 负载总览 -->
    <div class="item item-1">
    <el-breadcrumb separator="/" style="margin-bottom:14px">
	  <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
	  <el-breadcrumb-item><a href="/">能效管理</a></el-breadcrumb-item>
	  <el-breadcrumb-item>负载总览</el-breadcrumb-item>
	</el-breadcrumb>
	<template>
	  	<div class="header-tit">
	  	<h4 style="margin-top:0">负载总览</h4>
	  	<hr style="border:1px solid #f8f8f8"/></div>
	    <div class="block">
	    <span class="demonstration">选择日期1</span>
	    <el-date-picker  v-model="value1" type="date"  placeholder="选择日期"></el-date-picker>
	    </div>
	    <div class="block">
	    <span class="demonstration">选择日期2</span>
	    <el-date-picker  v-model="value2" type="date"  placeholder="选择日期"></el-date-picker>
	   </div>
	    <div class="block">
	    <span class="demonstration">选择日期3</span>
	    <el-date-picker  v-model="value3" type="date" placeholder="选择日期"></el-date-picker>
	  </div>
	    <div class="block">
	    <span class="demonstration">选择日期4</span>
	    <el-date-picker v-model="value4"  type="date" placeholder="选择日期"> </el-date-picker>
	  </div>
	    <div class="block">
	    <span class="demonstration">选择日期5</span>
	    <el-date-picker v-model="value5" type="date"  placeholder="选择日期"></el-date-picker>
	  </div>
	    <div class="block">
	    <span class="demonstration">对比日期</span>
	    <el-date-picker v-model="value6" type="date"  placeholder="选择日期"></el-date-picker>
	  </div>
	  <div style="clear:both"></div>
	  <el-button type="info" style="float:right;position:relative;right:7%;font-weight:300;margin-top:1rem">查询</el-button>
</template>
</div>

<!-- 最值分析 -->
<div class="item item-2">
<template>
    <el-breadcrumb separator="/" style="margin-bottom:14px">
	  <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
	  <el-breadcrumb-item><a href="/">能效管理</a></el-breadcrumb-item>
	  <el-breadcrumb-item>最值分析</el-breadcrumb-item>
	</el-breadcrumb>
	<div class="header-tit">
  	<h4 style="margin-top:0">最值分析</h4>
  	<hr style="border:1px solid #f8f8f8"/></div>
    <div class="block" style="margin-left:50px">
    <span class="demonstration">起始日期</span>
    <el-date-picker  v-model="value1" type="date" placeholder="选择日期"  id="startTime"></el-date-picker>
  </div>
    <div class="block">
    <span class="demonstration">终止日期</span>
    <el-date-picker v-model="value2"  type="date" placeholder="选择日期" id="endTime"></el-date-picker>
  </div>
  <div class="block">
      <span class="demonstration">时段选择</span>
  <el-select v-model="value" placeholder="请选择">
    <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
    </div>
  </el-select>
  <div style="clear:both"></div>
  <el-button type="info" id="select" style="float:right;position:relative;right:8%;font-weight:300;margin-top:1rem">查询</el-button>
    <div style="clear:both"></div>
 
</template>
<div id="max_analysis" style="width:96%;height:400px;margin:0 auto;"></div>

  <el-table  :data="tableData" stripe  style="width: 100%">
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
  <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
  <el-breadcrumb-item><a href="/">能效管理</a></el-breadcrumb-item>
  <el-breadcrumb-item>能流可视化</el-breadcrumb-item>
</el-breadcrumb>
	 <div class="header-tit">
  	<h4 style="margin-top:0">能流可视化</h4>
  	<hr style="border:1px solid #f8f8f8"/></div>
	<div class="left">
		<el-input v-model="input"style="margin-top:20px" placeholder="请输入内容"></el-input>
		<el-tree style="margin-top:1rem" :data="data" :props="defaultProps" @node-click="handleNodeClick"></el-tree>
	</div>
</div>

<!-- 碳排放量分析 -->
<div class="item item-4">
	<template>
		<el-breadcrumb separator="/" style="margin-bottom:14px">
	  <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
	  <el-breadcrumb-item><a href="/">能效管理</a></el-breadcrumb-item>
	  <el-breadcrumb-item>碳排放量分析</el-breadcrumb-item>
	</el-breadcrumb>
	 <div class="header-tit">
  	<h4 style="margin-top:0">碳排放量分析</h4>
  	<hr style="border:1px solid #f8f8f8"/></div>
  	<div class="block" style="margin-top:1rem">
	    <span class="demonstration">选择年月</span>
	    <el-date-picker  v-model="value" type="month"  placeholder="选择年月"></el-date-picker>
	   </div>
  <el-button type="info" id="select" style="float:right;position:relative;right:8%;font-weight:300;margin-top:1rem">查询</el-button>
	</template>
</div>
</el-main>
  </el-container>
</el-container>

</div>
 
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/echarts/3.8.5/echarts.js"></script>
<!-- <script src="https://cdn.bootcss.com/echarts/4.0.4/echarts-en.common.js"></script> -->
<script>
//vue加载页面
new Vue({
    el: '#app',
    data: function() {
      return { visible: false,
      		input:'',
   			value1: '',
   			value2: '',
   			value3: '',
   			value4: '',
   			value5: '',
   			value6: '2018-01-02',
   			//下拉框--最值分析
   		     options: [{
   		          value: '选项1',
   		          label: '时'
   		        }, {
   		          value: '选项2',
   		          label: '天'
   		        }, {
   		          value: '选项3',
   		          label: '周'
   		        }],
   		        value: '天',
   		        //最值分析--表格
   		       tableData: [{
   		          date: '--',
   		          maxload:'--',
   		          maxloadtime:'--',
   		          minload:'--',
   		          minloadtime:'--'
   		        },],
				//能流可视化--菜单
  	            data: [{
  	              label: '一级 1',
  	              children: [{
  	                label: '二级 1-1',
  	                children: [{
  	                  label: '三级 1-1-1'
  	                }]
  	              }]
  	            }, {
  	              label: '一级 2',
  	              children: [{
  	                label: '二级 2-1',
  	                children: [{
  	                  label: '三级 2-1-1'
  	                }]
  	              }, {
  	                label: '二级 2-2',
  	                children: [{
  	                  label: '三级 2-2-1'
  	                }]
  	              }]
  	            }, {
  	              label: '一级 3',
  	              children: [{
  	                label: '二级 3-1',
  	                children: [{
  	                  label: '三级 3-1-1'
  	                }]
  	              }, {
  	                label: '二级 3-2',
  	                children: [{
  	                  label: '三级 3-2-1'
  	                }]
  	              }]
  	            }],
  	            defaultProps: {
  		              children: 'children',
  		              label: 'label'
  		            }
	        }
    },
    methods:{
  	  handleOpen(key, keyPath) {
  	        console.log(key, keyPath);
  	      },
  	      handleClose(key, keyPath) {
  	        console.log(key, keyPath);
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
    }
  });
</script>
<script>
$(window).resize(function(){
	//窗口变化时echart重绘
	total_echart.resize();
	month_echart.resize();
	today_echart.resize();
	co_echart.resize();
})
var total_echart=echarts.init(document.getElementById("time-fuhe"));
createEcharts(total_echart);
var month_echart=echarts.init(document.getElementById("monthmax"));
var co_echart=echarts.init(document.getElementById("co-ana"));
var co_option = {
	    color: ['#16abfe','#ff7070'],
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {
	            type: 'cross',
	            crossStyle: {
	                color: '#999'
	            }
	        }
	    },
	    legend: {
	        data: ['碳排放量', '转化率']
	    },
	    xAxis: [{
	        type: 'category',
	        data: ['1月2日', '1月3日', '1月4日', '1月5日', '1月6日', '1月7日', '1月8日', '1月9日', '1月10日', '1月11日', '1月12日', '1月13日'],
	        axisPointer: {
	            type: 'shadow'
	        }
	    }],
	    yAxis: [

	        {
	            type: 'value',
	            name: '碳排放量',
	            axisLabel: {
	                formatter: '{value}'
	            }
	        }, {
	            type: 'value',
	            name: '转化率',
	            axisLabel: {
	                formatter: '{value} %'
	            }
	        },
	    ],
	    series: [{
	            name: '碳排放量',
	            type: 'bar',
	            yAxisIndex: 0,
	            backgroundColor:'71D7FF',
	            data: [261, 259, 290, 264, 287, 707, 756, 182, 487, 188, 260, 230]
	        },

	        {
	            name: '转化率',
	            type: 'line',
	            yAxisIndex: 1,
	            smooth: true,
	            data: [2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
	        }
	    ]
	};
	co_echart.setOption(co_option)
var mon_option = {
	    	    
	    	    tooltip : {
	    	        formatter: "{a} <br/>{b} : {c}%"
	    	    },
	    	    toolbox: {
	    	        feature: {
	    	            restore: {},
	    	            saveAsImage: {}
	    	        }
	    	    },
	    	    series: [
	    	        {
	    	            name: '业务指标',
	    	            radius: '125%',
	    	            type: 'gauge',
	    	            max:100000,
	    	            startAngle:180,
	    	            endAngle:0,
	    	            detail: {formatter:'{value}',fontSize:15},
	    	           center:["50%","70%"],//调整位置
	    	            axisLine: {
	    	        			show: true,
	    	           		 lineStyle: {
	    	                width: 10,
	    	                fontSize:7,
	    	                shadowBlur: 0,
	    	                color: [[0.3, '#6ced91'],[0.7, '#06a8fd'],[1, '#fe6b7d']]
	    	            }
	    	        },
	    	            data: [{value: 12323}]
	    	        }
	    	    ]
	    	};


month_echart.setOption(mon_option); 
var today_echart=echarts.init(document.getElementById("today-ele"));
option = {
	    backgroundColor: '#fff',
	    tooltip: {
	        trigger: 'item',
	        formatter: "{b}: {c} ({d}%)",
	    },
	    color: ['#33CC99', '#e47070', '#55b4e3', '#eab2f6', '#ccc', '#FF9966', ],
	    series: [{
	        name: '',
	        type: 'pie',
	        radius: ['0', '50%'],
	        label: {
	            normal: {
	                formatter: '{b}\n{d}%'
	            },

	        },
	        selectedMode: 'single',
	        data: [{
	                value: 2000,
	                name: '谷'
	            },
	            {
	                value: 400,
	                name: '峰'
	            },
	            {
	                value: 800,
	                name: '平',
	            },
	        ]
	    }]
	};
	today_echart.setOption(option);
//综合预览	
 $('.total').on('click',function(){
		  $('.item').hide();
		  $('.item-0').show();
	  });
 //负载总览
 $('.fuzai_total').on('click',function(){
	  $('.item').hide();
	  $('.item-1').show();
 });
 //能流可视化
 $('.power_view').on('click',function(){
	 $('.item').hide();
	 $('.item-3').show();
 })
 //最值分析
  $('.max').on('click',function(){
	  $('.item').hide();
	  $('.item-2').show();
	  $("#select").on('click',function(){
		//  var startTime=$('#startTime').val().replace(/-/g,"");
		  var startTime=$('#startTime').val();
		//  var endTime=$('#endTime').val().replace(/-/g,"");
		  var endTime=$('#endTime').val();
		  $.ajax({
			  url:"select",
			  data:{'startTime':startTime,
				  'endTime':endTime},
			  type:'post',
			  success:function(msg){
				  console.log(msg);
				  if(msg==null||msg==""){
					  console.log("null");
					  $("#alert").click();
					  return;//不return就会执行接下来的操作
				  }
				  var data=msg;
				  /* var data=JSON.parse(msg);
				  console.log(data); */
				  var td=$(".el-table__row td");
				  var html="";
				  for(var i=0;i<msg.length;i++){
					  html+="<tr class='el-table__row'>";
					
						 // $(td[j]).find('.cell').text()
						 html+="<td class='el-table_1_column_1'><div class='cell'>"+data[i].mdate+"</div></td>";
						 html+="<td class='el-table_1_column_2'><div class='cell'>"+data[i].mmax+"</div></td>";
						 html+="<td class='el-table_1_column_3'><div class='cell'>"+data[i].startTime+"</div></td>";
						 html+="<td class='el-table_1_column_4'><div class='cell'>"+data[i].mmin+"</div></td>";
						 html+="<td class='el-table_1_column_5'><div class='cell'>"+data[i].endTime+"</div></td>";
					  	html+="</tr>";
				  }
				  $('.el-table__body tbody').html(html);
			  }
		  })
		  console.log(startTime);
	  })

	  var myChart = echarts.init(document.getElementById('max_analysis'));
	  createEcharts(myChart);
	   
  });
 $(".co-analysis").on("click",function(){
	 $(".item").hide();
	 $(".item-4").show();
 })
  function createEcharts(mychart){
	  var timeData = ['0:00', '0:30',  '1:00', '1:30','2:00', '2:30','3:00', '3:30','4:00', '4:30','5:00', '5:30',
	        '6:00', '6:30','7:00', '7:30', '8:00', '8:30','9:00', '9:30','10:00', '10:30', '11:00', '11:30','12:00', '12:30',
	        '13:00', '13:30'

	    ];
	

	    var   maxOption = {
	        /* title: {
	            text: '趋势图分析',
	             x: 'left',
	        }, */
	        tooltip: {
	            trigger: 'axis',

	            axisPointer: {
	                animation: false
	            }
	        },
	        legend: {
	            data: ['流量'],
	            x: 'left'
	        },
	        toolbox: {
	            feature: {
	                dataZoom: {
	                    yAxisIndex: 'none'
	                },
	                restore: {},
	                saveAsImage: {}
	            }
	        },
	        axisPointer: {
	            link: {
	                xAxisIndex: 'all'
	            }
	        },
	        dataZoom: [{
	            show: true,
	            realtime: true,
	            start: 30,
	            end: 70,

	            xAxisIndex: [0, 1]
	        }, {
	            type: 'inside',
	            realtime: true,
	            start: 30,
	            end: 70,
	            xAxisIndex: [0, 1]
	        }],
	        grid: [{
	            left: 40,
	            right: 40,
	        }, {
	            left: 40,
	            right: 40,
	        }],
	        xAxis: [{
	            type: 'category',
	            boundaryGap: false,
	            axisLine: {
	                onZero: true
	            },
	            data: timeData
	        }, {
	            gridIndex: 1
	        }],

	        yAxis: [{

	            type: 'value',
	            max: 500,
	            name: '单位:',
	            min: 0,
	            interval: 50,


	        }, {
	            gridIndex: 1
	        }],
	        series: [{
	            name: '数值',
	            type: 'line',
	            smooth: true,
	            symbol: 'circle',
	            symbolSize: 9,
	            showSymbol: false,
	            lineStyle: {
	                normal: {
	                    width: 1
	                }
	            },
	            markPoint: {
	                data: [{
	                    type: 'max',
	                    name: '最大值'
	                }, {
	                    type: 'min',
	                    name: '最小值'
	                }]
	            },
	            markArea: {
	                silent: true,
	                label: {
	                    normal: {
	                        position: ['10%', '50%']
	                    }
	                },
	                data: [
	                    [{
	                        name: '优',
	                        yAxis: 100,
	                        itemStyle: {
	                            normal: {
	                                color: 'rgba(0,153,153,0.27)'
	                            }
	                        },
	                    }, {
	                        yAxis: 200
	                    }],
	                    [{
	                        name: '良',
	                        yAxis: 200,
	                        itemStyle: {
	                            normal: {
	                                color: 'rgba(153,204,51,0.2)'
	                            }
	                        },
	                    }, {
	                        yAxis: 300,
	                    }],
	                    [{
	                        name: '差',
	                        yAxis: 300,
	                        itemStyle: {
	                            normal: {
	                                color: 'rgba(250,250,51,0.2)'
	                            }
	                        }
	                    }, {
	                        yAxis: 400,
	                    }]
	                ]
	            },
	            data: [113,322, 123, 222, 231, 322, 233, 122, 223, 232, 232, 232, 222, 232, 132, 123, 212]

	        }]
	    };
	    mychart.setOption(maxOption);
  }
</script>
</body>
</html>