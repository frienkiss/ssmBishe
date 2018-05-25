  $(function(){
	  //综合预览
	  $.ajax({
		  url:'selectTotalData',
		  type:'post',
		  success:function(data){
			  console.log(data);
			  $(".elec-month").text(data.todayEle);
			  $(".elec-today").text(data.monthEle);
			  var x1=data.todayEle*1.2;
			  var x2=data.monthEle*1.2;
			  $(".elec-monthmoney").text(x1.toFixed(2));//toFixed(2)保留两位小数
			  $(".elec-todaymoney").text(x2.toFixed(2));
		  } 
	  })
	  $.ajax({
		  url:'selectDateValue',
		  type:'post',
		  success:function(data){
			  console.log(data);
			  var repdata={
					  pvalue:[],
					  pdate:[]
			  }		
			  for(var i=0;i<data.length;i++){
				  repdata.pvalue[i]=data[i].pvalue;
				  repdata.pdate[i]=data[i].pdate.slice(5).split("-").join("/");
			  }
			  var total_echart=echarts.init(document.getElementById("time-fuhe"));
			  console.log(repdata);
			  //绘制图表
			  createLineCharts2(total_echart,repdata);
			  var maxPvalue=Math.max.apply(null, repdata.pvalue);//最大值
			  var month_echart=echarts.init(document.getElementById("monthmax"));
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
			    	            name: '当月最大需求量',
			    	            radius: '125%',
			    	            type: 'gauge',
			    	            max:10000,
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
			    	            data: [{value: maxPvalue}]
			    	        }
			    	    ]
			    	};
		month_echart.setOption(mon_option); 
		  }
	
	  });  
	  var co_echart=echarts.init(document.getElementById("co-ana"));
	  createBarCharts(co_echart);
var data2= [{
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
];
	  var today_echart=echarts.init(document.getElementById("today-ele"));
	  	createPieEcharts(today_echart,data2);
	  
  })