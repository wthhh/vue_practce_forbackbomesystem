<template>
        <v-dialog max-width="1000px">
            <v-btn flat slot="activator" class="primary">Section
                <v-icon right>add</v-icon>
            </v-btn>
            <v-card>
                <v-card-title>
                    <h2>Add Section</h2>
                </v-card-title>
                <v-card-text>
                    <v-form class="px-3" ref="form">
                        <v-text-field label="Section name" v-model="classname" prepend-icon="folder"></v-text-field>
                        <v-textarea label="Section content" v-model="content" prepend-icon="edit"></v-textarea>
                        <v-spacer></v-spacer>
                        <v-btn flat right class="primary mt-0 mt-3" @click="submit">Submit</v-btn>
    
                    </v-form>
                </v-card-text>
            </v-card>
        </v-dialog>
    </template>
    
    <script>
    import sectiondata from '@/api/sectiondata'
    export default {
        data(){
            return{
                classname:'',
                content:'',
                due:null,
                show:false,
                inputRules:[
                    v => v.length >= 3 || 'Minimum length is 3 characters'
                ],
            }
        },
        computed:{
            
        },
        methods:{
            async submit(){
            console.log("this is IIIIIIIIIIIIIIPPPPPPPPPPPP child sid")
            console.log(this.classname,this.content)
            let forrm = {
                classname:this.classname,
                content:this.content
            }
            console.log(forrm)
            let res = null
              //console.log("now is coming to here")
            res = await sectiondata.save(forrm)
            //util.response(res, this)
            //console.log(res)
            if (res.code === 200) {
                alert("添加成功")
                location.reload()            
            } else {
              console.log("add faillll")
            }
            },
        },
    }
    </script>