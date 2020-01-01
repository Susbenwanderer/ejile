<template>
  <div>
    <!--    <el-row>-->
    <!--      <userAddress></userAddress>-->
    <!--    </el-row>-->
    <el-row>
      <div>
        <!--        顶部工具-->
        <el-radio-group v-model="radio" fill="#008836">
          <!--          <el-radio-button label="全部" class="radio"></el-radio-button>-->
          <!--          <el-radio-button label="主食"></el-radio-button>-->
          <!--          <el-radio-button label="小吃"></el-radio-button>-->
          <!--          <el-radio-button label="饮料"></el-radio-button>-->
        </el-radio-group>
        <el-input v-model="input" placeholder="搜索店铺名称" class="input" clearable style="width:300px" />
        <el-button icon="el-icon-search" class="search" @click="searchShop">搜索</el-button>
        <el-button size="small" class="trolley" @click="$router.push('/shoppingtrolley')">订单</el-button>
      </div>

      <!--      main-->
      <el-col v-for="(o, index) in dataInPage" :key="o.sId" :span="5" :offset="index > 0 ? 3: 0" class="box-card">
        <el-card :body-style="{ padding: '0px' }" shadow="hover" class="card" @card-message="cardMessage">
          <el-container>
            <el-aside style="width: 180px">
              <div class="header-style">
                <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image" alt="">
              </div>
            </el-aside>
            <el-container>
              <el-header>
                <span style="float: left; padding: 18px 0">{{ o.sName }}</span>
                <el-button
                  style="float: right; padding: 20px 0"
                  type="text"
                  @click="$router.push(`/shop/${o.sId}`)"
                >进入店铺</el-button>
              </el-header>
              <el-main>
                <el-rate v-model="o.score" disabled show-score text-color="#ff9900">{{ o.score }}</el-rate>
              </el-main>
              <el-footer />
            </el-container>
          </el-container>
        </el-card>
      </el-col>
    </el-row>
    <!--    分页-->
    <el-pagination
      background
      layout="prev, pager, next"
      :total="Math.ceil(shopList.length / 4)"
    />

  </div>
</template>

<script>
import userAddress from '@/components/Address'

export default {
  name: 'ConsumerHomePage',
  components: {
    // eslint-disable-next-line vue/no-unused-components
    userAddress
  },
  data() {
    return {
      num: 1,
      radio: '全部',
      input: '',
      tableData: [],
      card: [],

      dataInPage: [],
      shopList: [
        {
          managerEmail: '',
          managerName: '',
          sAddress: '',
          sId: 1,
          sName: '',
          sPassword: '',
          sPictureUrl: null,
          sTel: '',
          score: 1
        }
      ]
    }
  },
  created() {
    this.$get('/shop/getAllShopInfo').then(res => {
      this.shopList = res.data.data
      this.dataInPage = this.shopList.filter(data => !this.input ||
          data.sName.toLowerCase().includes(this.input.toLowerCase()))
    }).catch(err => console.log(err))
  },
  methods: {
    // @[我们前端写的，不知道有什么用]
    cardMessage(val) {
      this.card = val
    },
    // 搜索
    searchShop() {
      this.dataInPage = this.shopList.filter(data => !this.input ||
          data.sName.toLowerCase().includes(this.input.toLowerCase()))
    }
  }
}

</script>

<style scoped>
  .image {
    width: 150px;
    height:100px;
    margin:10px;
    display: block;
  }
  .box-card {
    width: 400px;
    height: 150px;
    margin:16px auto 16px 80px;
  }
  .card{
    height:130px;

  }
  .card:hover{
    background-color:#F5F5F5;
    cursor: pointer;
  }
  .input{
    width:250px;
    margin:auto auto auto 25px;
  }
  .el-pagination.is-background .el-pager li:not(.disabled).active{
    background-color: #008836 !important;
  }
  .el-pagination.is-background .el-pager li:hover{
    color: #008836 !important;
  }
  .input{
    border-color: #008836;
  }
  .search{
    margin:10px;
  }
.search:hover{
  color:#008836;
  border-color: #008836;
  background-color: rgba(255,205,86,0.1);
}
  .trolley:hover{
    color:#008836;
    border-color: #008836;
    background-color: rgba(255,205,86,0.1);
  }
  .trolley:focus{
    color:#008836;
    border-color: #008836;
    background-color: rgba(255,205,86,0.1);
  }

</style>
