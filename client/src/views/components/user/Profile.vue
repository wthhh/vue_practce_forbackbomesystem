<template>
    <v-card>
        <v-card-text>
            <v-form class="px-3" ref="form">
                <span class=""><v-icon >account_box</v-icon>上传照片</span>
                <div id="fileArea">
                    <input type="file" name="pic" accept="image/*"  @change="fileSelect"/>
                </div>
                
                <v-text-field label="user name" v-model="username" prepend-icon="person"></v-text-field>
                <v-select v-model="genderselect" :items="genderitems" label="gender" prepend-icon="wc"></v-select>
                <v-menu ref="menu" v-model="menu" :close-on-content-click="false" :nudge-right="40" lazy transition="scale-transition" offset-y full-width min-width="290px">
                  <template v-slot:activator="{ on }">
                    <v-text-field v-model="date" label="Birthday date" prepend-icon="event" readonly v-on="on"></v-text-field>
                  </template>
                  <v-date-picker ref="picker" v-model="date" :max="new Date().toISOString().substr(0, 10)" min="1950-01-01" @change="savedate"></v-date-picker>
                </v-menu>
                <v-select v-model="nationselect" :items="nationitems" label="nation" prepend-icon="home"></v-select>
                <v-text-field label="native place" v-model="nativeplace" prepend-icon="place"></v-text-field>
                <v-select v-model="politicalselect" :items="politicalitems" label="political outlook" prepend-icon="group"></v-select>
                <v-text-field label="college" v-model="college" prepend-icon="school"></v-text-field>
                <v-text-field label="grade" v-model="grade" prepend-icon="school"></v-text-field>
                <v-text-field label="majorset" v-model="majorset" prepend-icon="school"></v-text-field>
                <v-text-field label="eduset" v-model="eduset" prepend-icon="school"></v-text-field>
                <v-text-field label="phone" v-model="phone" prepend-icon="school"></v-text-field>
                <v-text-field label="email" v-model="email" prepend-icon="school"></v-text-field>
                <v-textarea label="edu background" v-model="eduback" prepend-icon="edit"></v-textarea>
                <v-textarea label="gra exp" v-model="ug_exp" prepend-icon="edit"></v-textarea>
                <v-textarea label="other exp" v-model="other_exp" prepend-icon="edit"></v-textarea>
                <v-spacer></v-spacer>
                <v-btn flat right class="primary mt-0 mt-3" @click="submit">Submit</v-btn>
            </v-form>
        </v-card-text>
    </v-card>
</template>

<script>
import profiledata from '@/api/profiledata'
export default {
    props:['psid','sname','puid','paid'],
    data(){
        return{
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
            nationitems:['汉族','满族','蒙古族','回族','藏族','维吾尔族','苗族','彝族','壮族','布依族','侗族','瑶族','白族','土家族','哈尼族','哈萨克族','傣族','黎族','傈僳族','佤族','畲族','高山族','拉祜族','水族','东乡族','纳西族','景颇族','柯尔克孜 族','土族','达斡尔族','仫佬族','羌族','布朗族','撒拉族','毛南族','仡佬族','锡伯族','阿昌族','普米族','朝鲜族','塔吉克族','怒族','乌孜别克族','俄罗斯族','鄂温克族','德昂族','保安族','裕固族','京族','塔塔尔族','独龙族','鄂伦春族','赫哲族','门巴族','珞巴族','基诺族',],
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
        fileSelect(event){
            // console.log(event)
            this.selectedfile=event.target.files[0]

        },
        async submit(){
        console.log("this is child sid")
        console.log(this.userInfo)
        let forrm = {
            image:this.selectedfile,
            uid:this.userInfo.uid,
            stu_id:this.userInfo.stu_id,
            username:this.username,
            gender:this.genderselect,
            birth:this.date,
            nation:this.nationselect,
            birthplace:this.nativeplace,
            political:this.politicalselect,
            college:this.college,
            grade:this.grade,
            majorset:this.majorset,
            eduset:this.eduset,
            phone:this.phone,
            email:this.email,
            eduback:this.eduback,
            ug_exp:this.ug_exp,
            other_exp:this.other_exp,
        }
        console.log("this is ffooommmm")
        console.log(forrm)
        let res = null
          //console.log("now is coming to here")
        res = await profiledata.update(forrm)
        //util.response(res, this)
        //console.log(res)
        if (res.code === 200) {
          console.log("update profile sucesss")
        } else {
          console.log("update profile faillll")
        }
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
</style>

    