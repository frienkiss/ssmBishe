$(function(){

//综合预览	
 $('.total').on('click',function(){
		  $('.item').hide();
		  $('.item-0').show();
	  });
 //负载总览
 $('.fuzai_total').on('click',function(){
	  $('.item').hide();
	  $('.item-1').show();
	  var data={
			  "selectDate1":$("#powervalue1").val(),
			  "selectDate2":$("#powervalue2").val(),//json格式最好用双引号，单引号可能对也可能不对
			  "selectDate3":$("#powervalue3").val(),
			  "selectDate4":$("#powervalue4").val(),
			  "selectDate5":$("#powervalue5").val()
	  };
	// console.log(JSON.parse(data));
	
		 $.ajax({
			 headers:{
				 "Content-Type":'application/json; charset=utf-8'
			 },
			 url:"fuheTotal",
			 type:'post',
			// dataType:"json",	
			
			 data:JSON.stringify(data),//转为json字符串，不然报错400
			 success:function(data){
				//console.log(JSON.parse(data));
				 console.log(data);
				 var fuchart=echarts.init(document.getElementById("fuhe_total"))
				createBarChart2(fuchart,null);
			 }
		 })
 });
 //能流可视化
 $('.power_view').on('click',function(){
	 $('.item').hide();
	 $('.item-3').show();
	 $.ajax({
		 url:"selectMonitor",
		 type:'post',
		 datatype:"json",
		 success:function(data){
			// console.log(JSON.parse(data));
						
		 }
	 })

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
			  url:"selectMax",
			  data:{'startTime':startTime,
				  'endTime':endTime},
			  type:'post',
			  success:function(msg){
				//  console.log(msg);
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
				  var testdata={
						  pvalue:[],
						  pvalue2:[],
						  pdate:[],
						  pdate2:[]
					  }
				  for(var i=0;i<msg.length;i++){
					  html+="<tr class='el-table__row'>";
					
						 // $(td[j]).find('.cell').text()
						 html+="<td class='el-table_1_column_1'><div class='cell'>"+data[i].mdate+"</div></td>";
						 html+="<td class='el-table_1_column_2'><div class='cell'>"+data[i].mmax+"</div></td>";
						 html+="<td class='el-table_1_column_3'><div class='cell'>"+data[i].startTime+"</div></td>";
						 html+="<td class='el-table_1_column_4'><div class='cell'>"+data[i].mmin+"</div></td>";
						 html+="<td class='el-table_1_column_5'><div class='cell'>"+data[i].endTime+"</div></td>";
					  	html+="</tr>";
					  	testdata.pvalue[i]=data[i].mmax;
					  	testdata.pvalue2[i+2]=data[i].mmin;
					  	testdata.pdate[i]=data[i].startTime.split("-").join("/");
					  	testdata.pdate2[i]=data[i].endTime.split("-").join("/");
				  }
		
				
				  concatArr(testdata.pdate,testdata.pdate2);
				  console.log(testdata.pdate);
				  $('.el-table__body tbody').html(html);
				  var myChart = echarts.init(document.getElementById('max_analysis'));
				  createLineCharts(myChart,testdata);
			  },
				error:function(error){
					$("#alert").click();
				}
		  })
		//  console.log(startTime);
	  })
	
	  
	   
  });
 //碳排放量分析
 $(".co-analysis").on("click",function(){
	 $(".item").hide();
	$(".item-4").show();
	$("#selectCo").on('click',function(){
		
	var select=$("#selectCoInput").val()+"-01";
	console.log(select);
	$.ajax({
		url:'selectCO',
		type:'post',
		dataType:'json',
		data:{
			"selectDate":select
		},
		success:function(msg){
			//success
			console.log(msg);
		 var 	chartsdata=msg.data;
			  var myChartCo = echarts.init(document.getElementById('ana-content'));
			  
				 var data3= [{
			           value: 2000,
			             name: '10KV3H1(183-130开关)'
			         },
			         {
			             value: 400,
			             name: '1H1 10KV(183-190开关)'
			         },
			         {
			             value: 800,
			             name: '5H1 10KV 1#开关',
			         },
			         {
			        	 	value:100,
			        	 	name:"其他监测点"
			         }
			     ];
				
				 createPieEcharts2(myChartCo,chartsdata);
			
		},
		error:function(error){
			//error
			$("#alertco").click();
		}
	})
	});

 })
 //负载特性
 $(".fuzai_special").on("click",function(){
	 $(".item").hide();
	 $(".item-5").show();
 });
 
 //异常分析
 $(".error-ana").on("click",function(){
	
	
 });
//派单处理
 $("#message").on("click",function(){
	 paidan();
 })
 $(".alertinfo").on("click",function(){
 	console.log("click");
 	 $('#message').click();
 	 paidan();
	
})
})

function paidan(){
	$(".item").hide();
 	$(".item-dispatch").show();
 	var nostatus,yesstatus;//解决状态个数
 	$.ajax({
 		 url:"queryCount",
 		 type:'post',
 		 async:false,
 		 success:function(count){
 			
 			nostatus=count.no;
 			 yesstatus=count.yes;
 		 }
 	})
	 
	var linedata={
		title:'告警个数',
		legend:['告警个数'],
		xdata:['2016-05-01', '2016-06-02','2016-06-03', '2016-06-04', '2016-06-05', '2016-06-06'],
		data:[20, 10, 15, 12, 15, 10]
	}
	var line=echarts.init(document.getElementById("alertChart"));
	createLine3(line,linedata);
 	var piedata={
		 	title:"告警处理",
	legend:['已解决','待解决'],
	data:[{
	     value: yesstatus,
	     name: '已解决'
	 }, {
	     value: nostatus,
	     name: '待解决'
	 }],
colorList: [ 'rgba(103,194,58,0.8)','rgba(245,108,108,0.8)']
	
	};
	var alertPie=echarts.init(document.getElementById("alertPie"));
	creatPieChart(alertPie,piedata);
 	$(".delalert").on("click",function(){
 		//为何输出两次
 	//console.log(	$($($(this).parents(".el-table_row")).find("td")).eq(2).html());
 	//	console.log($($($(this).parent().parent().prev().prev().prev().prev()).find('.cell')[0]).text());
 		var row=$($($(this).parent().parent().prev().prev().prev().prev()).find('.cell')[0]).text();
 		
 	 	$.ajax({
 	 		 url:"delRow",
 	 		 type:'post',
 	 		 async:false,
 	 		data:{"alertId":row},
 	 		 success:function(del){
 	 			console.log("del"+del);
 	 		
 	 			
 	 		 }
 	 	})
 	 	//重新加载数据6条
// 	 	$(".el-pager .active").next().click();
// 	 	$(".el-pager .active").click();
 		//将数据库也减1
 	})
 
}
function concatArr(arr1, arr2){ 
 for (var i = 0 ; i < arr1.length ; i ++ ){
   for(var j = 0 ; j < arr2.length ; j ++ ){
    if (arr1[i] === arr2[j]){
     arr1.splice(i,1); //利用splice函数删除元素，从第i个位置，截取长度为1的元素
    }
   }
 }
 //alert(arr1.length)
 for(var i = 0; i <arr2.length; i++){
  arr1.push(arr2[i]);
 }
 return arr1;
}
