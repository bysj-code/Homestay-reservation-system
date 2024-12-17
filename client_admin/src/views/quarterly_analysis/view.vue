<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','reporting_quarter') || $check_field('add','reporting_quarter') || $check_field('set','reporting_quarter')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报表季度" prop="reporting_quarter">
												<el-input id="reporting_quarter" v-model="form['reporting_quarter']" placeholder="请输入报表季度"
							  v-if="user_group === '管理员' || (form['quarterly_analysis_id'] && $check_field('set','reporting_quarter')) || (!form['quarterly_analysis_id'] && $check_field('add','reporting_quarter'))" :disabled="disabledObj['reporting_quarter_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','reporting_quarter')">{{form['reporting_quarter']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','report_date') || $check_field('add','report_date') || $check_field('set','report_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报表日期" prop="report_date">
												<el-input id="report_date" v-model="form['report_date']" placeholder="请输入报表日期"
							  v-if="user_group === '管理员' || (form['quarterly_analysis_id'] && $check_field('set','report_date')) || (!form['quarterly_analysis_id'] && $check_field('add','report_date'))" :disabled="disabledObj['report_date_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','report_date')">{{form['report_date']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','profit_amount') || $check_field('add','profit_amount') || $check_field('set','profit_amount')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="盈利金额" prop="profit_amount">
												<el-input id="profit_amount" v-model="form['profit_amount']" placeholder="请输入盈利金额"
							  v-if="user_group === '管理员' || (form['quarterly_analysis_id'] && $check_field('set','profit_amount')) || (!form['quarterly_analysis_id'] && $check_field('add','profit_amount'))" :disabled="disabledObj['profit_amount_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','profit_amount')">{{form['profit_amount']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','recording_personnel') || $check_field('add','recording_personnel') || $check_field('set','recording_personnel')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="记录人员" prop="recording_personnel">
												<el-input id="recording_personnel" v-model="form['recording_personnel']" placeholder="请输入记录人员"
							  v-if="user_group === '管理员' || (form['quarterly_analysis_id'] && $check_field('set','recording_personnel')) || (!form['quarterly_analysis_id'] && $check_field('add','recording_personnel'))" :disabled="disabledObj['recording_personnel_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','recording_personnel')">{{form['recording_personnel']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','remarks') || $check_field('add','remarks') || $check_field('set','remarks')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="备注信息" prop="remarks">
								<el-input type="textarea" id="remarks" v-model="form['remarks']" placeholder="请输入备注信息"
						v-if="user_group === '管理员' || (form['quarterly_analysis_id'] && $check_field('set','remarks')) || (!form['quarterly_analysis_id'] && $check_field('add','remarks'))" :disabled="disabledObj['remarks_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','remarks')">{{form['remarks']}}</div>
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
				field: "quarterly_analysis_id",
				url_add: "~/api/quarterly_analysis/add?",
				url_set: "~/api/quarterly_analysis/set?",
				url_get_obj: "~/api/quarterly_analysis/get_obj?",
				url_upload: "~/api/quarterly_analysis/upload?",

				query: {
					"quarterly_analysis_id": 0,
				},

				form: {
								"reporting_quarter":  '', // 报表季度
										"report_date":  '', // 报表日期
										"profit_amount":  '', // 盈利金额
										"recording_personnel":  '', // 记录人员
										"remarks":  '', // 备注信息
											"quarterly_analysis_id": 0, // ID
						
				},
				disabledObj:{
								"reporting_quarter_isDisabled": false,
										"report_date_isDisabled": false,
										"profit_amount_isDisabled": false,
										"recording_personnel_isDisabled": false,
										"remarks_isDisabled": false,
										},

	
		
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
		
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
					bl = this.$check_action('/quarterly_analysis/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/quarterly_analysis/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/quarterly_analysis/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/quarterly_analysis/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/quarterly_analysis/view','get');
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
