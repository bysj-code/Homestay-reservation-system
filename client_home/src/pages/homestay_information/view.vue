<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','name_of_homestay') || ($check_field('add','name_of_homestay') || $check_field('set','name_of_homestay'))" label="民宿名称" name="name_of_homestay">
                            <uni-easyinput type="text" v-model="form['name_of_homestay']" v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','name_of_homestay')) || (!form['homestay_information_id'] && $check_field('add','name_of_homestay'))" :disabled="disabledObj['name_of_homestay_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','name_of_homestay')">
                  {{ form['name_of_homestay'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','landlord_user') || ($check_field('add','landlord_user') || $check_field('set','landlord_user'))" label="房东用户" name="landlord_user">
                    <uni-data-select
                  id="form_landlord_user"
                  v-model="form['landlord_user']"
                  :localdata="list_user_landlord_user"
                  :clear="!disabledObj['landlord_user_isDisabled']"
                  :disabled="disabledObj['landlord_user_isDisabled']"
                  v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','landlord_user')) || (!form['homestay_information_id'] && $check_field('add','landlord_user'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['landlord_user']"
                  :localdata="list_user_landlord_user"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','landlord_user')" id="landlord_user"
                ></uni-data-select>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','region_name') || ($check_field('add','region_name') || $check_field('set','region_name'))" label="地区名称" name="region_name">
                    <uni-data-select
                  v-model="form.region_name"
                  :localdata="list_region_name"
                  :clear="!disabledObj['region_name_isDisabled']"
                  :disabled="disabledObj['region_name_isDisabled']"
                  v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','region_name')) || (!form['homestay_information_id'] && $check_field('add','region_name'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','region_name')">
                  {{ form['region_name'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','homestay_address') || ($check_field('add','homestay_address') || $check_field('set','homestay_address'))" label="民宿地址" name="homestay_address">
                            <uni-easyinput type="text" v-model="form['homestay_address']" v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','homestay_address')) || (!form['homestay_information_id'] && $check_field('add','homestay_address'))" :disabled="disabledObj['homestay_address_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','homestay_address')">
                  {{ form['homestay_address'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','room_number') || ($check_field('add','room_number') || $check_field('set','room_number'))" label="房间号" name="room_number">
                            <uni-easyinput type="text" v-model="form['room_number']" v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','room_number')) || (!form['homestay_information_id'] && $check_field('add','room_number'))" :disabled="disabledObj['room_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','room_number')">
                  {{ form['room_number'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','room_type') || ($check_field('add','room_type') || $check_field('set','room_type'))" label="房间类型" name="room_type">
                    <uni-data-select
                  v-model="form.room_type"
                  :localdata="list_room_type"
                  :clear="!disabledObj['room_type_isDisabled']"
                  :disabled="disabledObj['room_type_isDisabled']"
                  v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','room_type')) || (!form['homestay_information_id'] && $check_field('add','room_type'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','room_type')">
                  {{ form['room_type'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','cover_photo') || ($check_field('add','cover_photo') || $check_field('set','cover_photo'))" label="封面图片" name="cover_photo">
                    <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['cover_photo'] && $check_field('set','cover_photo')">
                  <image v-if="disabledObj['cover_photo_isDisabled']" :src="$fullUrl(form['cover_photo'])" />
                  <image v-if="!disabledObj['cover_photo_isDisabled']" :src="$fullUrl(form['cover_photo'])" @click="change_img('cover_photo')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['cover_photo'] && $check_field('add','cover_photo')">
                  <view v-if="disabledObj['cover_photo_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['cover_photo_isDisabled']" class="btn_add_img" @click="change_img('cover_photo')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','cover_photo')">
                  <image :src="$fullUrl(form['cover_photo'])" />
                </view>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','check_in_price') || ($check_field('add','check_in_price') || $check_field('set','check_in_price'))" label="入住价格" name="check_in_price">
                            <uni-easyinput type="text" v-model="form['check_in_price']" v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','check_in_price')) || (!form['homestay_information_id'] && $check_field('add','check_in_price'))" :disabled="disabledObj['check_in_price_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','check_in_price')">
                  {{ form['check_in_price'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','detailed_introduction') || ($check_field('add','detailed_introduction') || $check_field('set','detailed_introduction'))" label="详情介绍" name="detailed_introduction">
                    <uni-easyinput type="textarea" v-model="form['detailed_introduction']" v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','detailed_introduction')) || (!form['homestay_information_id'] && $check_field('add','detailed_introduction'))" :disabled="disabledObj['detailed_introduction_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','detailed_introduction')">
                  {{ form['detailed_introduction'] }}
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
      field: "homestay_information_id",
      url_add: "~/api/homestay_information/add?",
      url_set: "~/api/homestay_information/set?",
      url_get_obj: "~/api/homestay_information/get_obj?",
      url_upload: "~/api/homestay_information/upload?",

      query: {
        "homestay_information_id": 0,
      },

      form: {
            "name_of_homestay":  '', // 民宿名称
                    "landlord_user": 0, // 房东用户
                    "region_name":  '', // 地区名称
                    "homestay_address":  '', // 民宿地址
                    "room_number":  '', // 房间号
                    "room_type":  '', // 房间类型
                    "cover_photo":  '', // 封面图片
                    "check_in_price":  '', // 入住价格
                    "detailed_introduction":  '', // 详情介绍
                                "homestay_information_id": 0, // ID
                
              },
          disabledObj:{
                        "name_of_homestay_isDisabled": false,
                                "landlord_user_isDisabled": false,
                                "region_name_isDisabled": false,
                                "homestay_address_isDisabled": false,
                                "room_number_isDisabled": false,
                                "room_type_isDisabled": false,
                                "cover_photo_isDisabled": false,
                                "check_in_price_isDisabled": false,
                                "detailed_introduction_isDisabled": false,
                                  },
                                                    // 用户列表
            list_user_landlord_user: [],
                        // 用户组
            group_user_landlord_user: "",
                                          // 地区名称选项列表
          list_region_name: [],
                                                                              // 房间类型选项列表
          list_room_type: [],
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
            url: _self.$fullUrl('/api/homestay_information/upload?'),
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
            url: _self.$fullUrl('/api/homestay_information/upload?'),
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
     * 获取房东用户用户列表
     */
    async get_list_user_landlord_user() {
      // if(this.user_group !== "管理员" && this.form["landlord_user"] === 0) {
      //     this.form["landlord_user"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=房东用户");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_landlord_user.push({value:o.user_id,text:o.nickname + '-' + o.username}));
      }
      else if(json.error){
        console.error(json.error);
      }
    },
            /**
     * 获取房东用户用户组
     */
    async get_group_user_landlord_user() {
      this.form["landlord_user"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=房东用户");
      if(json.result && json.result.obj){
        this.group_user_landlord_user = json.result.obj;
        this.get_user_session_landlord_user(this.form['landlord_user'])
      }
      else if(json.error){
        console.error(json.error);
      }
    },
    get_user_session_landlord_user(id){
      var _this = this;
      var user_id = {"user_id":id}
      var url = "~/api/"+_this.group_user_landlord_user.source_table+"/get_obj?"
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
                  if (arr[i] !== "landlord_user") {
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
            
            /**
     * 获取地区名称列表
     */
    async get_list_region_name() {
              var json = await this.$get("~/api/regional_classification/get_list?");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_region_name.push({value:o.region_name,text:o.region_name}));
      }
      else if(json.error){
        console.error(json.error);
      }
        },
        
            
            
            /**
     * 获取房间类型列表
     */
    async get_list_room_type() {
              var json = await this.$get("~/api/room_classification/get_list?");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_room_type.push({value:o.room_type,text:o.room_type}));
      }
      else if(json.error){
        console.error(json.error);
      }
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
        bl = this.$check_action('/homestay_information/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/homestay_information/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/homestay_information/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/homestay_information/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/homestay_information/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
                    this.get_list_user_landlord_user();
            this.get_group_user_landlord_user();
                    this.get_list_region_name();
                                this.get_list_room_type();
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
