<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','report_title') || ($check_field('add','report_title') || $check_field('set','report_title'))" label="报表标题" name="report_title">
                            <uni-easyinput type="text" v-model="form['report_title']" v-if="user_group === '管理员' || (form['profit_and_loss_data_id'] && $check_field('set','report_title')) || (!form['profit_and_loss_data_id'] && $check_field('add','report_title'))" :disabled="disabledObj['report_title_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','report_title')">
                  {{ form['report_title'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','report_date') || ($check_field('add','report_date') || $check_field('set','report_date'))" label="报表日期" name="report_date">
                    <uni-datetime-picker v-if="user_group === '管理员' || (form['profit_and_loss_data_id'] && $check_field('set','report_date')) || (!form['profit_and_loss_data_id'] && $check_field('add','report_date'))" v-model="form['report_date']" type="date" :disabled="disabledObj['report_date_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','report_date')">
                  {{ form['report_date'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','profit_amount') || ($check_field('add','profit_amount') || $check_field('set','profit_amount'))" label="盈利金额" name="profit_amount">
                            <uni-easyinput type="text" v-model="form['profit_amount']" v-if="user_group === '管理员' || (form['profit_and_loss_data_id'] && $check_field('set','profit_amount')) || (!form['profit_and_loss_data_id'] && $check_field('add','profit_amount'))" :disabled="disabledObj['profit_amount_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','profit_amount')">
                  {{ form['profit_amount'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','loss_amount') || ($check_field('add','loss_amount') || $check_field('set','loss_amount'))" label="亏损金额" name="loss_amount">
                            <uni-easyinput type="text" v-model="form['loss_amount']" v-if="user_group === '管理员' || (form['profit_and_loss_data_id'] && $check_field('set','loss_amount')) || (!form['profit_and_loss_data_id'] && $check_field('add','loss_amount'))" :disabled="disabledObj['loss_amount_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','loss_amount')">
                  {{ form['loss_amount'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','recording_personnel') || ($check_field('add','recording_personnel') || $check_field('set','recording_personnel'))" label="记录人员" name="recording_personnel">
                            <uni-easyinput type="text" v-model="form['recording_personnel']" v-if="user_group === '管理员' || (form['profit_and_loss_data_id'] && $check_field('set','recording_personnel')) || (!form['profit_and_loss_data_id'] && $check_field('add','recording_personnel'))" :disabled="disabledObj['recording_personnel_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','recording_personnel')">
                  {{ form['recording_personnel'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','remarks') || ($check_field('add','remarks') || $check_field('set','remarks'))" label="备注信息" name="remarks">
                    <uni-easyinput type="textarea" v-model="form['remarks']" v-if="user_group === '管理员' || (form['profit_and_loss_data_id'] && $check_field('set','remarks')) || (!form['profit_and_loss_data_id'] && $check_field('add','remarks'))" :disabled="disabledObj['remarks_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','remarks')">
                  {{ form['remarks'] }}
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
      field: "profit_and_loss_data_id",
      url_add: "~/api/profit_and_loss_data/add?",
      url_set: "~/api/profit_and_loss_data/set?",
      url_get_obj: "~/api/profit_and_loss_data/get_obj?",
      url_upload: "~/api/profit_and_loss_data/upload?",

      query: {
        "profit_and_loss_data_id": 0,
      },

      form: {
            "report_title":  '', // 报表标题
                    "report_date": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
                    "profit_amount":  '', // 盈利金额
                    "loss_amount":  '', // 亏损金额
                    "recording_personnel":  '', // 记录人员
                    "remarks":  '', // 备注信息
                                "profit_and_loss_data_id": 0, // ID
                
              },
          disabledObj:{
                        "report_title_isDisabled": false,
                                "report_date_isDisabled": false,
                                "profit_amount_isDisabled": false,
                                "loss_amount_isDisabled": false,
                                "recording_personnel_isDisabled": false,
                                "remarks_isDisabled": false,
                                  },
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
            url: _self.$fullUrl('/api/profit_and_loss_data/upload?'),
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
            url: _self.$fullUrl('/api/profit_and_loss_data/upload?'),
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
                      if (this.form["report_date"] && JSON.stringify(this.form["report_date"]).indexOf("-")===-1) {
        this.form["report_date"] = this.$toTime(parseInt(this.form["report_date"]), "yyyy-MM-dd")
      }
                                          uni.db.del("form");
      return param;
    },
        
            
            
            
            
            
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                      if (this.form["report_date"] && JSON.stringify(this.form["report_date"]).indexOf("-")===-1) {
        this.form["report_date"] = this.$toTime(parseInt(this.form["report_date"]),"yyyy-MM-dd")
      }
                                        },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/profit_and_loss_data/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/profit_and_loss_data/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/profit_and_loss_data/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/profit_and_loss_data/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/profit_and_loss_data/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
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
