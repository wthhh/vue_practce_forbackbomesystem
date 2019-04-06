<template>
  <div>
    <v-toolbar app class="primary" dark>
      <v-toolbar-title>
        <span>Linkstudio-template</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn flat router to="/user/login">
        <span>Login</span>
        <v-icon right>exit_to_app</v-icon>
      </v-btn>
    </v-toolbar>
    <v-content class="ma-4">
      <v-card flat class="mx-5 mt-2 mb-5" align-center>
        <v-card-text class="primary display-1 my-3 white--text text-md-center text-sm-center text-lg-center text-xl-center text-xs-center">
          Welcome to the system, select a section you interested in
        </v-card-text>
      </v-card>
        <v-layout align-center>
            <v-item-group
              v-model="window"
              class="shrink mr-4"
              mandatory
              tag="v-flex"
            >
              <v-item
                v-for="item in data"
                :key="item.sid"
              >
                <div slot-scope="{ active, toggle }">
                  <v-btn :input-value="active" @click="toggle" class="ma-2">
                    <p>{{item.classname}}</p>
                  </v-btn>
                </div>
              </v-item>
            </v-item-group>
        
            <v-flex>
              <v-window
                v-model="window"
                class="elevation-1"
                vertical
              >
                <v-window-item
                  v-for="item in data"
                  :key="item.sid"
                >
                  <v-card flat>
                    <v-card-text>
                      <v-layout align-center mb-3>
                        <strong class="title">{{item.classname}}</strong>
                        <v-spacer></v-spacer>
                      </v-layout>
                      <p>{{item.content}}</p>
                    </v-card-text>
                  </v-card>
                </v-window-item>
              </v-window>
            </v-flex>
          </v-layout>
    </v-content>
        <v-footer app>
            <v-flex class="text-xs-center xs12">
              <v-card class="primary">
                  <v-card-text class="white--text">
                      <span>Linkstudio-template &nbsp;&nbsp;&nbsp;&nbsp;Email —15307130***@fudan.edu.cn</span>
                  </v-card-text>
              </v-card>
            </v-flex>
        </v-footer>
  </div>
</template>
<script>
import util from '@/utils'
import api from '@/api'
import sectiondata from '@/api/sectiondata'
export default{
  name: 'section-index',
  data () {
    return {
      length:3,
      window:0,
      data: [],
    }
  },
  methods: {
    async getData () {
      console.log("now is getdata")
      let res = await sectiondata.index()
      //console.log("asdasdas")
      //util.response(res, this)
      if (res.code === 200) {
        this.data = res.data
      }
    },
  },
  created() {
      console.log("1231231212")
      this.getData()
  },
  beforeCreate(){
      console.log("this is bc")
  }
}
</script>

