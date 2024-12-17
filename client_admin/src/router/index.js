import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},


	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},



	// 友情链接路由
	// {
	// 	path: '/link/table',
	// 	name: 'link_table',
	// 	component: () => import('../views/link/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接列表'
	// 	}
	// },
	// {
	// 	path: '/link/view',
	// 	name: 'link_view',
	// 	component: () => import('../views/link/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接详情'
	// 	}
	// },

	// 轮播图路由
	{
		path: '/slides/table',
		name: 'slides_table',
		component: () => import('../views/slides/table.vue'),
		meta: {
			index: 0,
			title: '轮播图列表'
		}
	},
	{
		path: '/slides/view',
		name: 'slides_view',
		component: () => import('../views/slides/view.vue'),
		meta: {
			index: 0,
			title: '轮播图详情'
		}
	},
		// 文章路由
	{
		path: '/article/table',
		name: 'article_table',
		component: () => import('../views/article/table.vue'),
		meta: {
			index: 0,
			title: '文章列表'
		}
	},
	{
		path: '/article/view',
		name: 'article_view',
		component: () => import('../views/article/view.vue'),
		meta: {
			index: 0,
			title: '文章详情'
		}
	},

	// 文章分类路由
	{
		path: '/article_type/table',
		name: 'article_type_table',
		component: () => import('../views/article_type/table.vue'),
		meta: {
			index: 0,
			title: '文章分类列表'
		}
	},
	{
		path: '/article_type/view',
		name: 'article_type_view',
		component: () => import('../views/article_type/view.vue'),
		meta: {
			index: 0,
			title: '文章分类详情'
		}
	},
	
	// 广告路由
	// {
	// 	path: '/ad/table',
	// 	name: 'ad_table',
	// 	component: () => import('../views/ad/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告列表'
	// 	}
	// },
	// {
	// 	path: '/ad/view',
	// 	name: 'ad_view',
	// 	component: () => import('../views/ad/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告详情'
	// 	}
	// },



	// 公告路由
	{
		path: '/notice/table',
		name: 'notice_table',
		component: () => import('../views/notice/table.vue'),
		meta: {
			index: 0,
			title: '公告信息列表'
		}
	},
	{
		path: '/notice/view',
		name: 'notice_view',
		component: () => import('../views/notice/view.vue'),
		meta: {
			index: 0,
			title: '公告信息详情'
		}
	},


	// 评论路由
	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue'),
		meta: {
			index: 0,
			title: '评论列表'
		}
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue'),
		meta: {
			index: 0,
			title: '评论详情'
		}
	},

	// 普通用户路由
	{
		path: '/ordinary_users/table',
		name: 'ordinary_users_table',
		component: () => import('../views/ordinary_users/table.vue'),
		meta: {
			index: 0,
			title: '普通用户列表'
		}
	},
	{
		path: '/ordinary_users/view',
		name: 'ordinary_users_view',
		component: () => import('../views/ordinary_users/view.vue'),
		meta: {
			index: 0,
			title: '普通用户详情'
		}
	},
	// 房东用户路由
	{
		path: '/landlord_user/table',
		name: 'landlord_user_table',
		component: () => import('../views/landlord_user/table.vue'),
		meta: {
			index: 0,
			title: '房东用户列表'
		}
	},
	{
		path: '/landlord_user/view',
		name: 'landlord_user_view',
		component: () => import('../views/landlord_user/view.vue'),
		meta: {
			index: 0,
			title: '房东用户详情'
		}
	},
	// 民宿信息路由
	{
		path: '/homestay_information/table',
		name: 'homestay_information_table',
		component: () => import('../views/homestay_information/table.vue'),
		meta: {
			index: 0,
			title: '民宿信息列表'
		}
	},
	{
		path: '/homestay_information/view',
		name: 'homestay_information_view',
		component: () => import('../views/homestay_information/view.vue'),
		meta: {
			index: 0,
			title: '民宿信息详情'
		}
	},
	// 订单管理路由
	{
		path: '/order_management/table',
		name: 'order_management_table',
		component: () => import('../views/order_management/table.vue'),
		meta: {
			index: 0,
			title: '订单管理列表'
		}
	},
	{
		path: '/order_management/view',
		name: 'order_management_view',
		component: () => import('../views/order_management/view.vue'),
		meta: {
			index: 0,
			title: '订单管理详情'
		}
	},
	// 取消订单路由
	{
		path: '/cancellation_of_order/table',
		name: 'cancellation_of_order_table',
		component: () => import('../views/cancellation_of_order/table.vue'),
		meta: {
			index: 0,
			title: '取消订单列表'
		}
	},
	{
		path: '/cancellation_of_order/view',
		name: 'cancellation_of_order_view',
		component: () => import('../views/cancellation_of_order/view.vue'),
		meta: {
			index: 0,
			title: '取消订单详情'
		}
	},
	// 销售数据路由
	{
		path: '/sales_data/table',
		name: 'sales_data_table',
		component: () => import('../views/sales_data/table.vue'),
		meta: {
			index: 0,
			title: '销售数据列表'
		}
	},
	{
		path: '/sales_data/view',
		name: 'sales_data_view',
		component: () => import('../views/sales_data/view.vue'),
		meta: {
			index: 0,
			title: '销售数据详情'
		}
	},
	// 季度分析路由
	{
		path: '/quarterly_analysis/table',
		name: 'quarterly_analysis_table',
		component: () => import('../views/quarterly_analysis/table.vue'),
		meta: {
			index: 0,
			title: '季度分析列表'
		}
	},
	{
		path: '/quarterly_analysis/view',
		name: 'quarterly_analysis_view',
		component: () => import('../views/quarterly_analysis/view.vue'),
		meta: {
			index: 0,
			title: '季度分析详情'
		}
	},
	// 盈亏数据路由
	{
		path: '/profit_and_loss_data/table',
		name: 'profit_and_loss_data_table',
		component: () => import('../views/profit_and_loss_data/table.vue'),
		meta: {
			index: 0,
			title: '盈亏数据列表'
		}
	},
	{
		path: '/profit_and_loss_data/view',
		name: 'profit_and_loss_data_view',
		component: () => import('../views/profit_and_loss_data/view.vue'),
		meta: {
			index: 0,
			title: '盈亏数据详情'
		}
	},
	// 地区分类路由
	{
		path: '/regional_classification/table',
		name: 'regional_classification_table',
		component: () => import('../views/regional_classification/table.vue'),
		meta: {
			index: 0,
			title: '地区分类列表'
		}
	},
	{
		path: '/regional_classification/view',
		name: 'regional_classification_view',
		component: () => import('../views/regional_classification/view.vue'),
		meta: {
			index: 0,
			title: '地区分类详情'
		}
	},
	// 房间分类路由
	{
		path: '/room_classification/table',
		name: 'room_classification_table',
		component: () => import('../views/room_classification/table.vue'),
		meta: {
			index: 0,
			title: '房间分类列表'
		}
	},
	{
		path: '/room_classification/view',
		name: 'room_classification_view',
		component: () => import('../views/room_classification/view.vue'),
		meta: {
			index: 0,
			title: '房间分类详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "民宿预定系统小程序-admin";
	document.title = title;
})

export default router
