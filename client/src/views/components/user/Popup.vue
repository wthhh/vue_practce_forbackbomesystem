<template>
    <v-dialog max-width="1000px">
        <v-btn flat slot="activator" class="accent">Enroll
            <v-icon right>add</v-icon>
        </v-btn>
        <v-card>
            <v-card-title>
                <h2>Add Project to {{sname}} {{pstuid}}</h2>
            </v-card-title>
            <v-card-text>
                <v-form class="px-3" ref="form">
                    <v-text-field label="project name" v-model="pname" prepend-icon="folder"></v-text-field>
                    <!-- <v-textarea label="project content" v-model="pcontent" prepend-icon="edit"></v-textarea> -->
                    <span class=""><v-icon >edit</v-icon>Fill in the issue details below</span>
                    <v-layout>
                        <div  ref="editor" style="text-align:left;width:100%;float:left"></div>
                    </v-layout>      
                    <v-btn flat right class="warning mt-0 mt-3" @click="getContent()">测试</v-btn>

                    <v-btn flat right class="primary mt-0 mt-3" @click="submit">Submit</v-btn>

                </v-form>
            </v-card-text>
        </v-card>
    </v-dialog>
    
</template>

<script>
import projectdata from '@/api/projectdata'
import E from 'wangeditor'

export default { 
    name: 'editor',
    props:['psid','sname','pstuid','paid'],
    data(){
        return{
            editorContent: '',
            pname:'',
            due:null,
            show:false,
            inputRules:[
                v => v.length >= 3 || 'Minimum length is 3 characters'
            ],
        }
    },
    computed:{
        getPsid:function (){
            return this.psid
        },
        getPuid:function (){
            return this.puid
        },
        getPstuid:function (){
            return this.pstuid
        },
        getPaid:function (){
            return this.paid
        },
        getContent: function () {
            alert(this.editorContent);
            return this.editorContent
        },
    },
    methods:{
        
        
        async submit(){
        console.log("this is child sid")
        console.log(this.pname,this.editorContent,this.getPsid,this.getPstuid,this.getPaid)
        let forrm = {
            pname:this.pname,
            stu_id:this.getPstuid,
            aid:this.getPaid,
            content:this.editorContent
        }
        console.log(forrm)
        let res = null
          //console.log("now is coming to here")
        res = await projectdata.save(forrm)
        //util.response(res, this)
        //console.log(res)
        if (res.code === 200) {
          console.log("add sucesss")
        } else {
          console.log("add faillll")
        }
        },
    },
    mounted() {
        var editor = new E(this.$refs.editor)
        editor.customConfig.onchange = (html) => {
          this.editorContent = html
        }
        editor.create()
      }
}
</script>
    
    