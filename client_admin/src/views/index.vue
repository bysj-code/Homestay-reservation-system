<template>
	<div class="page_root" id="root_index">
		<div class="warp">
			<div class="container-fluid">
				<el-row>
					<el-col :span="4">
						<mm_label bg_color="bg_purple" icon="el-icon-user-solid" :url="url_user_count" unit="人"
								  title="用户数量"></mm_label>
					</el-col>
<!--					<el-col :span="4">-->
<!--						<mm_label bg_color="bg_green" icon="el-icon-view" :url="url_article_hits" unit="次"-->
<!--								  title="文章浏览量"></mm_label>-->
<!--					</el-col>-->
				</el-row>

				<el-row>
											<el-col v-if="user_group == '管理员' || $check_figure('/sales_data/table')" :span="8">
						<div class="card chart">
									<newBarChart v-if="bar_obj_sales_data.values.length > 0" id="bar_obj_sales_data" :vm="bar_obj_sales_data" :title="'销售数据统计'">
							</newBarChart>
							<div v-if="!bar_obj_sales_data.values.length">销售数据没有符合条件的数据</div>
								</div>
					</el-col>
							<el-col v-if="user_group == '管理员' || $check_figure('/quarterly_analysis/table')" :span="8">
						<div class="card chart">
									<newLineChart v-if="line_obj_quarterly_analysis.values.length > 0" id="line_obj_quarterly_analysis" :vm="line_obj_quarterly_analysis" :title="'季度分析统计'">
							</newLineChart>
							<div v-if="!line_obj_quarterly_analysis.values.length">季度分析没有符合条件的数据</div>
								</div>
					</el-col>
							<el-col v-if="user_group == '管理员' || $check_figure('/profit_and_loss_data/table')" :span="8">
						<div class="card chart">
									<newBarChart v-if="bar_obj_profit_and_loss_data.values.length > 0" id="bar_obj_profit_and_loss_data" :vm="bar_obj_profit_and_loss_data" :title="'盈亏数据统计'">
							</newBarChart>
							<div v-if="!bar_obj_profit_and_loss_data.values.length">盈亏数据没有符合条件的数据</div>
								</div>
					</el-col>
							</el-row>


			</div>
		</div>
	</div>
</template>
<script>
	import mixin from "@/mixins/page.js";
	import pieChart from "@/components/charts/pie_chart";
	import barChart from "@/components/charts/bar_chart";
	import newBarChart from "@/components/charts/new_bar_chart";
	import lineChart from "@/components/charts/line_chart";
	import newLineChart from "@/components/charts/new_line_chart";
	import mm_label from "@/components/mm_label.vue";
	export default {
		mixins: [mixin],
		name: "Home",
		components: {
			pieChart,
			barChart,
			newBarChart,
			lineChart,
			newLineChart,
			mm_label
		},
		data() {
			return {
				activeName: "third",
															bar_obj_sales_data: {
					names:[],
					xAxis: [],
					values:[]
				},
						line_obj_quarterly_analysis:{
					names:[],
					xAxis: [],
					values:[]
				},
						bar_obj_profit_and_loss_data: {
					names:[],
					xAxis: [],
					values:[]
				},
									url_user_count: "~/api/user/count?",
				url_article_hits: "~/api/article/sum?field=hits",
			};
		},
		created() {
									// 执行销售数据数据获取
			this.get_list_sales_data();
					// 执行季度分析数据获取
			this.get_list_quarterly_analysis();
					// 执行盈亏数据数据获取
			this.get_list_profit_and_loss_data();
					},
		mounted() {},
		methods: {
			async get_nickname(list,flag){
				if (flag) {
					for (let i=0;i<list.length;i++){
						await this.$get(
								"~/api/user/get_obj?user_id="+list[i],
								null,
								(json) => {
									if (json.result) {
										list[i] = json.result.obj.nickname;
									}
								});
					}
				}else {
					for (let i=0;i<list.length;i++){
						await this.$get(
								"~/api/user/get_obj?user_id="+list[i].name,
								null,
								(json) => {
									if (json.result) {
										list[i].name = json.result.obj.nickname;
									}
								});
					}
				}
			},
														// 获取销售数据统计柱状图
			async get_list_sales_data() {
				let name_list = [];
				let query_str = "";
																	let group_by_value = "report_date";
								let flag = false;
												let date_flag = "日期"
																						name_list.push("销售数量");
				query_str = query_str+"sales_volumes"+","
																									this.bar_obj_sales_data.names = name_list
				query_str = query_str.substr(0,query_str.length-1);
				let data = {};
						await this.$get(
						"~/api/sales_data/bar_group?field="+query_str+"&groupby="+group_by_value,
						data,
						(json) => {
							if (json.result) {
								let xAxis = [];
								let values = [];
								json.result.list.map((o) => {
									if (date_flag === "日期") {
										xAxis.push(this.$toTime(o[0] ,"yyyy-MM-dd"));
									}else if (date_flag === "时间") {
										xAxis.push(this.$toTime(o[0] ,"hh:mm:ss"));
									}else if (date_flag === "日长") {
										xAxis.push(this.$toTime(o[0] ,"yyyy-MM-dd hh:mm:ss"));
									}else {
										xAxis.push(o[0]);
									}
									values.push(o.splice(1))
								});
								this.bar_obj_sales_data.xAxis = xAxis;
								this.bar_obj_sales_data.values = values;
							}
							if (flag){
								this.get_nickname(this.bar_obj_sales_data.xAxis,true);
							}
						});
			},
					// 获取季度分析统计折线图
			async get_list_quarterly_analysis() {
									let group_by_value = "reporting_quarter";
				let data = {};
								let flag = false;
												await this.$get(
					"~/api/quarterly_analysis/get_list?groupby="+group_by_value,data,
					(json) => {
						if (json.result) {
							let list = json.result.list;
							let name_list = [];
							for (let i=0;i<list.length;i++){
								name_list.push(list[i].reporting_quarter);
							}
							this.line_obj_quarterly_analysis.names = name_list;
							this.get_list_quarterly_analysis_sub("reporting_quarter",flag);
						}
				});
																												},
			async get_list_quarterly_analysis_sub(v1,names_flag) {
														let data = {};
								let flag = false;
												await this.$get(
					"~/api/quarterly_analysis/get_list?groupby=report_date",data,
					(json) => {
						if (json.result) {
							let list = json.result.list;
							let xAxis_list = [];
							for (let i=0;i<list.length;i++){
												xAxis_list.push(list[i].report_date);
											}
							this.line_obj_quarterly_analysis.xAxis = xAxis_list;
							this.get_list_quarterly_analysis_sub_sub(v1,"report_date",names_flag,flag);
						}
				});
																							},
			async get_list_quarterly_analysis_sub_sub(v1,v2,names_flag,xAxis_flag) {
																			let data_str = "{\""+v1+"\":\"\",\""+v2+"\":\"\"}";
				let data = JSON.parse(data_str);
								for (let i=0;i<this.line_obj_quarterly_analysis.xAxis.length;i++){
					let list = []
					for (let j=0;j<this.line_obj_quarterly_analysis.names.length;j++){
						data[v2] = this.line_obj_quarterly_analysis.xAxis[i];
						data[v1] = this.line_obj_quarterly_analysis.names[j];
						await this.$get(
								"~/api/quarterly_analysis/sum?field=profit_amount",
								data,
								(json) => {
									if (json.result) {
										list[j] = json.result;
									}else {
										list[j] = 0;
									}
								});
					}
					this.line_obj_quarterly_analysis.values.push(list)
				}
				if (names_flag){
					this.get_nickname(this.line_obj_quarterly_analysis.names,true);
				}
				if (xAxis_flag){
					this.get_nickname(this.line_obj_quarterly_analysis.xAxis,true);
				}
																		},
					// 获取盈亏数据统计柱状图
			async get_list_profit_and_loss_data() {
				let name_list = [];
				let query_str = "";
																	let group_by_value = "report_date";
								let flag = false;
												let date_flag = "日期"
																						name_list.push("盈利金额");
				query_str = query_str+"profit_amount"+","
															name_list.push("亏损金额");
				query_str = query_str+"loss_amount"+","
																									this.bar_obj_profit_and_loss_data.names = name_list
				query_str = query_str.substr(0,query_str.length-1);
				let data = {};
						await this.$get(
						"~/api/profit_and_loss_data/bar_group?field="+query_str+"&groupby="+group_by_value,
						data,
						(json) => {
							if (json.result) {
								let xAxis = [];
								let values = [];
								json.result.list.map((o) => {
									if (date_flag === "日期") {
										xAxis.push(this.$toTime(o[0] ,"yyyy-MM-dd"));
									}else if (date_flag === "时间") {
										xAxis.push(this.$toTime(o[0] ,"hh:mm:ss"));
									}else if (date_flag === "日长") {
										xAxis.push(this.$toTime(o[0] ,"yyyy-MM-dd hh:mm:ss"));
									}else {
										xAxis.push(o[0]);
									}
									values.push(o.splice(1))
								});
								this.bar_obj_profit_and_loss_data.xAxis = xAxis;
								this.bar_obj_profit_and_loss_data.values = values;
							}
							if (flag){
								this.get_nickname(this.bar_obj_profit_and_loss_data.xAxis,true);
							}
						});
			},
					
		},
		computed:{
			recognitionHeight(){
				return "830px"
			},
			recognitionUrl(){
				return "https://www.faceplusplus.com.cn/${model.filter.recognitionType}/"
			}
		}
	};
</script>

<style scoped="scoped">
	.chart {
		display: block;
		width: 100%;
		height: 400px;
		padding: 1rem;
		position: relative;
	}

	.el-col {
		padding: 0.5rem;
	}

	.card {
		overflow: hidden;
	}

	.iframe_box ,.iframe_box_change{
		width: 100%;
		height: 1180px;
		position: relative;
		margin-top: 25px;
	}
	.iframe_box_change{
		height: 580px;
		padding-top: 50px;
	}
	.iframe_box	.iframe_box_content, .iframe_box_change .iframe_box_content{
		width: 100%;
		height: 100%;
	}
	.iframe_box_top{
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100px;
		font-size: 25px;
		line-height: 100px;
		background: #fff;
		z-index: 99999999;
		padding-left: 50px;
	}
	#iframe_box_face div::before {
		content: '';
		width: 100px;
		position: absolute;
		top: 154px;
		right: 129px;
		z-index: 999;
		height: 20px;
		background-color: #FFFFFF;
	}

	#iframe_box_face>h1 {
		margin-top: 100px;
		margin-bottom: 20px;
	}
</style>
