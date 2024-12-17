<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','order_number') || ($check_field('add','order_number') || $check_field('set','order_number'))" label="订单编号" name="order_number">
                            <uni-easyinput type="text" v-model="form['order_number']" v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','order_number')) || (!form['order_management_id'] && $check_field('add','order_number'))"  :disabled="true" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','order_number')">
                  {{ form['order_number'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','name_of_homestay') || ($check_field('add','name_of_homestay') || $check_field('set','name_of_homestay'))" label="民宿名称" name="name_of_homestay">
                            <uni-easyinput type="text" v-model="form['name_of_homestay']" v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','name_of_homestay')) || (!form['order_management_id'] && $check_field('add','name_of_homestay'))" :disabled="disabledObj['name_of_homestay_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','name_of_homestay')">
                  {{ form['name_of_homestay'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','room_number') || ($check_field('add','room_number') || $check_field('set','room_number'))" label="房间号" name="room_number">
                            <uni-easyinput type="text" v-model="form['room_number']" v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','room_number')) || (!form['order_management_id'] && $check_field('add','room_number'))" :disabled="disabledObj['room_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','room_number')">
                  {{ form['room_number'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','room_type') || ($check_field('add','room_type') || $check_field('set','room_type'))" label="房间房型" name="room_type">
                            <uni-easyinput type="text" v-model="form['room_type']" v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','room_type')) || (!form['order_management_id'] && $check_field('add','room_type'))" :disabled="disabledObj['room_type_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','room_type')">
                  {{ form['room_type'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','check_in_price') || ($check_field('add','check_in_price') || $check_field('set','check_in_price'))" label="入住价格" name="check_in_price">
                            <uni-easyinput type="text" v-model="form['check_in_price']" v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','check_in_price')) || (!form['order_management_id'] && $check_field('add','check_in_price'))" :disabled="disabledObj['check_in_price_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','check_in_price')">
                  {{ form['check_in_price'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','booking_users') || ($check_field('add','booking_users') || $check_field('set','booking_users'))" label="预订用户" name="booking_users">
                    <uni-data-select
                  id="form_booking_users"
                  v-model="form['booking_users']"
                  :localdata="list_user_booking_users"
                  :clear="!disabledObj['booking_users_isDisabled']"
                  :disabled="disabledObj['booking_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','booking_users')) || (!form['order_management_id'] && $check_field('add','booking_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['booking_users']"
                  :localdata="list_user_booking_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','booking_users')" id="booking_users"
                ></uni-data-select>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','user_name') || ($check_field('add','user_name') || $check_field('set','user_name'))" label="用户姓名" name="user_name">
                            <uni-easyinput type="text" v-model="form['user_name']" v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','user_name')) || (!form['order_management_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','user_name')">
                  {{ form['user_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','contact_information') || ($check_field('add','contact_information') || $check_field('set','contact_information'))" label="联系方式" name="contact_information">
                            <uni-easyinput type="text" v-model="form['contact_information']" v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','contact_information')) || (!form['order_management_id'] && $check_field('add','contact_information'))" :disabled="disabledObj['contact_information_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','contact_information')">
                  {{ form['contact_information'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','id_number') || ($check_field('add','id_number') || $check_field('set','id_number'))" label="身份证号" name="id_number">
                            <uni-easyinput type="text" v-model="form['id_number']" v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','id_number')) || (!form['order_management_id'] && $check_field('add','id_number'))" :disabled="disabledObj['id_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','id_number')">
                  {{ form['id_number'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','number_of_check_in_days') || ($check_field('add','number_of_check_in_days') || $check_field('set','number_of_check_in_days'))" label="入住天数" name="number_of_check_in_days">
                            <uni-easyinput type="text" v-model="form['number_of_check_in_days']" v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','number_of_check_in_days')) || (!form['order_management_id'] && $check_field('add','number_of_check_in_days'))" :disabled="disabledObj['number_of_check_in_days_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','number_of_check_in_days')">
                  {{ form['number_of_check_in_days'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','total_price') || ($check_field('add','total_price') || $check_field('set','total_price'))" label="合计总价" name="total_price">
                            <uni-easyinput type="text" v-model="form['total_price']" v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','total_price')) || (!form['order_management_id'] && $check_field('add','total_price'))"  @focus="set_total_price()" :disabled="disabledObj['total_price_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','total_price')">
                  {{ form['total_price'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','order_status') || ($check_field('add','order_status') || $check_field('set','order_status'))" label="订单状态" name="order_status">
                    <uni-data-select
                  v-model="form.order_status"
                  :localdata="list_order_status"
                  :clear="!disabledObj['order_status_isDisabled']"
                  :disabled="disabledObj['order_status_isDisabled']"
                  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','order_status')) || (!form['order_management_id'] && $check_field('add','order_status'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','order_status')">
                  {{ form['order_status'] }}
                </text>
                  </uni-forms-item>


            </uni-forms>
            <view class="form_button">
              <button size="mini" type="primary" @click="submit()" class="primary_btn">提交</button>
              <button size="mini" @click="cancel()">取消</button>
            </view>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
import mixin from "@/libs/mixins/page.js";

export default {
  mixins: [mixin],
  data() {
    return {
      field: "order_management_id",
      url_add: "~/api/order_management/add?",
      url_set: "~/api/order_management/set?",
      url_get_obj: "~/api/order_management/get_obj?",
      url_upload: "~/api/order_management/upload?",

      query: {
        "order_management_id": 0,
      },

      form: {
            "order_number": this.$get_stamp(), // 订单编号
                    "name_of_homestay":  '', // 民宿名称
                    "room_number":  '', // 房间号
                    "room_type":  '', // 房间房型
                    "check_in_price":  '', // 入住价格
                    "booking_users": 0, // 预订用户
                    "user_name":  '', // 用户姓名
                    "contact_information":  '', // 联系方式
                    "id_number":  '', // 身份证号
                    "number_of_check_in_days":  '', // 入住天数
                    "total_price":  '', // 合计总价
                    "order_status":  '', // 订单状态
                                "order_management_id": 0, // ID
                
              },
          disabledObj:{
                        "order_number_isDisabled": false,
                                "name_of_homestay_isDisabled": false,
                                "room_number_isDisabled": false,
                                "room_type_isDisabled": false,
                                "check_in_price_isDisabled": false,
                                "booking_users_isDisabled": false,
                                "user_name_isDisabled": false,
                                "contact_information_isDisabled": false,
                                "id_number_isDisabled": false,
                                "number_of_check_in_days_isDisabled": false,
                                "total_price_isDisabled": false,
                                "order_status_isDisabled": false,
                                  },
                                                                                                                                    // 用户列表
            list_user_booking_users: [],
                        // 用户组
            group_user_booking_users: "",
                                                                                                                                              // 订单状态选项列表
          list_order_status: [],
                                      }
  },
  methods: {
    changeLog(v,value){
      this.form[value] = v
    },
    /**
     * 上传文件
     * @param {Object} param文件参数
     */
    change_file(key_name){
      var _self = this;
      // 选择图像方法
      uni.chooseFile({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/order_management/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 上传图片
     * @param {Object} param文件参数
     */
    change_img(key_name){
      var _self = this;
      _self.upload_img_flag = false
      // 选择图像方法
      uni.chooseImage({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/order_management/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 获取对象后获取缓存表单
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_before(param){
      var form = uni.db.get("form");
      if (form) {
        delete(form.examine_state)
        delete(form.examine_reply)
        this.obj = uni.push(this.obj ,form);
        this.form = uni.push(this.form ,form);
      }
      var arr = []
      for (let key in form) {
        arr.push(key)
      }
      for (var i=0;i<arr.length;i++){
        this.disabledObj[arr[i] + '_isDisabled'] = true
      }
                                                                                                      uni.db.del("form");
      return param;
    },
        
            
            
            
            
                /**
     * 获取普通用户用户列表
     */
    async get_list_user_booking_users() {
      // if(this.user_group !== "管理员" && this.form["booking_users"] === 0) {
      //     this.form["booking_users"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=普通用户");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_booking_users.push({value:o.user_id,text:o.nickname + '-' + o.username}));
      }
      else if(json.error){
        console.error(json.error);
      }
    },
            /**
     * 获取普通用户用户组
     */
    async get_group_user_booking_users() {
      this.form["booking_users"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
      if(json.result && json.result.obj){
        this.group_user_booking_users = json.result.obj;
        this.get_user_session_booking_users(this.form['booking_users'])
      }
      else if(json.error){
        console.error(json.error);
      }
    },
    get_user_session_booking_users(id){
      var _this = this;
      var user_id = {"user_id":id}
      var url = "~/api/"+_this.group_user_booking_users.source_table+"/get_obj?"
      this.$get(url, user_id, function(res) {
        if (res.result && res.result.obj) {
          var arr = []
          for (let key in res.result.obj) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in _this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arr[i] === arrForm[j]) {
                  if (arr[i] !== "booking_users") {
                    _this.form[arrForm[j]] = res.result.obj[arr[i]]
                    _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                    break;
                  } else {
                    _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  }
                }
              }
            }
          }
        }
      });
    },
            
            
            
            
            
            
                            set_total_price(){
      this.form.total_price = parseFloat(this.form.check_in_price) * parseFloat(this.form.number_of_check_in_days)
      let r = /^\+?[1-9][0-9]*$/; // 正整数
      if(!r.test(this.form.total_price) ){
        this.form.total_price = this.form.total_price.toFixed(2);
      }
    },
                                /**
     * 获取订单状态列表
     */
    async get_list_order_status() {
          ['预订成功','预订失败'].map((o) => this.list_order_status.push({value:o,text:o}));
            },
        
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                                                                                    },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/order_management/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/order_management/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/order_management/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/order_management/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/order_management/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
                                                    this.get_list_user_booking_users();
            this.get_group_user_booking_users();
                                                            this.get_list_order_status();
          },
}
</script>

<style scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.form_button{
  padding-bottom: 15px;
  display: flex;
}
.form_button button{
  width: 40%;
}
.query_select{
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline:none;
}

.query_option{
  width: 100%;
}

.btn_add_img{
  color: #D3D3D3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text{
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.form_button {
  padding-bottom: 15px;
  display: flex;
}
.form_button button {
  width: 40%;
}
.query_select {
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline: none;
}

.query_option {
  width: 100%;
}

.btn_add_img {
  color: #d3d3d3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text {
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
/*新样式*/
.uni-forms{
padding-top:1rem;
}
.uni-forms-item {
	padding: 6px 10px;
    background: #f8f6fc;
}
.uni-forms .is-input-border{
	border: 0;
}
.container{
	    -webkit-box-shadow: 0px 0px 0px #888888;
	    box-shadow: 0px 0px 0px #888888;
}
.form_button .primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
</style>
