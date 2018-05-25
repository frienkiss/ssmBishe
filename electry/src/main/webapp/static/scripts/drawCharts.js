  function createLineCharts(mychart,data){
	
	    console.log("echart"+data);
		var maxOption = {
			    title: {
			        text: '趋势分析',
			 
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['最大负荷分析','最小负荷分析']
			    },
			    grid:{
			    	right:50,
			    	left:80
			    },
			    toolbox: {
			        show: true,
			        feature: {
			            dataZoom: {},
			            dataView: {readOnly: false},
			            magicType: {type: ['line', 'bar']},
			            restore: {},
			            saveAsImage: {}
			        }
			    },
			    xAxis:  {
			        type: 'category',
			        boundaryGap: false,
			        data: data.pdate,
			    },
			    yAxis: {
			        type: 'value',
			        axisLabel: {
			            formatter: '{value}'
			        }
			    },
			    series: [
			        {
			            name:'最大负荷分析',
			            type:'line',
			            color:'#81EABF',
			            data:data.pvalue,
			            itemStyle:{
			            		normal:{
			            			color:'#32d2c8'
			            		}
			        
			            },
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            },
			            markLine: {
			                data: [
			                    {type: 'average', name: '平均值'}
			                ]
			            }
			        },
			         {
			            name:'最小负荷分析',
			            type:'line',
			            color:'#A476BA',
			            data:data.pvalue2,
			            itemStyle:{
		            		normal:{
		            			color:'#FF68F4'
		            		}
		        
			            },
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            },
			            markLine: {
			                data: [
			                    {type: 'average', name: '平均值'}
			                ]
			            }
			        } 
			    ]
			};


	    mychart.setOption(maxOption);
  }
  function createLineCharts2(mychart,data){
		
	    console.log("echart"+data);
		var maxOption = {
			    title: {
			        text: '趋势分析',
			 
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
//			    legend: {
//			        data:['最大负荷分析','最小负荷分析']
//			    },
			    grid:{
			    	right:50,
			    	left:80
			    },
			    toolbox: {
			        show: true,
			        feature: {
			            dataZoom: {},
			            dataView: {readOnly: false},
			            magicType: {type: ['line', 'bar']},
			            restore: {},
			            saveAsImage: {}
			        }
			    },
			    xAxis:  {
			        type: 'category',
			        boundaryGap: false,
			        data: data.pdate,
			    },
			    yAxis: {
			        type: 'value',
			        axisLabel: {
			            formatter: '{value}'
			        },
			        
			    },
			    series: [
			        {
			            name:'最大负荷分析',
			            type:'line',
			            color:'#81EABF',
			            data:data.pvalue,
			            itemStyle:{
			            		normal:{
			            			color:'#32d2c8'
			            		}
			        
			            },
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            },
			            markLine: {
			                data: [
			                    {type: 'average', name: '平均值'}
			                ]
			            }
			        },
			         {
			            name:'最小负荷分析',
			            type:'line',
			            color:'#A476BA',
			            data:data.pvalue2,
			            itemStyle:{
		            		normal:{
		            			color:'#FF68F4'
		            		}
		        
			            },
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            },
			            markLine: {
			                data: [
			                    {type: 'average', name: '平均值'}
			                ]
			            }
			        } 
			    ]
			};


	    mychart.setOption(maxOption);
}
  function createPieEcharts(mychart,data){
	  
	  option = {
		  	  
		  	  
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
		  	        data:data
		  	    }]
		  	};
		  	mychart.setOption(option);
  }
  function createPieEcharts2(mychart,data){
	  var dataname=[];//var dataname; 会因为dataname为undefined导致dataname[0]报错
	  console.log(data);
	  for(var i=0;i<data.length;i++){
		  console.log(data[0]);
		  dataname[i]=data[i].name;
	  }
	  //dataname[data.length]="其他监测点";
	  option = {
		  	    backgroundColor: '#fff',
		  	  title:{
	  	    		text:'碳排放量TOP3',
	  	    		x:'center',
	  	    		y:'top',
	  	    		bottom:'20'
	  	    },
		  	    tooltip: {
		  	        trigger: 'item',
		  	        formatter: "{b}: {c} ({d}%)",
		  	    },
		  	    legend: {
		  	        orient : 'vertical',
		  	        x : 'left',
		  	        data:dataname
		  	    },
		  	    color: ['#33CC99', '#e47070', '#55b4e3', '#eab2f6', '#ccc', '#FF9966','#CF49E1','#CF49E1' ],
		  	    series: [{
		  	        name: '',
		  	        type: 'pie',
		  	       
		  	        radius: ['0', '80%'],
		  	        label: {
		  	            normal: {
		  	                formatter: '{b}\n{d}%'
		  	            },

		  	        },
		  	        selectedMode: 'single',
		  	        data:data
		  	    }]
		  	};
		  	mychart.setOption(option);
  }
  function createBarCharts(myChart){
	  //二氧化碳柱形分析图
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
		  	        data: ['01/02', '01/03', '01/04', '01/05', '01/06', '01/07', '01/08', '01/09', '01/10', '01/11', '01/12', '01/13'],
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
		  	myChart.setOption(co_option);

  }
//其他柱形图函数
  function createBarChart2(mychart,data){
	//品牌分析/渠道分析
	var  option = {
	      timeline: {
	          data:['监测点1','监测点2','监测点3','监测点4','监测点5','监测点6','监测点7','监测点8','厂房9',],
	          left:'10%',
	          right:'10%',
	          bottom:0,
	          height:60,
	          axisType: 'category',
	          show: true,
	          autoPlay: false,
	          playInterval: 1000,
	          checkpointStyle: {
	              color: '#04a5f1',
	              borderColor: 'rgba(4, 165, 261, .5)'
	          },
	          label:{
	                normal:{
	                  formatter: function(v) {
	                  var _txt = v.replace(/\//igm, '\n');
	                  return _txt;},
	                  rotate:-45, 
	                  position:'bottom'}
	                },
	          itemStyle: {
	              normal: {
	                  color: '#04a5f1'
	              },
	              emphasis: {
	                  color: '#04a5f1'
	              }
	          },
	          lineStyle: {
	              color: '#ddd'
	          },
	          controlStyle:{
	                  show: false,
	                },
	      },
	      options: [{
	         tooltip: {
	          trigger: 'axis',
	          axisPointer: {
	              type: 'cross',
	              label: {
	                   backgroundColor:'rgba(255,255,255,0.8)',
	                   extraCssText: 'box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);',
	                   textStyle:{
	                   color:'#666',},
	          },       
	          },
	          backgroundColor:'rgba(255,255,255,0.8)',
	          extraCssText: 'box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);',
	          textStyle:{
	              color:'#666',
	          },
	      }, 
	         toolbox: {
	              'show': true,
	              // orient: 'vertical',
	              //x: 'right',
	              //y: 'center',
	              feature: {
	                  'magicType': {
	                      'show': true,
	                      'type': ['bar', 'line']
	                  },
	              restore: {
	                      'show': true
	                  },
	              saveAsImage: {
	                      'show': true
	                  }
	              }
	          },
	          legend: {
	          data:['零售量','零售额'],
	          },
	          grid: {
	          top: '100',
	          left: '3%',
	          right: '4%',
	          bottom: '80',
	          containLabel: true
	           },
	          xAxis: [{
	           type: 'category',
	           data: ['1#厂房1','2#厂房1','2#厂房1','1#厂房2','1#厂房2','2#厂房3','1#厂房3','1#厂房6','1#厂房3','1#厂房4','1#厂房5','2#厂房4','1#厂房5','2#厂房4'],
	           axisLabel: { //坐标轴刻度标签的相关设置。
	  				interval: 0,//设置为 1，表示『隔一个标签显示一个标签』
	  			    //rotate:-30,
	  				textStyle: {
	  					color: '#666',
	  					fontStyle: 'normal',
	  				}
	  			},
	  		axisLine:{//坐标轴轴线相关设置
	  				lineStyle:{
	  					color:'#666',
	  					opacity:1
	  				}
	  			},
	  		splitLine: { //坐标轴在 grid 区域中的分隔线。
	  				show: false,
	  			}
	  		}
	       ],
	  	yAxis: [
	  	   	   {   
	  		    name: '负荷(kw.h)',
	  			type: 'value',
	  			axisLabel: {
	  				textStyle: {
	  					color: '#666',
	  				}
	  			},
	  			axisLine:{
	  				show: false
	  			},
	  			axisTick:{
	  				show: false
	  			},
	  			splitLine: {
	  				show: false,
	  			}

	  		},{   
	  		    name: '负荷(kw.h)',
	  			type: 'value',
	  			position: 'right',
	  			axisLabel: {
	  				textStyle: {
	  					color: '#666',
	  					fontStyle: 'normal',
	  				}
	  			},
	  			axisLine:{
	  				show: false
	  			},
	  			axisTick:{
	  				show: false
	  			},
	  			splitLine: {
	  				show: false,
	  			}
	  		}
	  	],
	          series: [{
	              'name': '负荷(kw.h)',
	              'type': 'bar',
	             // barWidth: 15,
	              'data': [11, 49, 13, 24, 23, 11, 3, 85,61, 48, 45,23, 23, 85],
	              itemStyle: {
	              normal: {
	                  //barBorderRadius: 15,
	                  color: new echarts.graphic.LinearGradient(
	                      0, 0, 0, 1,
	                      [
	                          {offset: 0, color: '#229aff'},
	                          {offset: 1, color: '#13bfe8'}
	                      ]
	                  )
	              }}
	          }, {
	              name: '负荷(kw.h)',
	              yAxisIndex: 1,
	              type: 'line',
	              showAllSymbol: true,
	              symbol: 'emptyCircle',
	              symbolSize: 10,
	              data: [61, 48, 45,23, 11, 28, 4, 11, 49, 13, 24, 11, 3, 85],
	              itemStyle: {
	                  normal: {
	                  color:'#fdb94e'},
	          },
	          }]
	      },{
	          title: {
	              'text': '1#厂房1', 
	              'show':false,
	             },
	          series: [{
	              'data': [159, 65, 2, 48, 45,23, 11, 3, 28, 4, 11, 24, 61,260]
	          }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 159, 65]
	          }]
	      }, {
	          title: {
	              'text': '1#厂房2',
	              'show':false,
	          },
	          series: [{
	              'data': [ 9, 6, 56, 41, 70, 1, 0, 35, 44, 2,94, 7, 64, 55]
	          }, {
	              "data": [94, 7, 64, 55, 56, 41, 70, 1, 0, 35, 44, 2, 17, 25]
	          }]
	      }, {
	          title: {
	              'text': '3#厂房3',
	              'show':false,
	          },
	          series: [{
	              'data': [159, 65, 2, 48, 45,23, 11, 3, 28, 4, 11, 24, 61,260]
	          }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 159, 65]
	          }]
	      }, {
	          title: {
	              'text': '1#厂房4',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]
	      }, {
	          title: {
	              'text': '2#厂房5',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1, 0, 35, 44, 41, 70,56,]
	          }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 159, 61]
	          }]
	      }, {
	          title: {
	              'text': '1#厂房6',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1, 0, 35, 44, 41, 70 ,60]
	          }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 159, 61]
	          }]
	      }, {
	          title: {
	              'text': '3#厂房7',
	              'show':false,
	          },
	          series: [{
	               'data': [94, 7, 64, 55, 56, 41, 70, 1, 0, 35, 44, 41, 70,56,]
	          }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 159, 61]
	          }]
	      }, {
	          title: {
	              'text': '1#厂房8',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1, 0, 35, 44, 41, 70,56,]
	          }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 159, 61]
	          }]
	      }, {
	          title: {
	              'text': '2#厂房9',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]
	      }, {
	          title: {
	              'text': '1#厂房10',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]
	      }, {
	          title: {
	              'text': '监测点1',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]
	      }, {
	          title: {
	              'text': '监测点2',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]
	      }, {
	          title: {
	              'text': '监测点3',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]
	      }, {
	          title: {
	              'text': '监测点4',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]
	      }, {
	          title: {
	              'text': '监测点5',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]
	      }, {
	          title: {
	              'text': '监测点6',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]
	      }, {
	          title: {
	              'text': '监测点7',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]
	      }, {
	          title: {
	              'text': '监测点8',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]  
	      }, {
	          title: {
	              'text': '监测点9',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]  
	      }, {
	          title: {
	              'text': '监测点10',
	              'show':false,
	          },
	          series: [{
	              'data': [94, 7, 64, 55, 56, 41, 70, 1,  56, 41, 70, 70,60,80]       
	              }, {
	              'data': [49, 13, 24, 23, 11, 3, 28, 4, 11, 24, 61, 7, 11, 61]
	          }]    
	      }]   
	  };
	mychart.setOption(option);
  }