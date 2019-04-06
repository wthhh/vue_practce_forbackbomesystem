<template lang="pug">
  <v-container>
    <v-card class="mt-4">
      div.pl-3
        <div class="font-weight-medium display-1 py-4"> {{ 'Testdata' }}</div>
      <v-divider />
      div
        <v-btn class="primary info.z-index-1" fab absolute top right dark @click.stop="add">
          <v-icon>add</v-icon>
        </v-btn>
      <v-data-table class="elevation-1" :loading="loading" :headers="headers" :items="data" hide-actions>
        <template slot="headerCell" slot-scope="props">
          <v-tooltip bottom>
            <span slot="activator"> {{ props.header.text }}</span>
            <span> {{ props.header.text }</span>
          </v-tooltip>
        </template>
        <template slot="items" slot-scope="props">
          <td> {{ props.item.id }}</td>
          <td class="text-xs-left"> {{ props.item.name }}</td>
          <td class="text-xs-left">
            <v-chip v-if="props.item.status" label outline> {{props.item.status}}</v-chip>
          </td>
          <td class="justify-left">
            <v-btn class="my-1 mr-2 primary" fab small dark @click="edit(props)">
              <v-icon>edit</v-icon>
            </v-btn>
            <v-btn class="my-1 mr-2 error" fab small dark @click="del(props)">
              <v-icon>delete</v-icon>
            </v-btn>
            <v-btn class="my-1 mr-2 success" fab small dark v-if="props.item.status === 1" @click="enable(props)">
              //- <slot> {{'Disable'}}</slot>
              <v-icon>check</v-icon>
            </v-btn>
            <v-btn class="my-1 mr-2 error" fab small dark v-else @click="enable(props)">
              //- <slot> {{'Enable'}}</slot>
              <v-icon>close</v-icon>
            </v-btn>
          </td>
        </template>
        template(slot="no-data")
          v-alert(:value="true" class="error" icon="warning" outline) Sorry, no data!
      </v-data-table>
    </v-card>
    v-dialog(v-model="show" width="500px" persistent)
      v-card
        v-card-title.headline.grey.lighten-2(primary-title) {{title}}
        v-card-text
          v-form(ref="form" v-model="valid" lazy-validation)
            v-text-field(v-model="ruleForm.name" :rules="nameRules" label="Name" required)
            v-text-field(v-model="ruleForm.status" label="Status" required)
            v-btn.mt-2.mr-2(@click="cancel" dark)
              v-icon(dark left) mdi-close-circle
              slot {{'Cancel'}}
            v-btn.mt-2(:disabled="!valid" @click="submit" color="primary")
              v-icon(dark left) check_circle
              slot {{'Submit'}}
    MyLoading(ref="loading")
    MyMessage(ref="message")
    MyComfirm(ref="comfirm")
    </v-container>
</template>
<script>
import util from '@/utils'
import api from '@/api'
import testdata from '@/api/testdata'
export default{
  name: 'testdata-index',
  data () {
    return {
      self: this,
      loading: false,
      ruleForm: {
        name: null,
        status: null
      },
      type: 1,
      show: false,
      valid: true,
      nameRules: [
        v => !!v || 'Name is required'
      ],
      headers: [
        { text: 'Index', sortable: false },
        { text: 'Name', sortable: false },
        { text: 'Status', sortable: false },
        { text: 'Action', sortable: false }
      ],
      data: [],
      title: '添加部门'
    }
  },
  component:{
    
  },
  methods: {
    add () {
      this.title = 'Add'
      this.type = 1
      this.show = true
      this.$nextTick(() => {
        this.$refs.form.reset()
        delete this.ruleForm.id
      })
    },
    edit (e) {
      this.title = 'Edit'
      this.type = 2
      this.ruleForm = util.cloneDeep(e.item)
      this.show = true
    },
    async del (e) {
      let s = this
      let res = await testdata.del(e.item.id)
          //util.response(res, this)
      //console.log("thisis ressss")
      //console.log(res)
      if (res.code === 200) {
        s.data.splice(e.index, 1)
        s.$refs.message.open(res.error)
      } else {
        //console.log("dellllllll")
        //s.$refs.message.open(res.error, 'error')
      }
      //s.$refs.comfirm.close()
    },
    cancel () {
      this.show = false
    },
    async enable (e) {
      let data = {
        'id': e.item.id,
        'status': e.item.status === 0 ? 1 : 0
      }
      let res = await testdata.enable(data)
      //util.response(res, this)
      if (res.code === 200) {
        e.item.status = data.status
      } else {
        this.$refs.message.open(res.error, 'error')
        consolo.log("idk what to write here")
      }
    },
    async submit () {
      if (this.$refs.form.validate()) {
        this.$refs.loading.open()
        let res = null
        if (this.type === 1) {
          //console.log("now is coming to here")
          res = await testdata.save(this.ruleForm)
          this.$refs.loading.close()
        } else {         
          res = await testdata.update(this.ruleForm)
        }
        this.$refs.loading.close()
        //util.response(res, this)
        //console.log(res)
        if (res.code === 200) {
          this.$refs.message.open('操作成功', 'success')
          this.show = false
          this.getData()
        } else {
          this.$refs.message.open(res.error, 'error')
        }
      }
    },
    async getData () {
      //console.log("now is getdata")
      this.loading = true
      let res = await testdata.index()
      //console.log("asdasdas")
      //util.response(res, this)
      this.loading = false
      if (res.code === 200) {
        this.data = res.data
      }
    }
  },
  created () {
    console.log("this is admin tstdata created")
    this.getData()
  }
}
</script>
<style lang="less" scoped>
.v-btn{
  margin-left: 0px;
  margin-right: 0px;
  margin-top: 0px;
  margin-bottom: 0px;
}
table tr{
  th span{
    font-size:14px;
  }
  td{
    font-size:14px;
  }
}
</style>
