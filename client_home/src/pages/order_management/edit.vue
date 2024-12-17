<template>
	<view class="diy_edit page_order_management" id="order_management_edit">
		<view class='warp'>
			<view class='container'>
				<view class='row'>
						<view v-if="$check_field('set','order_number') || $check_field('add','order_number') || $check_field('get','order_number')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								订单编号:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_order_number" v-model="form['order_number']" placeholder="请输入订单编号" v-if="(form['order_number'] && $check_field('set','order_number')) || (!form['order_number'] && $check_field('add','order_number'))" :disabled="true" />
							<text v-else-if="$check_field('get','order_number')">{{ form['order_number'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','name_of_homestay') || $check_field('add','name_of_homestay') || $check_field('get','name_of_homestay')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								民宿名称:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_name_of_homestay" v-model="form['name_of_homestay']" placeholder="请输入民宿名称" v-if="(form['name_of_homestay'] && $check_field('set','name_of_homestay')) || (!form['name_of_homestay'] && $check_field('add','name_of_homestay'))" :disabled="disabledObj['name_of_homestay_isDisabled']" />
							<text v-else-if="$check_field('get','name_of_homestay')">{{ form['name_of_homestay'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','room_number') || $check_field('add','room_number') || $check_field('get','room_number')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								房间号:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_room_number" v-model="form['room_number']" placeholder="请输入房间号" v-if="(form['room_number'] && $check_field('set','room_number')) || (!form['room_number'] && $check_field('add','room_number'))" :disabled="disabledObj['room_number_isDisabled']" />
							<text v-else-if="$check_field('get','room_number')">{{ form['room_number'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','room_type') || $check_field('add','room_type') || $check_field('get','room_type')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								房间房型:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_room_type" v-model="form['room_type']" placeholder="请输入房间房型" v-if="(form['room_type'] && $check_field('set','room_type')) || (!form['room_type'] && $check_field('add','room_type'))" :disabled="disabledObj['room_type_isDisabled']" />
							<text v-else-if="$check_field('get','room_type')">{{ form['room_type'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','check_in_price') || $check_field('add','check_in_price') || $check_field('get','check_in_price')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								入住价格:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_check_in_price" v-model="form['check_in_price']" placeholder="请输入入住价格" v-if="(form['check_in_price'] && $check_field('set','check_in_price')) || (!form['check_in_price'] && $check_field('add','check_in_price'))" :disabled="disabledObj['check_in_price_isDisabled']" />
							<text v-else-if="$check_field('get','check_in_price')">{{ form['check_in_price'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','booking_users') || $check_field('add','booking_users') || $check_field('get','booking_users')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								预订用户:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_booking_users"
									v-model="form['booking_users']"
									:localdata="list_user_booking_users"
									:clear="!disabledObj['booking_users_isDisabled']"
									:disabled="disabledObj['booking_users_isDisabled']"
									v-if="(form['booking_users'] && $check_field('set','booking_users')) || (!form['booking_users'] && $check_field('add','booking_users'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','booking_users')">{{ form['booking_users'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','user_name') || $check_field('add','user_name') || $check_field('get','user_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								用户姓名:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_user_name" v-model="form['user_name']" placeholder="请输入用户姓名" v-if="(form['user_name'] && $check_field('set','user_name')) || (!form['user_name'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']" />
							<text v-else-if="$check_field('get','user_name')">{{ form['user_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','contact_information') || $check_field('add','contact_information') || $check_field('get','contact_information')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								联系方式:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_contact_information" v-model="form['contact_information']" placeholder="请输入联系方式" v-if="(form['contact_information'] && $check_field('set','contact_information')) || (!form['contact_information'] && $check_field('add','contact_information'))" :disabled="disabledObj['contact_information_isDisabled']" />
							<text v-else-if="$check_field('get','contact_information')">{{ form['contact_information'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','id_number') || $check_field('add','id_number') || $check_field('get','id_number')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								身份证号:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_id_number" v-model="form['id_number']" placeholder="请输入身份证号" v-if="(form['id_number'] && $check_field('set','id_number')) || (!form['id_number'] && $check_field('add','id_number'))" :disabled="disabledObj['id_number_isDisabled']" />
							<text v-else-if="$check_field('get','id_number')">{{ form['id_number'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','number_of_check_in_days') || $check_field('add','number_of_check_in_days') || $check_field('get','number_of_check_in_days')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								入住天数:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_number_of_check_in_days" v-model="form['number_of_check_in_days']" placeholder="请输入入住天数" v-if="(form['number_of_check_in_days'] && $check_field('set','number_of_check_in_days')) || (!form['number_of_check_in_days'] && $check_field('add','number_of_check_in_days'))" :disabled="disabledObj['number_of_check_in_days_isDisabled']" />
							<text v-else-if="$check_field('get','number_of_check_in_days')">{{ form['number_of_check_in_days'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','total_price') || $check_field('add','total_price') || $check_field('get','total_price')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								合计总价:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_total_price" v-model="form['total_price']" placeholder="请输入合计总价" v-if="(form['total_price'] && $check_field('set','total_price')) || (!form['total_price'] && $check_field('add','total_price'))" @focus="set_total_price()" :disabled="disabledObj['total_price_isDisabled']" />
							<text v-else-if="$check_field('get','total_price')">{{ form['total_price'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','order_status') || $check_field('add','order_status') || $check_field('get','order_status')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								订单状态:
							</text>
						</view>
								<!-- 选项 -->
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_order_status"
									v-model="form['order_status']"
									:localdata="list_order_status"
									v-if="(form['order_status'] && $check_field('set','order_status')) || (!form['order_status'] && $check_field('add','order_status'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','order_status')">{{ form['order_status'] }}</text>
						</view>
							</view>
	
				</view>
				<view class="row">
					<view class="col-12">
						<view class="btn_box">
							<button class="btn_submit primary_btn" @click="submit()">提交</button>
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
	mixins:[mixin],
	components:{},
	data(){
		return{
			url_get_obj:"~/api/order_management/get_obj?",
			url_add:"~/api/order_management/add?",
			url_set:"~/api/order_management/set?",

			// 登录权限
			oauth: {
				"signIn": true,
				"user_group": []
			},

			// 查询条件
			query: {
					"order_number": "",
						"name_of_homestay": "",
						"room_number": "",
						"room_type": "",
						"check_in_price": "",
						"booking_users": 0,
						"user_name": "",
						"contact_information": "",
						"id_number": "",
						"number_of_check_in_days": "",
						"total_price": "",
						"order_status": "",
					"order_management_id": 0
			},

			obj: {
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
					"order_management_id": 0,

			},

			// 表单字段
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
					"order_management_id": 0,
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
															list_order_status: [],
		
			field:"order_management_id",
			table_key:"order_management",

		}
	},
	methods: {
			
	
				
	
				
	
				
	
				
	
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
				async get_user_session_booking_users(){
			var _this = this;
			var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
			if(json.result && json.result.obj){
				var source_table = json.result.obj.source_table;
				var user_id = _this.$store.state.user.user_id;
				if (user_id){
					var url = "~/api/"+source_table+"/get_obj?"
					this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
						if (res.result && res.result.obj) {
							var arr = []
							for (let key in res.result.obj) {
								arr.push(key)
							}
							var arrForm = []
							for (let key in _this.form) {
								arrForm.push(key)
							}
							_this.form["booking_users"] = user_id
							_this.disabledObj['booking_users' + '_isDisabled'] = true
							for (var i=0;i<arr.length;i++){
                if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                  for (var j = 0; j < arrForm.length; j++) {
                    if (arr[i] === arrForm[j]) {
                      if (arr[i] !== "booking_users") {
                        _this.form[arrForm[j]] = res.result.obj[arr[i]]
                        _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                        break;
                      }
                    }
                  }
                }
							}
						}
					});
				}
			}
			else if(json.error){
				console.error(json.error);
			}
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
			
	
			change_file(key_name){
			var _self = this;
				this.$chooseFile().then(res=>{
					console.log(res)

						const uploadTask = uni.uploadFile({
							url: _self.$fullUrl("/api/feedback/upload?"),
							filePath: res[0].path,
							name: "file",
							formData: {
								i_want_to_customize: "test",
							},
							header: {
								"x-auth-token": _self.$store.state.user.token,
							},
							success: function(uploadFileRes) {
								console.log(uploadFileRes)
								var filename = JSON.parse(uploadFileRes.data).result.url;
								_self.form[key_name] = filename;
							},
						});

						uploadTask.onProgressUpdate(function(res) {
							_self.percent = res.progress;
							console.log("上传进度" + res.progress);
							console.log("已经上传的数据长度" + res.totalBytesSent);
							console.log(
								"预期需要上传的数据总长度" + res.totalBytesExpectedToSend
							);
						});

				})
		},
		change_img(key_name) {
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
							'order_management': 'test'
						},
						header: {
							'x-auth-token': _self.$store.state.user.token
						},
						success: function(uploadFileRes) {
							var filename = JSON.parse(uploadFileRes.data).result.url
							var img_url = filename
							_self.form[key_name] = img_url
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
		 * 获取对象后获取缓存表单
		 * @param {Object} json
		 * @param {Object} func
		 */
		get_obj_after(json ,func){
			var form = uni.db.get("form");
			var obj = Object.assign({} ,form ,this.obj);
			if (form) {
				this.obj = uni.push(this.obj ,obj);
			}
			if (form) {
				this.form = uni.push(this.form ,form);
			}
			if(func){
				func(json);
			}
		},

	},
	onLoad(){
																			this.get_user_session_booking_users();
				this.get_list_user_booking_users();
																			this.get_list_order_status();
				},
}
</script>

<style scoped>
	input{
		font-size: 10px;
	}

	.form_edit {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
	}

	.left_text {
		flex: 0 0 25%;
		display: flex;
		align-items: center;
	}

	.right_text {
		flex: 0 0 75%;
		border-bottom: 1px solid #eee;
	}
	.right_text.btn_warp{
		border-bottom: 0;
	}

	.btn_submit {
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}

	.btn_submit:hover {
		opacity: 0.5;
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




</style>
<style scoped>
/*新样式*/
.diy_text_row {
  display: inline-block;
}
.container {
	margin-top:1rem ;
	padding: 1rem;
    -webkit-box-shadow: 0px 0px 0px #888888;
    box-shadow: 0px 0px 0px #888888;
}
.primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
	.btn_submit{
		padding: 0;
		margin-top:1rem ;
	}
	.row-item {
		padding: 10px 10px;
	    background: #f8f6fc;
		margin-bottom: 1rem;
	}
	.diy_field{
		padding-left: 1rem;
	}
	.diy_title{
		align-items: center;
        font-size: 14px;
        color: #333;
	}

	.row-item{
		display: flex !important;
		align-items: baseline;
	}
	.diy_select_flex{
		flex: 1;
	}
	.query_select{
		flex: 1;
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
</style>

