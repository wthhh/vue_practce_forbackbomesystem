
<style>
    .echarts {
        width: 100%;
        height: 100%;
    }
</style>

<template>
<div>
    <v-layout class="mt-4" wrap align-center justify-start >
        <v-flex xs12 sm6 >
              <v-chart  :options="polar"/>

        </v-flex>
        <v-flex xs12 sm6 >  
            <v-chart  :options="polar1"/>

        </v-flex>
        <v-flex xs12 sm6 >  
            <v-chart  :options="polar2"/>

        </v-flex>
    </v-layout>
</div>
</template>

<script>
import ECharts from 'vue-echarts/components/ECharts'
import api from '@/api'
import userdata from '@/api/userdata'

// import theme from '../theme.json'
// ECharts.registerTheme('ovilia-green', theme); //引入主题  
export default {
    components: {
    'v-chart': ECharts
    },
    data () {
        return {
            polar: {
                title : {
                    text: '用户民族数据统计',
                    subtext: '',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
               
                series : [
                    {
                        name: '民族',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '40%'],
                        data:[
                        
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    },
                    // {
                    //     name: '性别',
                    //     type: 'pie',
                    //     radius : '55%',
                    //     center: ['70%', '60%'],
                    //     data:[
                        
                    //     ],
                    //     itemStyle: {
                    //         emphasis: {
                    //             shadowBlur: 10,
                    //             shadowOffsetX: 0,
                    //             shadowColor: 'rgba(0, 0, 0, 0.5)'
                    //         }
                    //     }
                    // },
                    // {
                    //     name: '政治面貌',
                    //     type: 'pie',
                    //     radius : '55%',
                    //     center: ['90%', '60%'],
                    //     data:[
                        
                    //     ],
                    //     itemStyle: {
                    //         emphasis: {
                    //             shadowBlur: 10,
                    //             shadowOffsetX: 0,
                    //             shadowColor: 'rgba(0, 0, 0, 0.5)'
                    //         }
                    //     }
                    // }
                ],
            },
            polar1: {
                title : {
                    text: '用户性别数据统计',
                    subtext: '',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                
                series : [
                    {
                        name: '性别',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '40%'],
                        data:[
                            
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    },
                    
                ]
            },
            polar2: {
                title : {
                    text: '用户政治面貌数据统计',
                    subtext: '',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                
                series : [
                    {
                        name: '政治面貌',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '40%'],
                        data:[
                        
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ],
            },
        }
    },
  
    async created(){
        {
            // console.log('now is validate')
            let res = await userdata.getNationData()
            // console.log(res.data)
            // await util.sleep()
            console.log(res)
            if (res.code === 200) {
                let sum=0;
                let dataItems=['汉族','满族','蒙古族','回族','藏族','维吾尔族','苗族','彝族','壮族','布依族','侗族','瑶族','白族','土家族','哈尼族','哈萨克族','傣族','黎族','傈僳族','佤族','畲族','高山族','拉祜族','水族','东乡族','纳西族','景颇族','柯尔克孜族','土族','达斡尔族','仫佬族','羌族','布朗族','撒拉族','毛南族','仡佬族','锡伯族','阿昌族','普米族','朝鲜族','塔吉克族','怒族','乌孜别克族','俄罗斯族','鄂温克族','德昂族','保安族','裕固族','京族','塔塔尔族','独龙族','鄂伦春族','赫哲族','门巴族','珞巴族','基诺族',];
                let fiveData =[
                                    {value:0, name:''},
                                    {value:0, name:''},
                                    {value:0, name:''},
                                    {value:0, name:''},
                                    {value:0, name:''}
                                ]

                for(var i=0;i<56;i++){
                    sum+=res.data[i];
                    if (res.data[i]>fiveData[0].value){
                        fiveData[3].value=fiveData[2].value;
                        fiveData[3].name=fiveData[2].name;
                        fiveData[2].value=fiveData[1].value;
                        fiveData[2].name=fiveData[1].name;
                        fiveData[1].value=fiveData[0].value;
                        fiveData[1].name=fiveData[0].name;
                        fiveData[0].value=res.data[i];
                        fiveData[0].name=dataItems[i];
                    }
                    else if (res.data[i]>fiveData[1].value){
                        fiveData[3].value=fiveData[2].value;
                        fiveData[3].name=fiveData[2].name;
                        fiveData[2].value=fiveData[1].value;
                        fiveData[2].name=fiveData[1].name;
                        fiveData[1].value=res.data[i];
                        fiveData[1].name=dataItems[i];
                    }
                    else if (res.data[i]>fiveData[2].value){
                        fiveData[3].value=fiveData[2].value;
                        fiveData[3].name=fiveData[2].name;
                        fiveData[2].value=res.data[i];
                        fiveData[2].name=dataItems[i];
                    }
                    else if (res.data[i]>fiveData[3].value){
                        fiveData[3].value=res.data[i];
                        fiveData[3].name=dataItems[i];
                    }
                    
                }
                fiveData[4].name="其他"
                fiveData[4].value=sum-fiveData[0].value-fiveData[1].value-fiveData[2].value-fiveData[3].value;
                let j=-1                 

                for (var i=0;i<5;i++){
                    if (fiveData[i].value!==0){
                        this.polar.series[0].data.push(fiveData[i])
                    }
                }                               console.log(this.polar.series[0].data)


            } else {
                console.log(res.error)
            }
                
        }
        {
            // console.log('now is validate')
            let res = await userdata.getGenderData()
            // console.log(res.data)
            // await util.sleep()
            console.log(res)
            if (res.code === 200) {
                let sum=0;
                let genderitems=['Male','Female'];
                let genderDate =[
                                    {value:0, name:'Male'},
                                    {value:0, name:'Female'},
                                ]

                for(var i=0;i<2;i++){
                    sum+=res.data[i];
                    genderDate[i].value=res.data[i]
                }
                let j=-1                 

                for (var i=0;i<2;i++){
                    this.polar1.series[0].data.push(genderDate[i])
                }                               


            } else {
                console.log(res.error)
            }
                
        }
        {
            // console.log('now is validate')
            let res = await userdata.getPoliticalData()
            // console.log(res.data)
            // await util.sleep()
            console.log(res)
            if (res.code === 200) {
                let sum=0;
                let dataItems=['中共党员','中共预备党员','共青团员','民革党员','民盟盟员','民建会员','民进会员','农工党党员','致公党党员','九三学社社员','台盟盟员','无党派人士','群众']
                let fiveData =[
                                    {value:0, name:''},
                                    {value:0, name:''},
                                    {value:0, name:''},
                                    {value:0, name:''},
                                    {value:0, name:''}
                                ]

                for(var i=0;i<56;i++){
                    sum+=res.data[i];
                    if (res.data[i]>fiveData[0].value){
                        fiveData[3].value=fiveData[2].value;
                        fiveData[3].name=fiveData[2].name;
                        fiveData[2].value=fiveData[1].value;
                        fiveData[2].name=fiveData[1].name;
                        fiveData[1].value=fiveData[0].value;
                        fiveData[1].name=fiveData[0].name;
                        fiveData[0].value=res.data[i];
                        fiveData[0].name=dataItems[i];
                    }
                    else if (res.data[i]>fiveData[1].value){
                        fiveData[3].value=fiveData[2].value;
                        fiveData[3].name=fiveData[2].name;
                        fiveData[2].value=fiveData[1].value;
                        fiveData[2].name=fiveData[1].name;
                        fiveData[1].value=res.data[i];
                        fiveData[1].name=dataItems[i];
                    }
                    else if (res.data[i]>fiveData[2].value){
                        fiveData[3].value=fiveData[2].value;
                        fiveData[3].name=fiveData[2].name;
                        fiveData[2].value=res.data[i];
                        fiveData[2].name=dataItems[i];
                    }
                    else if (res.data[i]>fiveData[3].value){
                        fiveData[3].value=res.data[i];
                        fiveData[3].name=dataItems[i];
                    }
                    
                }
                fiveData[4].name="其他"
                fiveData[4].value=sum-fiveData[0].value-fiveData[1].value-fiveData[2].value-fiveData[3].value;
                let j=-1                 

                for (var i=0;i<5;i++){
                    if (fiveData[i].value!==0){
                        this.polar2.series[0].data.push(fiveData[i])
                    }
                }                              


            } else {
                console.log(res.error)
            }
                
        }        
    },
}
</script>