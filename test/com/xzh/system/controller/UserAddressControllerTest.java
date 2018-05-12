package com.xzh.system.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xzh.common.intercept.PageParameter;
import com.xzh.common.util.AesUtil;
import com.xzh.system.model.TbBuyerAddress;
import com.xzh.system.service.TbBuyerAddressService;

import net.sf.json.JSONObject;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:WebContent/WEB-INF/config/spring-mvc.xml","file:WebContent/WEB-INF/config/spring-mybatis.xml" })
public class UserAddressControllerTest {
	private Logger logger = Logger.getLogger(NotifyController.class);
	
	protected static final String BODY = "body";
	protected static final String HEADER = "header";
	
	protected static final String RETRUNDATA = "returnData";

	protected static final String STATUS = "retStatus";
	protected static final String STATUS_SUCCESS = "0";
	protected static final String STATUS_FALSE = "1";

	protected static final String MSG = "retMessage";
	protected static final String MSG_SUCCESS = "操作成功";
	protected static final String MSG_FALSE = "操作失败";
	
	@Autowired
	private TbBuyerAddressService tbBuyerAddressService;
	
	@Test
	public void getAddressTest(){
		JSONObject bodyJson = new JSONObject();
		JSONObject headerJson = new JSONObject();
		JSONObject returnJson = new JSONObject();
		
		headerJson.put(STATUS, STATUS_SUCCESS);
		headerJson.put(MSG, MSG_SUCCESS);
		try {
			TbBuyerAddress address = new TbBuyerAddress();
			address.setBuyerId(Integer.valueOf(String.valueOf(10532)));
			PageParameter pageParameter = new PageParameter();
			pageParameter.setCurrentPage(null == null ? 1 : 1);
			pageParameter.setPageSize(null == null ? 10 : 10);
			List<TbBuyerAddress> list = tbBuyerAddressService.selectBuyAddressList(address);
			bodyJson.put("STATUS", true);
			bodyJson.put(RETRUNDATA, list);
			bodyJson.put("TOTALPAGE", pageParameter.getTotalPage());
			bodyJson.put("TOTALCOUNT", pageParameter.getTotalCount());
			bodyJson.put("CURRENTPAGE", pageParameter.getCurrentPage());
		} catch (Exception e) {
			headerJson.put(STATUS, STATUS_FALSE);
			headerJson.put(MSG, MSG_FALSE);
			bodyJson.put("STATUS", false);
			bodyJson.put("MSG", MSG_FALSE);
			e.printStackTrace();
			logger.error("UserAddressController.getAddress" + e);
		}
		returnJson.put(HEADER, JSONObject.fromObject(headerJson).toString());
		returnJson.put(BODY, AesUtil.encrypt(JSONObject.fromObject(bodyJson).toString(), null));
		String returnString = JSONObject.fromObject(returnJson).toString();
		System.out.println(returnString);
	}
	
	@Test
	public void addAddressTest(){
		JSONObject bodyJson = new JSONObject();
		JSONObject headerJson = new JSONObject();
		JSONObject returnJson = new JSONObject();
		
		headerJson.put(STATUS, STATUS_SUCCESS);
		headerJson.put(MSG, MSG_SUCCESS);
		
		try {
			TbBuyerAddress address = new TbBuyerAddress();
			address.setAddressUser("杨帆");
			address.setAddressPhone("18651840387");
			address.setUserSex(String.valueOf(1));
			address.setFlag(2);
			
			address.setAddressDes("企业版测试");
			address.setBuyerId(10532);

			address.setIsMoren("0");
			address.setIsDelete(1);
			int result =  tbBuyerAddressService.addBuyerAddress(address);
			bodyJson.put("STATUS", result > 0 ? true : false);
			bodyJson.put("MSG", result > 0 ? "收货地址添加成功！" : "收货地址添加失败！");
		} catch (Exception e) {
			headerJson.put(STATUS, STATUS_FALSE);
			headerJson.put(MSG, MSG_FALSE);
			bodyJson.put("STATUS", false);
			bodyJson.put("MSG", "收货地址添加失败！ERROR-0001");
			e.printStackTrace();
			logger.error("UserAddressController.addAddress" + e);
		}
		returnJson.put(HEADER, JSONObject.fromObject(headerJson).toString());
		returnJson.put(BODY, AesUtil.encrypt(JSONObject.fromObject(bodyJson).toString(), null));
		String returnString = JSONObject.fromObject(returnJson).toString();
		System.out.println(returnString);
	}
	
	@Test
	public void updateAddressTest(){
		JSONObject bodyJson = new JSONObject();
		JSONObject headerJson = new JSONObject();
		JSONObject returnJson = new JSONObject();
		
		headerJson.put(STATUS, STATUS_SUCCESS);
		headerJson.put(MSG, MSG_SUCCESS);
		
		try {
			TbBuyerAddress address = new TbBuyerAddress();
			address.setAddressUser("杨帆");
			address.setAddressPhone("18651840387");
			address.setUserSex("1");
			address.setAddressDes("企业版测1");
			address.setAddressId(12921);
			address.setFlag(2);
			int result = tbBuyerAddressService.updateBuyerAddress(address);
			bodyJson.put("STATUS", result > 0 ? true : false);
			bodyJson.put("MSG", result > 0 ? "收货地址更新成功！" : "收货地址更新失败！");
		} catch (Exception e) {
			headerJson.put(STATUS, STATUS_FALSE);
			headerJson.put(MSG, MSG_FALSE);
			bodyJson.put("STATUS", false);
			bodyJson.put("MSG", "收货地址更新失败！ERROR-0002");
			e.printStackTrace();
			logger.error("UserAddressController.updateAddress" + e);
		}
		returnJson.put(HEADER, JSONObject.fromObject(headerJson).toString());
		returnJson.put(BODY, AesUtil.encrypt(JSONObject.fromObject(bodyJson).toString(), null));
		String returnString = JSONObject.fromObject(returnJson).toString();
		System.out.println(returnString);
	}
	
	@Test
	public void deleteAddressTest(){
		JSONObject bodyJson = new JSONObject();
		JSONObject headerJson = new JSONObject();
		JSONObject returnJson = new JSONObject();
		
		headerJson.put(STATUS, STATUS_SUCCESS);
		headerJson.put(MSG, MSG_SUCCESS);
		
		try {
			TbBuyerAddress address = new TbBuyerAddress();
			address.setAddressId(12921);
			int result = tbBuyerAddressService.delBuyerAddress(address);
			
			bodyJson.put("STATUS", result > 0 ? true : false);
			bodyJson.put("MSG", result > 0 ? "收货地址删除成功！" : "收货地址删除失败！");
		} catch (Exception e) {
			headerJson.put(STATUS, STATUS_FALSE);
			headerJson.put(MSG, MSG_FALSE);
			bodyJson.put("STATUS", false);
			bodyJson.put("MSG", "收货地址删除失败！ERROR-0003");
			e.printStackTrace();
			logger.error("UserAddressController.deleteAddress" + e);
		}
		returnJson.put(HEADER, JSONObject.fromObject(headerJson).toString());
		returnJson.put(BODY, AesUtil.encrypt(JSONObject.fromObject(bodyJson).toString(), null));
		String returnString = JSONObject.fromObject(returnJson).toString();
		System.out.println(returnString);
	}
}
