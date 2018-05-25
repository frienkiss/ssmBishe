//波形图
function createLineChart(mychart){
	var Lineoption = {
    backgroundColor:'white',
    title:{
    	text:'数据库最大连接数',
    	textAlign:'center',
    	left:"50%",
    	top:"10%",
    textStyle:{
    	color:"#999"
    }},
    legend:{
    	icon:'rect',
     	itemWidth: 10,
		itemHeight: 10,
    	data:['sz1-101','sz1-102']
    },
   tooltip: {
            trigger: 'axis'
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: ['1', '5', '10', '15', '20', '25', '31']
            }
        ],
        yAxis: [
            {
                name: '比例',
                type: 'value',
                max: 100
            }
        ],
        series: [
           
            {
                name: 'sz1-101',
                type: 'line',
                tooltip: {
                    trigger: 'axis'
                    // formatter: '{a} <br/>{b}日: {c}元'
                },
                smooth: true,
                itemStyle: {
                    normal: {
                        color: '#35b8eb',
                        lineStyle: {
                            color: '#35b8eb'
                        },
                        areaStyle: {
                            color: '#d8f0f9'
                        }
                    }
                },
                data: [10, 12, 21, 54, 60, 80, 71]
            },
            {
                name: 'sz1-102',
                type: 'line',
                tooltip: {
                    trigger: 'axis'
                    // formatter: '{a} <br/>{b}日: {c}元'
                },
              
                smooth: true,
                itemStyle: {
                    normal: {
                        color: '#94eb2a',
                        lineStyle: {
                            color: '#94eb2a'
                        },
                        areaStyle: {
                            color: '#e7f3d3'
                        }
                    }
                },
                data: [30, 32, 61, 24, 20, 90, 20]
            }
        ]
};
mychart.setOption(Lineoption);
}

//饼图
 function creatPieChart(mychart,data){
 	echarts.util.each(data.data, function(item, index) {
     item.itemStyle = {
         normal: {
             color: data.colorList[index]
         }
     };
 });
 var option= {
     title: [{
           text:data.title,
            left: '49%',
            top: '4%',
            textAlign: 'center',
            textBaseline: 'middle',
            textStyle: {
                color: '#999',
                fontWeight: 'normal',
                fontSize: 20
            }
        }],
        legend:{
        	icon:'rect',
        	orient: 'vertical',
        	data:data.legend,
        	x:'80%',
        	y:'60%',
        	textStyle:{
        		color:'#999'
        	}
        },
     series: [{
         hoverAnimation: false, //设置饼图默认的展开样式
         radius: [30, 90],
         name: 'pie',
         type: 'pie',
         selectedMode: 'single',
         selectedOffset: 16, //选中是扇区偏移量
         clockwise: true,
         startAngle: 90,
         label: {
            
             normal: {
                    formatter: '{b}\n{d}%',
                 textStyle: {
                     fontSize: 14,
                     color: '#999'
                 }
             }
         },
         labelLine: {
             normal: {
                 lineStyle: {
                     color: '#999',

                 }
             }
         },
         borderWidth:4,
         borderColor:'#fff',
         itemStyle: {
            normal: {
                borderWidth: 4,
                borderColor: '#ffffff',
       	  shadowBlur: 8,
                shadowOffsetX: 4,
                shadowColor: 'rgba(102, 102, 102, 0.3)'
            },
            emphasis: {
                borderWidth: 0,
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        },
         data:data.data
     }]
 };
 mychart.setOption(option, true);
 }
 
function createLine2(mychart,data){
 var option = {
    backgroundColor: '#fff',
    title: {
        text: '磁盘使用率',
        top:'1%',
        left:'45%',
        textStyle: {
            fontWeight: 'normal',
            fontSize: 16,
            color: '#333'
        },
       
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            lineStyle: {
                color: '#333'
            }
        }
    },
    legend: {
        icon: 'rect',
        itemWidth: 14,
        itemHeight: 14,
        top:'7%',
        itemGap: 13,
        data: ['过低','适中','过高'],
        right: 'center',
        textStyle: {
            fontSize: 12,
            color: '#333'
        }
    },
    grid: {
        left: '3%',
        right: '4%',
      top:'20%',
        containLabel: true
    },
    xAxis: [{
        type: 'category',
        boundaryGap: false,
        axisLine: {
            lineStyle: {
                color: '#ccc'
            }
        },
        axisLabel: {
            margin: 10,
            textStyle: {
                fontSize: 14,
                color: '#999'
            }
        },
        data: ['2017-07', '2017-08', '2017-09', '2017-10', '2017-11', '2017-12']
    }],
    yAxis: [{
        type: 'value',
        name: '已用',
       
        axisLine: {
            lineStyle: {
                color: '#666'
            }
        },
        axisLabel: {
            margin: 10,
            textStyle: {
                fontSize: 14,
                color: '#999'
            }
        },
        splitLine: {
            lineStyle: {
                type: 'solid',
                color: '#ccc'
            }
        }
    }],
    series: [{
        name: '过低',
        type: 'line',
        smooth: true,
        symbol: 'circle',
        symbolSize: 5,
        showSymbol: false,
        lineStyle: {
            normal: {
                width: 1
            }
        },
        areaStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#d2f9cc'
                }, {
                    offset: 1,
                    color: '#d2f9cc'
                }], false),
                shadowColor: '#d2f9cc',
                shadowBlur: 10
            }
        },
        itemStyle: {
            normal: {
                color: '#82e472',
                borderColor: '#82e472',
                borderWidth: 12

            }
        },
        data: data.slice(0,2)
    },
    {
        name: '适中',
        type: 'line',
        smooth: true,
        symbol: 'circle',
        symbolSize: 5,
        showSymbol: false,
        lineStyle: {
            normal: {
                width: 1
            }
        },
        areaStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#ccecf9'
                }, {
                    offset: 1,
                    color: '#ccecf9'
                }], false),
                shadowColor: '#ccecf9',
                shadowBlur: 10
            }
        },
        itemStyle: {
            normal: {
                color: '#3bbaec',
                borderColor: '#3bbaec',
                borderWidth: 12

            }
        },
        data: ['-'].concat(data.slice(1,4))
    },
      {
        name: '过高',
        type: 'line',
        smooth: true,
        symbol: 'circle',
        symbolSize: 5,
        showSymbol: false,
        lineStyle: {
            normal: {
                width: 1
            }
        },
        areaStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#fae5e5'
                }, {
                    offset: 1,
                    color: '#fae5e5'
                }], false),
                shadowColor: '#fae5e5',
                shadowBlur: 10
            }
        },
        itemStyle: {
            normal: {
                color: '#ee9d9d',
                borderColor: '#ee9d9d',
                borderWidth: 12

            }
        },
        data: [,'-','-'].concat(data.slice(3,6))
    }]
}
 mychart.setOption(option);
}
		//生成表格方法
			function createTable(data,mydom){
				var html="";
				var header=data.header;
				var content=data.content;
				//html+="<table class='table table-condensed'>";
				html+="<thead><tr>";
				for(var i=0;i<header.length;i++){
					html+="<th>"+header[i]+"</th>";
				}
				html+="</tr></thead><tbody>"
				for(var i=0;i<content.length;i++){
					html+="<tr data-id='"+content[i].equipId+"'>";

						for(var j=0;j<header.length;j++){
							html+="<td  class='"+data.mytag[j]+"'>"+content[i].value[j]+"</td>";
						}
			
					html+="</tr>"
				}
				html+="</tbody>";
				mydom.append(html);
			}
			

function createLine3(mychart,data){
	var option = {
    backgroundColor: '#fff',
    title: {
        text: data.title,
 		
        textStyle: {
            fontWeight: 'normal',
            fontSize: 16,
            color: '#333'
        },
        left: '45%'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            lineStyle: {
                color: '#333'
            }
        }
    },
    legend: {
        icon: 'rect',
        top:'10%',
        itemWidth: 14,
        itemHeight: 10,
        itemGap: 13,
        data: data.legend,
        right: 'center',
        textStyle: {
            fontSize: 12,
            color: '#333'
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        top:'24%',
        containLabel: true
    },
    xAxis: [{
        type: 'category',
        boundaryGap: false,
        axisLine: {
            lineStyle: {
                color: '#ccc'
            }
        },
        splitLine: {
            show:true,
            lineStyle: {
                type: 'solid',
                color: '#ccc'
            }
        },
        axisLabel: {
            margin: 10,
            textStyle: {
                fontSize: 14,
                color: '#999'
            }
        },
        data: data.xdata
    }],
    yAxis: [{
        type: 'value',
        name: '比例',
       
        axisLine: {
            lineStyle: {
                color: '#999'
            }
        },
        axisLabel: {
            margin: 10,
            textStyle: {
                fontSize: 14,
                color: '#999'
            }
        },
        splitLine: {
            lineStyle: {
                type: 'solid',
                color: '#ccc'
            }
        }
    }],
    series: [{
        name: data.title,
        type: 'line',
        
        symbol: 'circle',
        symbolSize: 5,
        showSymbol: false,
        lineStyle: {
            normal: {
                width: 1
            }
        },
        areaStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#d6edf7'
                   
                }, {
                    offset: 1,
                    color: '#d6edf7'
                    
                }], false),
                shadowColor: '#d6edf7',
                shadowBlur: 10
            }
        },
        itemStyle: {
            normal: {
                color: '#52c4f1',
                borderColor: '#52c4f1',
                borderWidth: 12

            }
        },
        data: data.data
    }, ]
}
	mychart.setOption(option);
}
function createLine4(mychart,data){
	var option = {
    backgroundColor: '#fff',
    title: {
        text: data.title,
 		
        textStyle: {
            fontWeight: 'normal',
            fontSize: 16,
            color: '#333'
        },
        left: '45%'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            lineStyle: {
                color: '#333'
            }
        }
    },
    legend: {
        icon: 'rect',
        top:'10%',
        itemWidth: 14,
        itemHeight: 5,
        itemGap: 13,
        data: data.legend,
        right: 'center',
        textStyle: {
            fontSize: 12,
            color: '#333'
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        top:'24%',
        containLabel: true
    },
    xAxis: [{
        type: 'category',
        boundaryGap: false,
        axisLine: {
            lineStyle: {
                color: '#ccc'
            }
        },
        splitLine: {
            show:true,
            lineStyle: {
                type: 'solid',
                color: '#ccc'
            }
        },
        axisLabel: {
            margin: 10,
            textStyle: {
                fontSize: 14,
                color: '#999'
            }
        },
        data: data.xdata
    }],
    yAxis: [{
        type: 'value',
        name: '比例',
       
        axisLine: {
            lineStyle: {
                color: '#999'
            }
        },
        axisLabel: {
            margin: 10,
            textStyle: {
                fontSize: 14,
                color: '#999'
            }
        },
        splitLine: {
            lineStyle: {
                type: 'solid',
                color: '#ccc'
            }
        }
    }],
    series: [{
        name: data.title,
        type: 'line',
        
        symbol: 'circle',
        symbolSize: 5,
        showSymbol: false,
        lineStyle: {
            normal: {
                width: 1
            }
        },
       
        itemStyle: {
            normal: {
                color: '#52c4f1',
                borderColor: '#52c4f1',
                borderWidth: 12

            }
        },
        data: data.data
    }, ]
}
	mychart.setOption(option);
}
