<template>
  <el-container style="height: 600px; border: 1px solid #eee">
    <el-aside>
      <el-row class="tac">
        <el-col>
          <h5>个人信息</h5>
          <el-menu :default-active="nowPageIndex" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose">
            <el-menu-item index="1" class="title" @click="$router.push('/consumerinfo/info')">
              <i class="el-icon-user" />
              <span slot="title">个人资料</span>
            </el-menu-item>
            <el-menu-item index="2" class="title" @click="$router.push('/consumerinfo/history')">
              <i class="el-icon-s-order" />
              <span slot="title">历史订单</span>
            </el-menu-item>

            <el-menu-item index="6" class="title" @click="$router.push('/consumerinfo/historyComment')">
              <i class="el-icon-chat-line-round" />
              <span slot="title">历史评价</span>
            </el-menu-item>

            <el-menu-item index="3" class="title" @click="$router.push('/consumerinfo/contact')">
              <i class="el-icon-bell" />
              <span slot="title">店家互动</span>
            </el-menu-item>
            <el-menu-item index="4" class="title" @click="$router.push('/consumerinfo/password')">
              <i class="el-icon-key" />
              <span slot="title">修改密码</span>
            </el-menu-item>
            <el-menu-item index="5" class="title" @click="$router.push('/consumerinfo/setting')">
              <i class="el-icon-setting" />
              <span slot="title">账号设置</span>
            </el-menu-item>
          </el-menu>
        </el-col>
      </el-row>
    </el-aside>

    <el-main>
      <!--      <component :is="componentName"></component>-->
      <router-view />
    </el-main>
  </el-container>
</template>

<script>
export default {
  name: 'ConsumerInfo',
  computed: {
    nowPageIndex() {
      if (this.$route.path === '/consumerinfo/info') {
        return '1'
      } else if (this.$route.path === '/consumerinfo/history') {
        return '2'
      } else if (this.$route.path === '/consumerinfo/contact') {
        return '3'
      } else if (this.$route.path === '/consumerinfo/password') {
        return '4'
      } else if (this.$route.path === '/consumerinfo/setting') {
        return '5'
      } else if (this.$route.path === '/consumerinfo/historyComment') {
        return '6'
      } else {
        return '1'
      }
    }
  },
  methods: {
    handleOpen(key, keyPath) {
      console.log(key, keyPath)
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath)
    }
  }
}
</script>

<style scoped>
.title:hover{
  color:#008836;
  border-color: #008836;
  background-color: rgba(255,205,86,0.1);
}
.title:focus{
  color:#008836;
  border-color: #008836;
  background-color: rgba(255,205,86,0.1);
}
</style>
