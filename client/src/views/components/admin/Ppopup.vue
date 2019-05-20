<template>
        <v-dialog max-width="1000px">
            <v-btn flat slot="activator" class="accent">Project
                <v-icon right>add</v-icon>
            </v-btn>
            <v-card>
                <v-card-title>
                    <h2>Add Project</h2>
                </v-card-title>
                <v-card-text>
                    <v-form class="px-3" ref="form">
                        <v-text-field label="project name" v-model="pname" prepend-icon="folder"></v-text-field>
                        <v-text-field label="project content" v-model="content" prepend-icon="edit"></v-text-field>
                        <v-text-field label="student id" v-model="uid" prepend-icon="edit"></v-text-field>
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
        props:['paid'],
        data(){
            return{
                pname:'',
                content:'',
                uid:'',
                due:null,
                show:false,
                inputRules:[
                    v => v.length >= 3 || 'Minimum length is 3 characters'
                ],
            }
        },
        computed:{
            getpaid:function (){
                return this.paid
            },
        },
        methods:{
            async submit(){
            console.log("this is IIIIIIIIIIIIIIPPPPPPPPPPPP child sid")
            console.log(this.getpaid)
            let forrm = {
                aid:this.getpaid,
                pname:this.pname,
                content:this.content,
                uid:this.uid
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