$(function () {

    loadDeps([ basePath +"dictionary/AgreementState.json"],function(loadedData){
        $.post(basePath+"rest/summary/houseUsed",null,null,"json").done(function(rsp){
            if(rsp.resultCode =="0000"){
                var chartData=[];
                var chartLabel=[];
                $.each(rsp.data,function(index,item){
                    if(item.name && item.name.length > 0){
                        var dic = findArrayValue(item.name,loadedData[0]);
                        var label = dic&&dic.text?dic.text:"未知类型";
                        chartData.push({name:label,value:item.value});
                        chartLabel.push(label);
                    }else{
                        chartData.push({name:"闲置",value:item.value});
                        chartLabel.push("闲置")
                    }
                });
                houseUsed_pie_option = {
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'right',
                        data: chartLabel
                    },
                    series : [
                        {
                            name: '房产使用',
                            type: 'pie',
                            radius : '75%',
                            center: ['50%', '60%'],
                            data:chartData,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                var myChart = echarts.init(document.getElementById('houseUsed'));
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(houseUsed_pie_option);
            }else{
                layer.alert(rsp.description,{title:"数据拉取失败",icon:7})
            }
        });

        $.post(basePath+"rest/summary/monthChargeSummary",null,null,"json").done(function(rsp){
            if(rsp.resultCode =="0000"){
                var data = [0,0,0,0,0,0,0,0,0,0,0,0];
                $.each(rsp.data,function(index,item){
                    data[item.month] = item.payable
                });
                houseCharge_bar_option = {
                    tooltip: {},
                    legend: {
                        data:['收缴合计']
                    },
                    xAxis: {
                        data: ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
                    },
                    yAxis: {},
                    series: [{
                        name: '应收合计',
                        type: 'bar',
                        data: data
                    }]
                };
                var myChart = echarts.init(document.getElementById('houseChargeYear'));
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(houseCharge_bar_option);
            }else{
                layer.alert(rsp.description,{title:"数据拉取失败",icon:7})
            }
        });

        $.post(basePath+"rest/summary/yearChargeSummary",null,null,"json").done(function(rsp){
            if(rsp.resultCode =="0000"){
                $("#yearPayable").html(rsp.data?rsp.data.payable:0);
                houseCharge_pie_option = {
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'right',
                        data: ['应收账款','实收账款']
                    },
                    series : [
                        {
                            name: '租金收缴',
                            type: 'pie',
                            radius : '75%',
                            center: ['50%', '60%'],
                            data:[
                                {value:rsp.data?rsp.data.payable:0, name:'应收账款'},
                                {value:rsp.data?rsp.data.payment:0, name:'实收账款'},
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                var myChart = echarts.init(document.getElementById('houseCharge'));
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(houseCharge_pie_option);
            }else{
                layer.alert(rsp.description,{title:"数据拉取失败",icon:7})
            }
        });

        $.post(basePath+"rest/summary/yearChargeSummaryRound",null,null,"json").done(function(rsp){
            if(rsp.resultCode =="0000"){
                var source = [['product', '应收', '实收']];
                $.each(rsp.data,function(index,item){
                    var data = new Array();
                    data.push(item.year);
                    data.push(item.payable);
                    data.push(item.payment);
                    source.push(data);
                });
                houseUsed_bar_option = {
                    legend: {},
                    tooltip: {},
                    dataset: {
                        source: source
                    },
                    xAxis: {type: 'category'},
                    yAxis: {},
                    // Declare several bar series, each will be mapped
                    // to a column of dataset.source by default.
                    series: [
                        {type: 'bar'},
                        {type: 'bar'}
                    ]
                };
                var myChart = echarts.init(document.getElementById('houseUsedYear'));
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(houseUsed_bar_option);
            }else{
                layer.alert(rsp.description,{title:"数据拉取失败",icon:7})
            }
        });

        $.post(basePath+"rest/summary/bannerSummary",null,null,"json").done(function(rsp){
            if(rsp.resultCode =="0000"){
                $("#housesCount").html(rsp.data[0].value);
                $("#housesAreaCount").html(rsp.data[1].value)
                $("#idleHousesCount").html(rsp.data[2].value)
            }else{
                layer.alert(rsp.description,{title:"数据拉取失败",icon:7})
            }
        });

    });

})