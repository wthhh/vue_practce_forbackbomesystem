<template>
        <v-dialog max-width="1000px">
            <v-btn flat slot="activator" class="accent">Issue
                <v-icon right>add</v-icon>
            </v-btn>
            <v-card>
                <v-card-title>
                    <h2>Add Issue to {{pname}}::{{ipid}}</h2>
                </v-card-title>
                <v-card-text>
                    <v-form class="px-3" ref="form">
                        <v-text-field label="issue title" v-model="ititle" prepend-icon="folder"></v-text-field>
                        <v-textarea label="issue content" v-model="icontent" prepend-icon="edit"></v-textarea>
                        <v-spacer></v-spacer>
                        <v-btn flat right class="primary mt-0 mt-3" @click="submit">Submit</v-btn>
    
                    </v-form>
                </v-card-text>
            </v-card>
        </v-dialog>
    </template>
    
    <script>
    import issuedata from '@/api/issuedata'
    export default {
        props:['ipid','pname'],
        data(){
            return{
                ititle:'',
                icontent:'',
                due:null,
                show:false,
                inputRules:[
                    v => v.length >= 3 || 'Minimum length is 3 characters'
                ],
            }
        },
        computed:{
            getIpid:function (){
                return this.ipid
            },
        },
        methods:{
            async submit(){
            console.log("this is IIIIIIIIIIIIIIPPPPPPPPPPPP child sid")
            console.log(this.getIpid,this.ititle,this.icontent)
            let forrm = {
                pid:this.getIpid,
                title:this.ititle,
                content:this.icontent
            }
            console.log(forrm)
            let res = null
              //console.log("now is coming to here")
            res = await issuedata.save(forrm)
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
        
        