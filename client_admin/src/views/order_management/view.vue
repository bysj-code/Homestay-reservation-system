<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','order_number') || $check_field('add','order_number') || $check_field('set','order_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="订单编号" prop="order_number">
												<el-input id="order_number" v-model="form['order_number']" placeholder="请输入订单编号"
							  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','order_number')) || (!form['order_management_id'] && $check_field('add','order_number'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','order_number')">{{form['order_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','name_of_homestay') || $check_field('add','name_of_homestay') || $check_field('set','name_of_homestay')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="民宿名称" prop="name_of_homestay">
												<el-input id="name_of_homestay" v-model="form['name_of_homestay']" placeholder="请输入民宿名称"
							  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','name_of_homestay')) || (!form['order_management_id'] && $check_field('add','name_of_homestay'))" :disabled="disabledObj['name_of_homestay_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','name_of_homestay')">{{form['name_of_homestay']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','room_number') || $check_field('add','room_number') || $check_field('set','room_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房间号" prop="room_number">
												<el-input id="room_number" v-model="form['room_number']" placeholder="请输入房间号"
							  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','room_number')) || (!form['order_management_id'] && $check_field('add','room_number'))" :disabled="disabledObj['room_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','room_number')">{{form['room_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','room_type') || $check_field('add','room_type') || $check_field('set','room_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房间房型" prop="room_type">
												<el-input id="room_type" v-model="form['room_type']" placeholder="请输入房间房型"
							  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','room_type')) || (!form['order_management_id'] && $check_field('add','room_type'))" :disabled="disabledObj['room_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','room_type')">{{form['room_type']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','check_in_price') || $check_field('add','check_in_price') || $check_field('set','check_in_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="入住价格" prop="check_in_price">
												<el-input id="check_in_price" v-model="form['check_in_price']" placeholder="请输入入住价格"
							  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','check_in_price')) || (!form['order_management_id'] && $check_field('add','check_in_price'))" :disabled="disabledObj['check_in_price_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','check_in_price')">{{form['check_in_price']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','booking_users') || $check_field('add','booking_users') || $check_field('set','booking_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预订用户" prop="booking_users">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_booking_users(form['booking_users']) }}
							<!--<el-input id="business_name" v-model="form['booking_users']" placeholder="请输入预订用户"-->
							<!--v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','booking_users')) || (!form['order_management_id'] && $check_field('add','booking_users'))" :disabled="disabledObj['booking_users_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','booking_users')">{{form['booking_users']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','booking_users')) || (!form['order_management_id'] && $check_field('add','booking_users'))" id="booking_users" v-model="form['booking_users']" :disabled="disabledObj['booking_users_isDisabled']">
								<el-option v-for="o in list_user_booking_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','booking_users')" id="booking_users" v-model="form['booking_users']" :disabled="true">
								<el-option v-for="o in list_user_booking_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="booking_users" v-model="form['booking_users']" :disabled="disabledObj['booking_users_isDisabled']">
							<el-option v-for="o in list_user_booking_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户姓名" prop="user_name">
												<el-input id="user_name" v-model="form['user_name']" placeholder="请输入用户姓名"
							  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','user_name')) || (!form['order_management_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','contact_information') || $check_field('add','contact_information') || $check_field('set','contact_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系方式" prop="contact_information">
												<el-input id="contact_information" v-model="form['contact_information']" placeholder="请输入联系方式"
							  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','contact_information')) || (!form['order_management_id'] && $check_field('add','contact_information'))" :disabled="disabledObj['contact_information_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_information')">{{form['contact_information']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','id_number') || $check_field('add','id_number') || $check_field('set','id_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="身份证号" prop="id_number">
												<el-input id="id_number" v-model="form['id_number']" placeholder="请输入身份证号"
							  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','id_number')) || (!form['order_management_id'] && $check_field('add','id_number'))" :disabled="disabledObj['id_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','id_number')">{{form['id_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','number_of_check_in_days') || $check_field('add','number_of_check_in_days') || $check_field('set','number_of_check_in_days')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="入住天数" prop="number_of_check_in_days">
												<el-input id="number_of_check_in_days" v-model="form['number_of_check_in_days']" placeholder="请输入入住天数"
							  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','number_of_check_in_days')) || (!form['order_management_id'] && $check_field('add','number_of_check_in_days'))" :disabled="disabledObj['number_of_check_in_days_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','number_of_check_in_days')">{{form['number_of_check_in_days']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','total_price') || $check_field('add','total_price') || $check_field('set','total_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="合计总价" prop="total_price">
												<el-input id="total_price" v-model="form['total_price']" placeholder="请输入合计总价"
							  v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','total_price')) || (!form['order_management_id'] && $check_field('add','total_price'))"  @focus="set_total_price()" :disabled="disabledObj['total_price_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','total_price')">{{form['total_price']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','order_status') || $check_field('add','order_status') || $check_field('set','order_status')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="订单状态" prop="order_status">
								<el-select id="order_status" v-model="form['order_status']"
						v-if="user_group === '管理员' || (form['order_management_id'] && $check_field('set','order_status')) || (!form['order_management_id'] && $check_field('add','order_status'))">
						<el-option v-for="o in list_order_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','order_status')">{{form['order_status']}}</div>
							</el-form-item>
			</el-col>
					
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

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
				list_order_status: ['预订成功','预订失败'],
	
	
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
                    this.list_user_booking_users = json.result.list;
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
												_this.form["booking_users"] = id
									_this.disabledObj['booking_users' + '_isDisabled'] = true
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
					get_user_booking_users(id){
				var obj = this.list_user_booking_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
			
	
			
	
										set_total_price(){
				this.form.total_price = parseFloat(this.form.check_in_price) * parseFloat(this.form.number_of_check_in_days)
			},
							
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
									// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
																
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
																												$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																																				


			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																																										return msg;
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
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
															this.get_list_user_booking_users();
					this.get_group_user_booking_users();
																	},
	}
</script>

<style>
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

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
