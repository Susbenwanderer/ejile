<template>
  <div>
    <el-col :span="4">
      <el-input v-model="searchConsumer" placeholder="按用户名字搜索"></el-input>
    </el-col>
    <el-col :span="4">
      <el-input v-model="searchShop" placeholder="按商家名字搜索"></el-input>
    </el-col>
    <el-col :span="4">
      <div class="block">
        <el-date-picker
          v-model="dateValue"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期">
        </el-date-picker>
      </div>
    </el-col>
    <el-col :span="4" :offset="4">
      <export-excel v-if="dataInPage() != null" :list="dataInPage()"
                    :t-header="['#ID', '交易时间', '购买者', '商家', '商品名', '购买数量', '总价', '状态']"
                    :t-value="['id', 'ctime', 'cname', 'sname', 'goodsName', 'num', 'total', 'state']"></export-excel>
    </el-col>

    <el-table :data="dataInPage().slice((currentPage-1)*cntPerPage,currentPage*cntPerPage)" style="width: 100%">
      <el-table-column
        sortable
        fixed="left"
        prop="id"
        label="#ID"
        width="180">
      </el-table-column>
      <el-table-column
        sortable
        prop="ctime"
        label="评论时间"
        width="230">
      </el-table-column>
      <el-table-column
        prop="cname"
        label="消费者"
        width="180">
      </el-table-column>
      <el-table-column
        prop="sname"
        label="商家"
        width="180">
      </el-table-column>
      <el-table-column
        prop="content"
        label="评论内容"
        width="180">
      </el-table-column>
      <el-table-column
        sortable
        prop="stars"
        label="评分(5星满)"
        width="180">
      </el-table-column>


    </el-table>

    <div class="block">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[5, 10, 20, 40]"
        :page-size="5"
        layout="total, sizes, prev, pager, next, jumper"
        :total="dataInPage().length">
      </el-pagination>
    </div>
  </div>
</template>

<script>
  import ExportExcel from "../../components/ExportExcel"
  export default {
    name: "CommentaryTable",
    components: {ExportExcel},
    data() {
      return {
        commentaryList: [
          {
            ctime: "2019-06-27T18:03:21.000+0000",
            cid: 1,
            cname: "Zhang San",
            id: 4,
            sname: "mai",
            sid: 1,
            content: "Just so so",
            stars: 3
          }
        ],

        currentPage: 1,
        cntPerPage: 5,

        searchConsumer: '',
        searchShop: '',
        searchGoods: '',

        dateValue: ''
      }
    },
    created() {
      this.$get('/admin/getAllCommentary').then(res => {
        this.commentaryList = res.data
      }).catch(err => console.log(err))
    },
    methods: {
      handleSizeChange(val) {
        // console.log(`每页 ${val} 条`);
        this.cntPerPage = val
      },
      handleCurrentChange(val) {
        // console.log(`当前页: ${val}`);
        this.currentPage = val
      },

      dataInPage() {
        let data = this.commentaryList
          .filter(data =>
            !this.searchConsumer || data.cname.toLowerCase().includes(this.searchConsumer.toLowerCase()))
          .filter(data =>
            !this.searchShop || data.sname.toLowerCase().includes(this.searchShop.toLowerCase()))
          .filter(data =>
            !this.dateValue || (new Date(this.dateValue[0]) <= new Date(data.ctime) && new Date(data.ctime) <=  new Date(this.dateValue[1])))

        this.currentPage = Math.min(this.currentPage, Math.ceil(data.length / this.cntPerPage))
        return data
      }
    }
  }
</script>

<style scoped>

</style>
