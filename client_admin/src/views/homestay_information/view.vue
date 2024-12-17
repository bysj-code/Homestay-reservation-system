<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','name_of_homestay') || $check_field('add','name_of_homestay') || $check_field('set','name_of_homestay')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="民宿名称" prop="name_of_homestay">
												<el-input id="name_of_homestay" v-model="form['name_of_homestay']" placeholder="请输入民宿名称"
							  v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','name_of_homestay')) || (!form['homestay_information_id'] && $check_field('add','name_of_homestay'))" :disabled="disabledObj['name_of_homestay_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','name_of_homestay')">{{form['name_of_homestay']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','landlord_user') || $check_field('add','landlord_user') || $check_field('set','landlord_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房东用户" prop="landlord_user">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_landlord_user(form['landlord_user']) }}
							<!--<el-input id="business_name" v-model="form['landlord_user']" placeholder="请输入房东用户"-->
							<!--v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','landlord_user')) || (!form['homestay_information_id'] && $check_field('add','landlord_user'))" :disabled="disabledObj['landlord_user_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','landlord_user')">{{form['landlord_user']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','landlord_user')) || (!form['homestay_information_id'] && $check_field('add','landlord_user'))" id="landlord_user" v-model="form['landlord_user']" :disabled="disabledObj['landlord_user_isDisabled']">
								<el-option v-for="o in list_user_landlord_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','landlord_user')" id="landlord_user" v-model="form['landlord_user']" :disabled="true">
								<el-option v-for="o in list_user_landlord_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="landlord_user" v-model="form['landlord_user']" :disabled="disabledObj['landlord_user_isDisabled']">
							<el-option v-for="o in list_user_landlord_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','region_name') || $check_field('add','region_name') || $check_field('set','region_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="地区名称" prop="region_name">
								<el-select id="region_name" v-model="form['region_name']"
						v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','region_name')) || (!form['homestay_information_id'] && $check_field('add','region_name'))">
						<el-option v-for="o in list_region_name" :key="o['region_name']" :label="o['region_name']"
							:value="o['region_name']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','region_name')">{{form['region_name']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','homestay_address') || $check_field('add','homestay_address') || $check_field('set','homestay_address')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="民宿地址" prop="homestay_address">
												<el-input id="homestay_address" v-model="form['homestay_address']" placeholder="请输入民宿地址"
							  v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','homestay_address')) || (!form['homestay_information_id'] && $check_field('add','homestay_address'))" :disabled="disabledObj['homestay_address_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','homestay_address')">{{form['homestay_address']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','room_number') || $check_field('add','room_number') || $check_field('set','room_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房间号" prop="room_number">
												<el-input id="room_number" v-model="form['room_number']" placeholder="请输入房间号"
							  v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','room_number')) || (!form['homestay_information_id'] && $check_field('add','room_number'))" :disabled="disabledObj['room_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','room_number')">{{form['room_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','room_type') || $check_field('add','room_type') || $check_field('set','room_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="房间类型" prop="room_type">
								<el-select id="room_type" v-model="form['room_type']"
						v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','room_type')) || (!form['homestay_information_id'] && $check_field('add','room_type'))">
						<el-option v-for="o in list_room_type" :key="o['room_type']" :label="o['room_type']"
							:value="o['room_type']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','room_type')">{{form['room_type']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','cover_photo') || $check_field('add','cover_photo') || $check_field('set','cover_photo')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面图片" prop="cover_photo">
								<el-upload :disabled="disabledObj['cover_photo_isDisabled']" id="cover_photo" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover_photo"
						:show-file-list="false" v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','cover_photo')) || (!form['homestay_information_id'] && $check_field('add','cover_photo'))">
						<img v-if="form['cover_photo']" :src="$fullUrl(form['cover_photo'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','cover_photo')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['cover_photo'])" :preview-src-list="[$fullUrl(form['cover_photo'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','check_in_price') || $check_field('add','check_in_price') || $check_field('set','check_in_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="入住价格" prop="check_in_price">
												<el-input id="check_in_price" v-model="form['check_in_price']" placeholder="请输入入住价格"
							  v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','check_in_price')) || (!form['homestay_information_id'] && $check_field('add','check_in_price'))" :disabled="disabledObj['check_in_price_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','check_in_price')">{{form['check_in_price']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','detailed_introduction') || $check_field('add','detailed_introduction') || $check_field('set','detailed_introduction')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="详情介绍" prop="detailed_introduction">
								<el-input type="textarea" id="detailed_introduction" v-model="form['detailed_introduction']" placeholder="请输入详情介绍"
						v-if="user_group === '管理员' || (form['homestay_information_id'] && $check_field('set','detailed_introduction')) || (!form['homestay_information_id'] && $check_field('add','detailed_introduction'))" :disabled="disabledObj['detailed_introduction_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','detailed_introduction')">{{form['detailed_introduction']}}</div>
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
				list_region_name: [""],
	
		
		
						// 房间类型选项列表
				list_room_type: [""],
	
		
		
		
	
			}
		},
		methods: {


	
	
			
	
				/**
			 * 获取房东用户用户列表
			 */
			async get_list_user_landlord_user() {
                // if(this.user_group !== "管理员" && this.form["landlord_user"] === 0) {
                //     this.form["landlord_user"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=房东用户");
                if(json.result && json.result.list){
                    this.list_user_landlord_user = json.result.list;
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
												_this.form["landlord_user"] = id
									_this.disabledObj['landlord_user' + '_isDisabled'] = true
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
					get_user_landlord_user(id){
				var obj = this.list_user_landlord_user.getObj({"user_id":id});
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
			
				/**
			 * 获取地区名称列表
			 */
			async get_list_region_name() {
				var json = await this.$get("~/api/regional_classification/get_list?");
				if(json.result && json.result.list){
					this.list_region_name = json.result.list;
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
					this.list_room_type = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
						/**
			 * 上传封面图片
			 * @param {Object} param 图片参数
			 */
			upload_cover_photo(param){
						this.uploadFile(param.file, "cover_photo");
					},
	
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																
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
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
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
