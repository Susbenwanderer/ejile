<template>
  <el-table
    ref="filterTable"
    :data="comments"
    height="500"
    style="width: 100%"
  >
    <el-table-column
      prop="time"
      label="购买时间"
      width="360px"
    />


    <el-table-column
      prop="sname"
      label="商店名字"
      width="360px"
    >

    </el-table-column>

    <el-table-column
      prop="content"
      label="评论内容"
    >

    </el-table-column>


  </el-table>
</template>

<script>
  export default {
    name: 'historyComment',
    data() {
      return {
        comments: [],
      }
    },
    computed: {},
    created() {
      this.$get('/commentary/getInfoByUid', {
        UID: this.$db.get('USER_ID')
      }).then(res => {
        const allComments = res.data.data;
        for (let i = 0, len = allComments.length; i < len; i++) {
          this.comments.push({
            sname: allComments[i].sname,
            time: allComments[i].time,
            content: allComments[i].content,
          })
        }
      }).catch(err => console.log(err))
    }
  }
</script>

<style scoped>
</style>
