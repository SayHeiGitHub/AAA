//
//  URL.h
//  全国知名景点
//
//  Created by wumeng  on 16/3/1.
//  Copyright © 2016年 www.lanou3g.com. All rights reserved.
//

#ifndef URL_h
#define URL_h
//#define kProURL @"http://wx.fengjingkong.com:8080/tsp/regionWSAction!findChildByID.do?regionId=001001"
// 通用
#define kqq @"http://wx.fengjingkong.com:8080/"
//全国知名景区
//#define kNation @"http://wx.fengjingkong.com:8080/tsp/regionWSAction!findChildByID.do?regionId=001001HTTP/1.1 "
#define kNation @"tsp/regionWSAction!findChildByID.do?regionId="

//知名景区第二界面
//http://wx.fengjingkong.com:8080/tsp/regionWSAction!findChildByID.do?regionId=001001028
#define kNationTwo @"tsp/regionWSAction!findChildByID.do?regionId="
//知名景区第三界面
//http://wx.fengjingkong.com:8080/tsp/sightWSAction!findAllSightByID.do?id=001001028012
#define kNationThree @"tsp/sightWSAction!findAllSightByID.do?id="
//知名景区第四界面
// http://wx.fengjingkong.com:8080/tsp/sightWSAction!getSight.do?sightId=001001028012001
//http://wx.fengjingkong.com:8080/tsp/sightWSAction!getSight.do?sightId=001001001015032
#define kNationFour @"http://wx.fengjingkong.com:8080/tsp/sightWSAction!getSight.do?sightId="
//周边景区 接口
//#define kCir @"http://wx.fengjingkong.com:8080/tsp/sightWSAction!findArroundSight.do?aroundSearch.lon=116.350006&aroundSearch.lat=40.036034&aroundSearch.radius=50&page=1&pageSize=100"
#define kCir @"tsp/sightWSAction!findArroundSight.do?aroundSearch.lon=116.350006&aroundSearch.lat=40.036034&aroundSearch.radius=50&page=1&pageSize="
//周边景区 第二界面
// http://wx.fengjingkong.com:8080/tsp/sightWSAction!getSight.do?sightId=001001001033
//景区活动
//#define kActiv @" http://wx.fengjingkong.com:8080/messageManager/BeautySpotsServlet?func=getSeeKeyServlet&startNum=0&endNum=20&session=1516224077497 HTTP/1.1"
#define kActiv @"messageManager/BeautySpotsServlet?func=getSeeKeyServlet&startNum=0&endNum=20&session="

//景区活动 第二界面
//http://wx.fengjingkong.com:8080/tsp/sightWSAction!getSight.do?sightId=001001001010002
//景点推荐
//#define kSig @"http://wx.fengjingkong.com:8080/tsp/sightWSAction!findAllSight.do?searchBean.sightLevel=05&searchBean.hasRoute=1"
#define kSig @"tsp/sightWSAction!findAllSight.do?searchBean.sightLevel=05&searchBean.hasRoute="

//景点推荐 第二界面
//  http://wx.fengjingkong.com:8080/tsp/sightWSAction!getSight.do?sightId=001001001015048

#endif /* URL_h */
