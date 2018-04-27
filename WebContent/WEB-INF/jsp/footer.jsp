<!--底部-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>

	.Shopping-Cart2{
        position: fixed;
        bottom: 0.2rem;
        right: 2.7rem;              /*新添加模块修改处*/
      }  
	
	.Shopping-Cart2 img {
		width: 1rem;
		height: 1.02rem;
	}
	
	.Shopping{
        	width: 0.3rem;
        	height: 0.3rem;
        	background: #fd4d2c;
        	border-radius: 10px;
            position: absolute;
            top: 1px;
           /*  left:71%; */              /*新添加模块修改处*/
            text-align: center;
            color: #fff;
            font-size: 0.18rem;
            line-height: 0.28rem;   /*新修改*/
        }
        
	footer ul li p{
		color: #fd4d2c;
	}
	footer ul li{
		width: 25%;
        float: left;
        text-align: center;
	}
	footer ul li img {
	    width: 0.4rem;
	    height: 0.4rem;
	    margin: 0 auto;
	    margin-bottom: 0.05rem;
    }
	footer ul li a{
		color: #333;
      	font-weight: normal;
	}
	footer ul li a:hover{
		color: #fd4d2c;
	}
	
</style>

<!-- 页面最底部按钮公用页 -->
<footer>
	<ul>
		<%-- <li><a href="<%=basePath%>systemH5/shouYe" />
			<img src="<%=basePath%>img/HomePage_Selected.png" />首页</a>
		</li>
		
		<li><a href='<%=basePath%>systemH5/bcpjc.do?gcLevel=1&gcCf=1' />
			<img src="<%=basePath%>img/sort_Unselected副本.png" />分类</a>
		</li>
		
		<li><a href="<%=basePath%>systemH5/mine" />
			<img src="<%=basePath%>img/mine_Unselected副本.png" />我的</a>
		</li> --%>
		<%
			String footerChannel=(String)session.getAttribute("footerChannel");
			if("shouye".equals(footerChannel)){
		%>
			<li>
				<a href="<%=basePath%>systemH5/shouYe">
					<img src="<%=basePath%>img/HomePage_Selected.png" /><p>首页</p>
				</a>
			</li>
			<li>
<%-- 				<a href='<%=basePath%>systemH5/bcpjc.do?gcLevel=1&gcCf=1' > --%>
				
				<a href='<%=basePath%>systemH5/bcpjc.do?gcLevel=1&gcCf=1&sortType=10' >
					<img src="<%=basePath%>img/sort_Unselected副本.png" />分类
				</a>
			</li>
			
			<!--新添加购物车-->
			<li>
				<a href="javascript:void(0);" onclick="showShoppingCart()">
					<img src="<%=basePath%>img/shoppingCart.png" />购物车
					<span class="Shopping head-shopcart" id="carValue">${carValue}</span>
				</a>
			</li>
		
			<li>
				<a href="<%=basePath%>systemH5/mine" >
					<img src="<%=basePath%>img/mine_Unselected副本.png" />我的
				</a>
			</li>
		<%		
			} else if ("bcpjc".equals(footerChannel)){
		%>
			<li>
				<a href="<%=basePath%>systemH5/shouYe">
					<img src="<%=basePath%>img/HomePage_Unselected副本.png" />首页
				</a>
			</li>
			<li>
<%-- 				<a href='<%=basePath%>systemH5/bcpjc.do?gcLevel=1&gcCf=1' > --%>
					<a href='<%=basePath%>systemH5/bcpjc.do?gcLevel=1&gcCf=1&sortType=10' >
					<img src="<%=basePath%>img/sort_Selected副本.png" /><p>分类</p>
				</a>
			</li>
			
			<!--新添加购物车-->
			<li>
				<a href="javascript:void(0);" onclick="showShoppingCart()">
					<img src="<%=basePath%>img/shoppingCart.png" />购物车
					<span class="Shopping head-shopcart" id="carValue">${carValue}</span>
				</a>
			</li>
		
			<li>
				<a href="<%=basePath%>systemH5/mine" >
					<img src="<%=basePath%>img/mine_Unselected副本.png" />我的
				</a>
			</li>
			
			
			
		<%		
			} else if ("mine".equals(footerChannel)){
		%>
			<li>
				<a href="<%=basePath%>systemH5/shouYe">
					<img src="<%=basePath%>img/HomePage_Unselected副本.png" />首页
				</a>
			</li>
			<li>
<%-- 				<a href='<%=basePath%>systemH5/bcpjc.do?gcLevel=1&gcCf=1' > --%>
					<a href='<%=basePath%>systemH5/bcpjc.do?gcLevel=1&gcCf=1&sortType=10' >
					<img src="<%=basePath%>img/sort_Unselected副本.png" />分类
				</a>
			</li>
			
			<!--新添加购物车-->
			<li>
				<a href="javascript:void(0);" onclick="showShoppingCart()">
					<img src="<%=basePath%>img/shoppingCart.png" />购物车
					<span class="Shopping head-shopcart" id="carValue" style="right: 32.3%;">${carValue}</span>
				</a>
			</li>
		
			<li>
				<a href="<%=basePath%>systemH5/mine" >
					<img src="<%=basePath%>img/mine_Selected副本.png" /><p>我的</p>
				</a>
			</li>
		<%		
			}
		%>
	</ul>
</footer>

<!-- 购物车悬浮-->
<%-- <div class="Shopping-Cart2">
	<a href="javascript:void(0);" onclick="showSharePage()">
		<img src="<%=basePath%>img/yaohaoyou.png" />	
	</a>
</div> --%>



