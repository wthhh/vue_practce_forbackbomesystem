<template>
    <v-dialog max-width="1000px">
        <v-btn flat slot="activator" class="accent">Enroll
            <v-icon right>add</v-icon>
        </v-btn>
        <v-card>
            <v-card-title>
                <h2>Add Project to {{sname}}::{{puid}}</h2>
            </v-card-title>
            <v-card-text>
                <v-form class="px-3" ref="form">
                    <v-text-field label="project name" v-model="pname" prepend-icon="folder"></v-text-field>
                    <v-textarea label="project content" v-model="pcontent" prepend-icon="edit"></v-textarea>
                    <v-spacer></v-spacer>
                    <v-btn flat right class="primary mt-0 mt-3" @click="submit">Submit</v-btn>

                </v-form>
            </v-card-text>
        </v-card>
    </v-dialog>
</template>

<script>
import projectdata from '@/api/projectdata'
export default {
    props:['psid','sname','puid','paid'],
    data(){
        return{
            pname:'',
            pcontent:'',
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
        getPaid:function (){
            return this.paid
        },
    },
    methods:{
        async submit(){
        console.log("this is child sid")
        console.log(this.pname,this.pcontent,this.getPsid,this.getPuid,this.getPaid)
        let forrm = {
            pname:this.pname,
            uid:this.getPuid,
            aid:this.getPaid,
            content:this.pcontent
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
}
</script>
    
    