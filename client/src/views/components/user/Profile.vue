<template>
    <v-card>
        <v-card-text>
            
            <v-layout align-space-around justify-start column fill-height>
                <div class="userInfoFrame item elevation-5">
                    <div class="left-part">
                        <v-layout row >
                            <v-flex xs5 mt4 >
                                <v-img
                                :src="userInfo['image']"
                                height="95px"
                                weight="75px"
                                contain
                                ></v-img>
                            </v-flex>
                            <v-flex xs7>
                                <div>
                                <div class="headline">{{userInfo['realname']}}</div>
                                <div>{{userInfo['nativeplace']}}</div>
                                <div>{{userInfo['nation']}}</div>
                                </div>
                            </v-flex>
                            
                        </v-layout>

                        <v-btn flat right class="warning mt-5 ml-5" @click="toEditProfile">
                            编辑个人信息
                        </v-btn>
                        <v-btn flat right class="success mt-5 ml-5" @click="toProfilePdf">
                            导出pdf
                        </v-btn>
                    </div>
                    <div class="right-part">
                        
                    </div>
                </div>
                <!-- <div class="userInfoFrame item elevation-5">
                    
                </div> -->
            </v-layout>
        </v-card-text>
    </v-card>
</template>

<script>
import profiledata from '@/api/profiledata'
import util from '@/utils'

export default {
    props:['psid','sname','puid','paid'],
    data(){
        return{
            image:null,
            selectedfile:null,
            username:'',
            nativeplace:'',
            due:null,
            show:false,
            inputRules:[
                v => v.length >= 3 || 'Minimum length is 3 characters'
            ],
            genderitems: ['Male', 'Female'],
            genderselect:'',
            politicalitems: ['中共党员','中共预备党员','共青团员','民革党员','民盟盟员','民建会员','民进会员','农工党党员','致公党党员','九三学社社员','台盟盟员','无党派人士','群众'],
            nationitems:['汉族','满族','蒙古族','回族','藏族','维吾尔族','苗族','彝族','壮族','布依族','侗族','瑶族','白族','土家族','哈尼族','哈萨克族','傣族','黎族','傈僳族','佤族','畲族','高山族','拉祜族','水族','东乡族','纳西族','景颇族','柯尔克孜族','土族','达斡尔族','仫佬族','羌族','布朗族','撒拉族','毛南族','仡佬族','锡伯族','阿昌族','普米族','朝鲜族','塔吉克族','怒族','乌孜别克族','俄罗斯族','鄂温克族','德昂族','保安族','裕固族','京族','塔塔尔族','独龙族','鄂伦春族','赫哲族','门巴族','珞巴族','基诺族',],
            politicalselect:'',
            nationselect:'',
            college:'',
            grade:'',
            majorset:'',
            eduset:'',
            phone:'',
            email:'',
            eduback:'',
            ug_exp:'',
            other_exp:'',
            date:null,
            data: null,
            menu: false
        }
    },
    watch:{
        menu (val) {
        val && setTimeout(() => (this.$refs.picker.activePicker = 'YEAR'))
      }
    },
    computed:{
        getPsid:function (){
            return this.psid
        },
        getPuid:function (){
            return this.puid
        },
        getPaid:function (){
            return this.paid
        },
        userInfo:function () {
            console.log("now is Profile STTTTTTORE")
            console.log(this.$store.getters.getUserInfo)
            return this.$store.getters.getUserInfo
        },
    },
    methods:{
        async toEditProfile(){
            util.toRouter('/user/home/editprofile',this)
        },        
        async toProfilePdf(){
            util.toRouter('/user/home/profilePdf',this)
        },
        savedate (date) {
          this.$refs.menu.save(date)
        },
    },
}
</script>
    
<style>
    #fileArea {
        max-width: 0px;
        margin: 15px 0 5px 32px;
        /* border-style:dotted;
        border-color: black */
    }
    .userInfoFrame{
    /* position: relative; */
    /* top: 55px;
    width: 80%;
    height: 252px; */
    background: #FFFFFF;
    box-shadow: 0 0 20px 0 rgba(59,104,184,0.25);
    border-radius: 10px;
    margin: 20px 40px 20px 40px;
    padding: 20px;
    }
    .left-part {
    display: inline-block;
    vertical-align: top;
    width: 323px;
    }
    .right-part {
    display: inline-block;
    vertical-align: top;
    margin-left: 27.6px;
    }
</style>

    