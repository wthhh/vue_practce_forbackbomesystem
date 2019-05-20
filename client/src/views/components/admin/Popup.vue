<template>
        <v-dialog max-width="1000px">
            <v-btn flat slot="activator" class="accent">Attribute
                <v-icon right>add</v-icon>
            </v-btn>
            <v-card>
                <v-card-title>
                    <h2>Add Attribute to {{classname}}::{{asid}}</h2>
                </v-card-title>
                <v-card-text>
                    <v-form class="px-3" ref="form">
                        <v-text-field label="attribute name" v-model="aname" prepend-icon="folder"></v-text-field>
                        <v-spacer></v-spacer>
                        <v-btn flat right class="primary mt-0 mt-3" @click="submit">Submit</v-btn>
    
                    </v-form>
                </v-card-text>
            </v-card>
        </v-dialog>
    </template>
    
    <script>
    import attributedata from '@/api/attributedata'
    export default {
        props:['asid','classname'],
        data(){
            return{
                aname:'',
                due:null,
                show:false,
                inputRules:[
                    v => v.length >= 3 || 'Minimum length is 3 characters'
                ],
            }
        },
        computed:{
            getAsid:function (){
                return this.asid
            },
        },
        methods:{
            async submit(){
            console.log("this is IIIIIIIIIIIIIIPPPPPPPPPPPP child sid")
            console.log(this.getAsid,this.aname)
            let forrm = {
                sid:this.getAsid,
                aname:this.aname,
            }
            console.log(forrm)
            let res = null
              //console.log("now is coming to here")
            res = await attributedata.save(forrm)
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