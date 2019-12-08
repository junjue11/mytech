//
//  SchemeDefine.h
//  MasterDuoBao
//
//  Created by 汤丹峰 on 16/3/23.
//  Copyright © 2016年 wenzhan. All rights reserved.
//

#ifndef SchemeDefine_h
#define SchemeDefine_h

//自定义协议头
#define URL_SCHEME          @"yami"
//自定义域名
#define URL_HOST            @"com.yanjing.yami"


//协议中的path标记
#define URL_PATH_WEB        @"/jump"        //跳H5
#define URL_PATH_NATIVE     @"/native"      //跳本地controller
#define URL_PATH_SHARE      @"/share"       //H5发出的分享
#define URL_PATH_CLOSR      @"/close"       //关闭当前控制器
#define URL_PATH_NATIVENEW  @"/native_no_params"  //跳本地二级或更深级controller
#define URL_PATH_OPENGIFT      @"/openGift"       //打开礼物面板
#define URL_PATH_OPENMETAL      @"/openMetal"       //打开勋章面板
#define URL_PATH_OPENUSERCARD     @"/openUserCard"       //打开用户卡片面板


// 通用参数
#define URL_QUERY_KEY_NEED_LOGIN         @"need_login"
#define URL_QUERY_KEY_NATIVE_NAME         @"i_name"
#define URL_QUERY_KEY_NAME         @"name"

// 网页页面相关参数
#define URL_QUERY_KEY_URL               @"url"          //网页时传输下面四个参数
#define URL_QUERY_KEY_NAV               @"nav"
#define URL_QUERY_KEY_RIGHTBTNTITLE     @"right_btn_title"  //网页右上角按钮，可放刷新、分享、跳转等按钮
#define URL_QUERY_KEY_DISPLAY           @"display"

#define URL_QUERY_KEY_IMG               @"img"//分享的图片
#define URL_QUERY_KEY_CONTENT           @"content"//分享的内容
#define URL_QUERY_KEY_SHAREURL          @"share_url"//分享的url

//约定好的native界面名称参数值

#define LV_PERSON_HOME      @"person_home"                 //个人主界面
#define LV_SKILL_LIST       @"category"          //技能大V列表
#define LV_CHAT             @"conversation"                 //聊天界面
#define LV_ORDER_CENTER     @"order_center"  // 订单中心
#define LV_MAIN_HOME        @"home"        //首页
#define LV_LIVE_ROOM        @"live_audience"        //直播间
#define LV_LIVE_CHATROOM        @"chat_room"        //聊天室
#define LV_USER_RANK        @"user_rank"        //音量榜
#define LV_USER_RANK_PREVIOUS @"user_rank_previous"               // 往期榜
#define LV_SYSTEM_MESSAGE        @"system_message"        //系统消息
#define LV_DYNAMIC_DETAIL        @"dynamic_detail"        //动态详情

#endif /* SchemeDefine_h */
