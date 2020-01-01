<template>
  <div>
    <el-container>
      <el-aside width="160px">
        <div v-for="u in filterList" :key="u[0].id" class="friendListDiv" :class="{currentChatFriend:uName(u)===nowOther}" @click="toggleFriend(u)">
          <!--   聊天人员       -->
          <el-badge :is-dot="isDot(u)">{{ uName(u) }}</el-badge>
        </div>
        <div style="background-color: #008836;height: 1px;width: 160px;" />
      </el-aside>
      <el-main style="padding-top: 0px;padding-bottom: 0px">
        <div id="chatDiv" ref="chatDiv" class="chatDiv">
          <p v-show="true">与
            <el-tag type="warning" size="small" style="margin-left: 5px;margin-right: 5px">
              <el-link v-if="!isShop()" type="primary" @click="$router.push(`/shop/${nowContactList[0].sid}`)">
                {{ nowContactList[0].sname }}
              </el-link>
              <div v-else>{{ nowContactList[0].cname }}</div>
            </el-tag>
            聊天中
          </p>
          <template v-for="message in nowContactList">
            <!--发送来的消息-->
            <div
              v-if="isFrom(message)"
              :key="message.id"
              style="display: flex;justify-content: flex-start;align-items: center;box-sizing: border-box;"
            >
              <div
                style="display: inline-flex;border-style: solid;border-width: 1px;border-color: #008836;border-radius: 5px;padding: 5px 8px 5px 8px"
              >
                {{ message.content }}
              </div>
            </div>
            <!--发出去的消息-->
            <div
              v-else
              :key="message.id"
              style="display: flex;justify-content: flex-end;align-items: center;box-sizing: border-box;"
            >
              <div
                style="display: inline-flex;border-style: solid;border-width: 1px;border-color: #008836;border-radius: 5px;padding: 5px 8px 5px 8px;margin-right: 3px;background-color: #9eea6a"
              >
                {{ message.content }}
              </div>
            </div>
          </template>
        </div>
        <div style="text-align: left;margin-top: 10px">
          <el-input
            v-model="msg"
            placeholder="请输入内容"
            size="mini"
            style="width: 600px;"
            type="textarea"
            autosize
          />
          <el-button :disabled="false" size="small" type="primary" class="sendBtn" @click="sendMsg"><i
            class="fa fa-send"
            style="margin-right: 15px"
          />发送
          </el-button>
        </div>
      </el-main>

    </el-container>
  </div>
</template>

<script>
import util from '@/utils/util'

export default {
  name: 'ContactDialog',
  props: ['other'],
  data() {
    return {
      contactList: [{
        cid: 20,
        cname: 'atom',
        content: 'Hello world',
        sid: 2,
        sname: 'mai',
        state: '1',
        time: '2019-06-24 12:33:17'
      }],
      filterList: [],

      msg: '',

      nowContactList: [{
        cid: 20,
        cname: '',
        content: '请选择聊天对象',
        sid: 1,
        sname: '无人',
        state: '1',
        time: '2019-06-24 12:33:17'
      }],

      nowOther: '',
      nowOtherId: 1
    }
  },
  created() {
    // 没规定对方是谁
    if (typeof this.other === 'undefined') {
      let url = ''
      let otherId
      if (this.$db.get('ROLES') === '"shop"') {
        url = '/contact/getInfoBySid'
        otherId = 'cid'
      } else {
        url = '/contact/getInfoByCid'
        otherId = 'sid'
      }
      this.$get(url, {
        uid: this.$db.get('USER_ID')
      }).then(res => {
        this.contactList = res.data.data
        // filter
        // console.log(this.contactList)
        this.filterList = util.formatList(this.contactList, otherId)
        // console.log(this.filterList)
        // 当前聊天在第一个
        this.nowContactList = this.filterList[0]
        this.nowOther = this.uName(this.nowContactList)
        this.nowOtherId = this.isShop() ? this.nowContactList[0].cid : this.nowContactList[0].sid
      }).catch(err => console.log(err))
    } else { // 规定了对方
      let params
      if (this.$db.get('ROLES') === '"shop"') {
        params = { sid: this.$db.get('USER_ID'), cid: this.other }
      } else {
        params = { sid: this.other, cid: this.$db.get('USER_ID') }
      }
      this.$get('/contact/getInfoBySidCid', params).then(res => {
        if (res.data.data !== null) {
          this.contactList = res.data.data
        }
        console.log(this.contactList)
        // 此种情况无需 filter
        this.filterList = []
        this.filterList.push(this.contactList)
        // 当前聊天在第一个
        this.nowContactList = this.filterList[0]
        this.nowOther = this.uName(this.nowContactList)
        this.nowOtherId = this.isShop() ? this.nowContactList[0].cid : this.nowContactList[0].sid
      }).catch(err => console.log(err))
    }
    // 设置websocket
    const _this = this
    // this.$webscoket.onmessage = function(res) {
    this.$root.$myWebscoket.onmessage = function(res) {
      console.log(res)
      // TODO: 判断是否属于自己的聊天
      const data = JSON.parse(res.data)
      if (_this.isShop()) { // 商店的情况
        if (data.state === '1') return // 别人发消息给我才要处理
      } else { // 用户的情况
        if (data.state === '0') return
      }
      for (let i = 0, len = _this.filterList.length; i < len; i++) {
        if (String(_this.filterList[i][0].sid) === String(data.sid) &&
            String(_this.filterList[i][0].cid) === String(data.cid)) {
          _this.filterList[i].push(data)
        }
      }
    }
  },
  methods: {
    isShop() {
      return this.$db.get('ROLES') === '"shop"'
    },
    // 发来的消息
    isFrom(message) {
      return (this.isShop() && message.state === '0') || (!this.isShop() && message.state === '1')
    },
    isTo(message) {
      return !this.isFrom(message)
    },
    uName(u) {
      return this.$db.get('ROLES') === '"shop"' ? u[0].cname : u[0].sname
    },

    /**
       * 发送消息
       */
    sendMsg() {
      const date = new Date().Format('yyyy-MM-dd hh:mm:ss')
      // /contact/add
      let params
      if (this.$db.get('ROLES') === '"shop"') {
        params = { cid: this.nowOtherId, sid: this.$db.get('USER_ID'), ctime: date, state: '1', content: this.msg, isRead: '0' }
      } else {
        params = { cid: this.$db.get('USER_ID'), sid: this.nowOtherId, ctime: date, state: '0', content: this.msg, isRead: '0' }
      }
      this.$get('/contact/add', params).then(res => {
        this.$message({
          message: '发送成功',
          type: 'info'
        })
        // 更新视图
        this.msg = ''
        this.nowContactList.push(params)
        // TODO: 广播通知所有用户
        // this.$webscoket.send(JSON.stringify(params))
        this.$root.$myWebscoket.send(JSON.stringify(params))
      }).then(err => console.log(err))
    },
    toggleFriend(otherUser) {
      this.nowContactList = otherUser
      this.nowOther = this.uName(otherUser)
      let params
      if (this.isShop()) {
        this.nowOtherId = this.nowContactList[0].cid
        params = { cid: this.nowContactList[0].cid, sid: this.nowContactList[0].sid, state: '0' }
        this.$put('/contact', params).then(res => {
          this.nowContactList.forEach(item => {
            item.isRead = '1'
          })
          // console.log(res)
        }).catch(err => console.log(err))
      } else {
        this.nowOtherId = this.nowContactList[0].sid
        params = { cid: this.nowContactList[0].cid, sid: this.nowContactList[0].sid, state: '1' }
        this.$put('/contact', params).then(res => {
          this.nowContactList.forEach(item => {
            item.isRead = '1'
          })
          // console.log(res)
        }).catch(err => console.log(err))
      }
    },
    isDot(u) {
      let flag = false
      if (this.$db.get('ROLES') === '"shop"') {
        u.forEach(item => {
          if (item.state === '0' && item.isRead === '0') {
            flag = true
          }
        })
      } else {
        u.forEach(item => {
          if (item.state === '1' && item.isRead === '0') {
            console.log(item)
            flag = true
          }
        })
      }
      return flag
    }
  }
}
</script>

<style scoped>
  .userfaceImg {
    width: 37px;
    height: 37px;
    border-radius: 30px;
    margin-right: 10px;
  }
  .friendListDiv {
    display: flex;
    justify-content: flex-start;
    padding-left: 20px;
    box-sizing: border-box;
    align-items: center;
    width: 160px;
    height: 40px;
    border-color: #008836;
    border-left-style: solid;
    border-top-style: solid;
    border-right-style: solid;
    border-width: 1px;
    cursor: pointer
  }
  .chatDiv {
    border-color: #008836;
    border-style: solid;
    border-radius: 5px;
    border-width: 1px;
    box-sizing: border-box;
    width: 700px;
    height: 450px;
    overflow-y: auto;
    padding-bottom: 50px;
  }
  .sendBtn {
    padding-left: 25px;
    padding-right: 25px
  }
  .currentChatFriend {
    background-color: #008836;
  }
</style>
