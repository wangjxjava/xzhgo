<%@page import="com.xzh.common.util.Location"%>
<%@page import="com.xzh.common.constant.UserConstant"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 团购测试>>>正式上线删除 代码 -->
 <%@page import="com.xzh.system.model.TbBuyer"%>
<%
	HttpSession Session = request.getSession();
	Integer buyerId = null;
	if(null != Session){
		TbBuyer tbBuyer = (TbBuyer) Session.getAttribute("tbBuyer");
		if(null != tbBuyer){
	    	buyerId = tbBuyer.getBuyerId();
		}
	}
%> 
<!-- 团购测试>>>正式上线删除 代码 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no">
<title>首页</title>
<%@ include file="/incH5.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/mainH5.css" />
	<%-- <script type="text/javascript">var element = '<%=element%>';</script> --%>
	<%-- <script type="text/javascript">var buyerId = '<%=buyerId%>';</script> --%>
</head>

<body onload="showOrHideBuyCom();">
	<!--头部banner-->
	 <header id="header">
	
		<div class="bd1">
			<ul>
				<!-- addByCL-2016/04/08：轮播图 -->
				<c:forEach items="${bannerImgList }" var="bannerImg" varStatus="bil">
					<li>
						<a href="javascript:void(0);" onclick="openHeade('${bannerImg.activityType}','${bannerImg.linkUrl}')">
							<img src="${bannerImg.imgAddress}" />
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="hd1">
			<ul>
				<!-- addByCL-2016/04/08 -->
				<c:forEach items="${bannerImgList }" var="bannerImg" varStatus="bil">
					<li></li>
				</c:forEach>
			</ul>
		</div>
		
	</header> 
	
	
	
	
	
	
 <!-- 新添加头部包裹层 -->
 <div class="head_baoguo">  
	<!--定位-->
	<a href="<%=basePath %>systemH5/address/toAddressSwitch?addressfrom=mainAddress">
		<div class="location">
			<img src="<%=basePath %>images1/mineLoc.png" />
			<p id="address">
				<!--<img src="<%=basePath %>images1/search_SanjiaoS.png" style="float: right;margin-top: 0.24rem;width: 0.3rem;"/>-->
			</p>
		</div> 
		
		<!--新添加图标-->     
		<div class="sanjiaox">
			<img src="<%=basePath %>images1/search_SanjiaoS.png" />
		</div>
	</a>
	<!--新添加搜索功能-->
	<div class="search">
		<img src="<%=basePath %>images1/home_Search.png" id="search"/>
	</div>
	
  </div>


	<!--字体横向滚动(跑马灯)-->
	<%-- <div class="txtMarquee-left">
	  <img src="<%=basePath %>img/xiaolaba.png" />				
      <marquee direction="left" scrollamount="5" class="pmdeng">艾色兔配送时效升级！江宁地区下单最快2小时送到！南京主城区下单，当日15:00前订单，当日到；当日15:00后订单，次日到。</marquee>	
	</div> --%>

    
    <div class="txtMarquee-left">
     <c:forEach items="${notifyTxtList }" var="notifyTxt">
      <%-- <c:if test="${notifyTxt.isDelete==1}"> --%>    <!-- 一共就一条数据，所以这里不需要这个判断 -->
	    <img src="<%=basePath %>img/xiaolaba.png" />				
        <marquee direction="left" scrollamount="5" class="pmdeng">
          ${notifyTxt.notifyTxtContent}
        </marquee>
     <%--  </c:if> --%>	
	 </c:forEach>
	</div>



	<!--商品列表-->
	<%-- <div class="commodity">
		<ol>
			<li>
				<a href='<%=basePath%>systemH5/bcpjc.do?gcModule=A&gcCf=1&sortType=10' >
					<img src="<%=basePath %>img/styld0.png" />
					<p style="color: #555;">净菜</p>
				</a>
			</li>
			<li>
				<a href='<%=basePath%>systemH5/bcpjc.do?gcModule=B&gcCf=1&sortType=10'>
					<img src="<%=basePath %>img/styld1.png" />
					<p>果蔬生鲜</p> 
				</a>
			</li>
			<li>
				<a href='javascript:void(0);' onclick="openPng('2');"> 
					<img src="<%=basePath %>img/cuxiao.png" />
					<p>体验店</p>
				</a>
			</li>
			<li>
				<a href='javascript:void(0);' onclick="openPng('9');">
					<img src="<%=basePath %>img/styld3.png" />
					<p>新人礼</p>
				</a>
			</li>
			
		</ol>		
	</div> --%>
	
	

	<div class="commodity">
		<ol>
		  <c:forEach items="${buttonImgList }" var="buttonImg" varStatus="bil">
		  <c:if test="${ buttonImg.buttonType != 4 && buttonImg.buttonType != 5 }">
			<%-- <c:if test="${ buttonImg.buttonType != 4 && buttonImg.buttonType != 5 }"> --%>
			 <li>
				<a href="javascript:void(0);" onclick="openButton('${buttonImg.buttonType}','${buttonImg.buttonParam}');">
				  <img src="${buttonImg.buttonImgAddress}" />
				  <p>${buttonImg.buttonName}</p>
				</a>
			 </li>
			</c:if>
			<!-- 测试 -->
			<%-- <c:if test="${buttonImg.buttonType == 5}">
			<%
				if (buyerId != null &&( buyerId == 10532 || buyerId == 11436 || buyerId == 10454 || buyerId == 10274 || buyerId == 10669 || buyerId  == 12107)) {
			%>
				<li>
				<a href="javascript:void(0);" onclick="openButton('${buttonImg.buttonType}');">
				  <img src="${buttonImg.buttonImgAddress}" />
				  <p>${buttonImg.buttonName}</p>
				</a>
			 </li>
			<%
				}
			%>
			</c:if> --%>
			<!-- 测试 -->
		 </c:forEach>				
		</ol>		
	</div>
	
	
	
	<!-- 首页弹窗广告 -->
	<%-- <input id="isPopup" type="hidden" value='${sessionScope.isPopup }'/>
	<!-- 背景div -->
	<div id="bg"></div>
	<!-- 图片div -->
	<div id="show">
		<!-- 图片 -->
		<img src="${popupImg.imgAddress }" />
		<!-- 右上角的关闭区域 -->
		<div id="btnclose" onclick="hidePopupImg();"></div>
		<!-- 图片点击区域（进入专题页） -->
		<c:if test="${popupImg.isInvitation == 0 }">
			<div class="showproduct" onclick="openPng('${popupImg.imgType}')"></div>
		</c:if>
		<c:if test="${popupImg.isInvitation == 1 }">
			<div class="showproduct" onclick="showSharePage()"></div>
		</c:if>			
	</div> --%>
	
	<!--新添加新人礼-->
	<!-- 
	<div class="xrl">

		<c:forEach items="${productImgList }" var="productImg" varStatus="pil">
		
			<c:if test="${productImg.imgType==9}">
				<a href="javascript:void(0);" onclick="openPng('9')">
					<img src="${productImg.imgAddress}"  />
				</a>
			</c:if>
		
		</c:forEach>
		
	</div>
	-->

	<!--产品-->
	<div class="product">
		<ul>
			<!-- addByCL-2016/04/08 -->
			<c:forEach items="${productImgList }" var="productImg" varStatus="pil">
			
				<!-- 从1开始加载活动图片，去掉了0元抢购活动页面，h5去掉了这一块的功能 ,9是新人礼图片,8非专题商品导航图-->
				<c:if test="${productImg.imgType!=0 && productImg.imgType!=9 && productImg.imgType!=8}">
					<li>
						<a href="javascript:void(0);" onclick="openPng('${productImg.imgType}')" >
							<img src="${productImg.imgAddress}" onerror="this.src='<%=basePath %>img/onerror.png'" />
							
						</a>
					</li>
			
					
					<!-- 专题类需要在首页显示的商品 -->						
					<c:forEach items="${productsMap}" var="pm">
					
             				<c:if test="${pm.key == productImg.imgType }">
              				<c:forEach items="${pm.value }" var="goods" varStatus="gl">
              					
            						<dl class="product_list" style="height: 2.12rem;">
									<!-- 商品图片 -->
									<dt class="fly" id="fly${productImg.imgType }_${gl.count}">
										<a href="javascript:void(0);" onclick="gotoDetail('${goods.goodsId}');"><img src="${goods.goodsImgSrc }" style="width: 2.12rem;" /></a>
									</dt>
									<!-- <dd style="text-align: right; margin-right: 0.2rem; margin-top: 0px; width: 3.6rem;"> -->
									<dd>
										<p style="width: 3.4rem; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; font-size: 0.3rem; margin-top: 0px; color: #333;font-weight: bold;">${goods.productTitle }</p>
										<p style="font-size: 0.22rem; margin-bottom: 0.1rem; margin-top: 0.05rem;">${goods.productType }</p>
					                    
					                    <!-- 销量 -->
					                    <p style="color:#888;font-size:0.24rem;">销量:
					                         ${goods.sellgoodsCount }
					                    </p>
					                    
										<!-- 商品价格 -->
										<p style="color: #ea6b2c; font-size: 0.3rem; float: left;">
											&yen; <strong class="priceS" style="font-size: 0.3rem;color: #ea6b2c;">${goods.goodsPrice }</strong>
										</p>
					                    
										<!-- 【立即购买】button -->
										<button type="button" class="bt" id="link${productImg.imgType }_${gl.count}" onclick="showBuyDiv('${productImg.imgType }_${gl.count}')">立即购买</button>
					
										<!--加减按钮div-->
										<div class="buy_icon" id="thediv${productImg.imgType }_${gl.count }" style="display: none;">
					
											<!-- 减按钮 -->
											<a id="subtractA${productImg.imgType }_${gl.count}" onClick="subtract(path,${goods.goodsId},'${productImg.imgType }_${gl.count}');showBuyButton('${productImg.imgType }_${gl.count}');">
												<div class="btn-buy_J"></div>
											</a>
					
											<!-- 已添加到购物车的该商品数量 -->
											<span class='orderCount' id='orderCount${productImg.imgType }_${gl.count}' style="margin-right: 0.18rem;">${goods.cardCount }</span>
					
											<!-- 加按钮 -->
											<a id="addA${productImg.imgType }_${gl.count}" onClick="add(path,${goods.goodsId},'${productImg.imgType }_${gl.count}')">
												<div class="btn-buy" onclick="fly('${productImg.imgType }_${gl.count}')"></div>
											</a>
					
										</div>
					
									</dd>
									</dl>
              					
              				</c:forEach>
              				</c:if>	
             
           			</c:forEach>
					
				</c:if>
			
			</c:forEach>

		</ul>
	</div>

	<!-- 首页新添加产品列表内容-->
	<div class="cook">
	 <c:forEach items="${productImgList }" var="productImg" varStatus="pil">
	   <c:if test="${productImg.imgType==8}">
		 <img src="${productImg.imgAddress}" />
	   </c:if>
	 </c:forEach>
	</div>

	<!--新添加产品列表-->
	<div style="border-top: 0;">
		<c:forEach items="${goodsList }" var="goods" varStatus="gl">
		
			<dl class="product_list" style="height: 2.12rem;">
				<!-- 商品图片 -->
				<dt class="fly" id="fly${gl.count}">
					<a href="javascript:void(0);" onclick="gotoDetail('${goods.goodsId}');"><img src="${goods.goodsImgSrc }" style="width: 2.12rem;"  /></a>
				</dt>
				<dd>
					<p style="width: 3.4rem; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; font-size: 0.3rem; margin-top: 0px; color: #333;font-weight: bold;">${goods.productTitle }</p>
					<p style="font-size: 0.22rem; margin-bottom: 0.1rem;">${goods.productType }</p>
                    
                     <!-- 销量 -->
                    <p style="color:#888;font-size:0.24rem;">已售出:                   
                       ${goods.sellgoodsCount }
                    </p>
                    
					<!-- 商品价格 -->
					<p style="color: #ea6b2c; font-size: 0.3rem;float: left;">
						&yen; <strong class="priceS" style="font-size: 0.3rem;color: #ea6b2c;">${goods.goodsPrice }</strong>
					</p>
                   
					<!-- 【立即购买】button -->
					<button type="button" class="bt" id="link${gl.count}" onclick="showBuyDiv(${gl.count})">立即购买</button>

					<!--加减按钮div-->
					<div class="buy_icon" id="thediv${gl.count }" style="display: none;">

						<!-- 减按钮 -->
						<a id="subtractA${gl.count}" onClick='subtract(path,${goods.goodsId},${gl.count});showBuyButton(${gl.count});'>
							<div class="btn-buy_J"></div>
						</a>

						<!-- 已添加到购物车的该商品数量 -->
						<span class='orderCount' id='orderCount${gl.count}'>${goods.cardCount }</span>

						<!-- 加按钮 -->
						<a id="addA${gl.count}" onClick='add(path,${goods.goodsId},${gl.count})'>
							<div class="btn-buy" onClick="fly(${gl.count})"></div>
						</a>

					</div>
				</dd>
			</dl>
		</c:forEach>
	</div>
	<!-- 新添加加载更多商品-->
	<div class="more">
		<h3>
			<a href='<%=basePath%>systemH5/bcpjc.do?gcLevel=1&gcCf=1&sortType=10'>点击查看更多商品>></a>
		</h3>
	</div>
	
	<!-- 返回顶部 -->
	<a href="javascript:scroll(0,0)">
	    <img src="<%=basePath %>images1/toTop.png"  id="toTop" />
	</a>
	<!-- 发红包浮框 -->
	<%-- <% 
	 if(buyerId!=null){
	%>
	<div class="toRedPacket" onclick="showSharePage()">
	    <img src="<%=basePath %>images1/toRedPacket.png" />
	</div>
	 <%
	  }
	 %> --%>
	
	
	<!--底部   优化分出去-->
	<jsp:include page="footer.jsp" />

	<!--定位-->
	<%
		Location location = (Location) session.getAttribute(UserConstant.LOCATION_SESSION_KEY);
		if (location != null && location.getAddress() != null && location.getLat() != null
				&& location.getLng() != null) {
	%>
		<script type="text/JavaScript">
		 	$("#address").text("配送至：<%=location.getAddress()%>");
		</script>
	<%
		} else {
	%>
	<iframe id="geoPage" style="display: none;"
		src="http://apis.map.qq.com/tools/geolocation?key=TWEBZ-GXFCV-ITDPB-UR2TC-ZV7GH-CEFBB&referer=myapp&effect=zoom"></iframe>
	<script type="text/JavaScript">
       var loc;
       var isMapInit = false;
       //监听定位组件的message事件
       window.addEventListener('message', function(event) { //定位组件在定位失败后，也会触发message, event.data为null
           loc = event.data; // 接收位置信息
           if ( loc && loc.module == 'geolocation' && !isMapInit) { //首次定位成功，
                isMapInit = true;
	            var district = loc.district;
	            var addr = loc.addr;
	            var positionAdress = addr.replace(district,"");
               	$("#address").text("配送至："+positionAdress);
           		saveLocation(loc.lng,loc.lat,positionAdress);
           } 
       }, false);
       //为防止定位组件在message事件监听前已经触发定位成功事件，在此处显示请求一次位置信息
        document.getElementById("geoPage").contentWindow.postMessage('getLocation', '*');
       //设置6s超时，防止定位组件长时间获取位置信息未响应
       setTimeout(function() {
           if(!loc) {
               //主动与前端定位组件通信（可选），获取粗糙的IP定位结果
           document.getElementById("geoPage")
               .contentWindow.postMessage('getLocation.robust', '*');
           }
       }, 4000); //6s为推荐值，业务调用方可根据自己的需求设置改时间，不建议太短

    	//刷新定位
    	function refreshLocation(){
    		isMapInit = false;
    		document.getElementById("geoPage").contentWindow.postMessage('getLocation', '*');
    		setTimeout(function() {
    			document.getElementById("geoPage").contentWindow.postMessage('getLocation.robust', '*');
    	    }, 4000);
    	}
		</script>
	<%
		}
	%>
	<script type="text/javascript" src="<%=basePath %>js/TouchSlide.1.1.js"></script>
	<!--触屏切换-->
	<script type="text/javascript"
		src="<%=basePath %>js/jquery.SuperSlide.2.1.1.js"></script>
	<!-- 微信首页H5相关js文件 -->
	<script type="text/javascript" src="<%=basePath %>js/weixinsyh5.js?v=20161010"></script>
	<script type="text/javascript" src="<%=basePath %>js/buyGoods.js"></script>
	<!-- 返回顶部 -->
	<script type="text/javascript" src="<%=basePath %>js/index.js"></script>
	<!-- 定位 -->
	<%-- 
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=wqBXfIN3HkpM1AHKWujjCdsi"></script>
	<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
	
	<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=2b600474f52836fa16d8fa570b29c07b"></script>
	--%>

	<script type="text/javascript">
			/*TouchSlide({ slideCell:"#header", mainCell:".bd1 ul",titCell:".hd1 ul li", effect:"leftLoop",autoPlay:true  });*/
			TouchSlide({ slideCell:"#header", mainCell:".bd1 ul",titCell:".hd1 ul li", effect:"leftLoop",autoPlay:true,delayTime:500,vis:1,easing:"swing",interTime:3500});
  	</script>
  	<script type="text/javascript">
     		jQuery(".txtMarquee-left").slide({mainCell:".bd2 ul",autoPlay:true,effect:"leftMarquee",interTime:30,trigger:"click"});
   	</script>
	<!--购物车飞入效果新加入-->
	<!-- 
	<script src="http://www.lanrenzhijia.com/ajaxjs/1.4.4/jquery-1.4.4.min.js"></script>
	 -->
	<script>
		function fly(i){
			//商品图片
			var img = $('#fly'+i).bind().find('img');
			var flyElm = img.clone().css('opacity', 0.75);
			$('body').append(flyElm);
			flyElm.css({
				'z-index': 9000,
				'display': 'block',
				'position': 'absolute',
				'top': img.offset().top +10,      
				'left': img.offset().left +10,
				'width': img.width() +'px',
				'height': img.height() +'px'
			});
			flyElm.animate({
				top: $('.head-shopcart').offset().top,
				left: $('.head-shopcart').offset().left,
				width: 10,
				height: 15
			}, 'slow', function() {
				flyElm.remove();
			});
		}
	</script>
	<script type="text/javascript">
   //-----------------------------------addByCL-2016/05/18:关于首页商品的【-】【+】【立即购买】的显示和隐藏----------------------------------------------------------------  
    	
    	//加载事件:控制加载时，是显示【点击购买】按钮，还是显示【-】【+】按钮
    	function showOrHideBuyCom(){
    		//显示购买数量的组件的数组
    		var orderCounts = $(".orderCount");
    		
    		//对数量组件进行遍历
    		$(".orderCount").each(function(){
    		
    			//购买数量
    			var orderCountText = $(this).text();
    			
    			//数量组件的id后缀
    			var idSuffix = $(this).attr("id").replace('orderCount','');
    			
    			//如果购买数量不等于0
    			if( orderCountText != 0 ){
    				//隐藏【点击购买】
    				$("#link"+idSuffix).hide();
    				//显示【-】【+】
    				$("#thediv"+idSuffix).show();
    			}
   			
    		});	
    			
    	}
    
    	//点击【立即购买】后做的操作
 		function showBuyDiv(i){
    		fly(i);
    		$("#addA"+i).click();
    		//隐藏立即购买
 			$("#link"+i).hide();
    		//显示【-】【+】按钮
 			$("#thediv"+i).show();
 		}
    	
    	//当点击减到0的时候，显示【立即购买】按钮
    	function showBuyButton(i){
    		//购买数量
 			var orderCountText = $("#orderCount"+i).text();
    		//如果购买数量减到0
    		if( orderCountText == 1 ){
 	     		//显示立即购买
 	    		$("#link"+i).show();
 	     		//隐藏【-】【+】按钮
 	    		$("#thediv"+i).hide();
    		}
    	}
   //-----------------------------------endByCL-2016/05/18:关于首页商品的【-】【+】【立即购买】的显示和隐藏----------------------------------------------------------------  
	</script>
	

	<script>
    	// 刷新
		window.addEventListener('refresh',function(data){
			showWaiting();
			inti();
		});
		// 手动刷新
		function reload(){
			showWaiting();
			inti();
		}
		
		/**
		 *搜索
		 */
		$('#search').click(function(){
			window.location.href = path + "systemH5/searchController/search";
		});
	</script>
	
	<script type="text/javascript">
		//展示弹窗图片
		$(document).ready(function(){
			
			var isPopup = $("#isPopup").val();
			if( isPopup != 1 ){
				//随页面滚动效果
				document.getElementById("bg").style.height=document.documentElement.scrollHeight+'px';
				document.getElementById("bg").style.display = "block";
				document.getElementById("show").style.display = "block";
				<%session.setAttribute("isPopup", 1);%>
			}
		
		});
		
		//隐藏首页弹窗图片
		function hidePopupImg() {
			document.getElementById("bg").style.display = 'none';
			document.getElementById("show").style.display = 'none';
		}
	</script>
	
		<%-- <!-- 引入微信js -->
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/h5share/shouyeShare.js"></script>
		
		<!-- jsapi配置 -->
		<script type="text/javascript">
			wx.config({
	
			    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	
			    appId: '${appId}', // 必填，公众号的唯一标识
	
			    timestamp: '${timestamp}', // 必填，生成签名的时间戳
	
			    nonceStr: '${nonceStr}', // 必填，生成签名的随机串
	
			    signature: '${signature}',// 必填，签名，见附录1
	
			    jsApiList: ["onMenuShareAppMessage",
			                "onMenuShareTimeline",
			                "onMenuShareQQ",
			                "onMenuShareQZone"
			                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	
			});
		</script> --%>
		<!-- wxApi配置 -->
		<script type="text/javascript" src="<%=basePath %>js/wxApi.js?v=20161020"></script>
		<!-- 微信分享 -->
		<script type="text/javascript">
			$.ajax({
				type : 'POST',
				url : path + 'systemH5/weChatUserController/getShare.do?shareSource=3',
				dataType : 'json',
				success : function(data) {
					if(null != data && data.STATUS == true){
						wxApi.init(function () {
							var shareData = {
								title: data.DATA.title,
								desc: data.DATA.desc,
								link: data.DATA.link,
								imgUrl: data.DATA.imgUrl
							};
							//console.log(shareData);
							wx.onMenuShareAppMessage(shareData);// 监听“分享给朋友”，按钮点击、自定义分享内容及分享结果接口
							wx.onMenuShareTimeline(shareData);// 监听“分享到朋友圈”按钮点击、自定义分享内容及分享结果接口
							wx.onMenuShareQQ(shareData);// 监听“分享到QQ”按钮点击、自定义分享内容及分享结果接口
							wx.onMenuShareQZone(shareData);// 监听“分享到QQ”按钮点击、自定义分享内容及分享结果接口
							wx.onMenuShareWeibo(shareData);// 监听“分享到微博”按钮点击、自定义分享内容及分享结果接口
						});
					} else {
						alert(data.MSG);
					}
				}
			});
		</script>
		
<!-- addByCL-2016/06/08:腾讯云分析 -->
<!-- 勿在此script后面写任何东西 -->		
<script type="text/javascript" src="http://pingjs.qq.com/h5/stats.js" name="MTAH5" sid="500135211" ></script>		
</body>
</html>