package com.xzh.system.controller;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xzh.common.util.AesUtil;
import com.xzh.common.util.DateUtil;
import com.xzh.company.userland.controller.UserController;
import com.xzh.company.userland.utils.CodeUtils;
import com.xzh.system.model.TbBuyer;
import com.xzh.system.model.TbCode;
import com.xzh.system.service.TbBuyerService;
import com.xzh.system.service.TbCodeService;

import net.sf.json.JSONObject;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:WebContent/WEB-INF/config/spring-mvc.xml","file:WebContent/WEB-INF/config/spring-mybatis.xml" })
public class UserControllerTest {
	private Logger logger = Logger.getLogger(UserController.class);
	
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
	public TbCodeService tbCodeService;
	@Autowired
	public TbBuyerService tbBuyerService;
	
	@Test
	public void registerTest(){
		JSONObject bodyJson = new JSONObject();
		JSONObject headerJson = new JSONObject();
		JSONObject returnJson = new JSONObject();
		String returnString = null;
		
		headerJson.put(STATUS, STATUS_SUCCESS);
		headerJson.put(MSG, MSG_SUCCESS);
		
		try {
			String phone = String.valueOf("18651840398");
			String password = String.valueOf(CodeUtils.aesEncrypt("246455"));
			String code = String.valueOf("2464");
			
			if((StringUtils.isBlank(phone)) || (StringUtils.isBlank(password)) || (StringUtils.isBlank(code))){
				bodyJson.put("STATUS", false);
				bodyJson.put("MSG", "请正确填写注册信息！");
				returnJson.put(HEADER, JSONObject.fromObject(headerJson).toString());
				returnJson.put(BODY, AesUtil.encrypt(JSONObject.fromObject(bodyJson).toString(), null));
				returnString = JSONObject.fromObject(returnJson).toString();
				System.out.println(returnString);
				return;
			}
			
			// 验证code
			TbCode tbCode = new TbCode();
			tbCode.setToPhoneEmain(phone);
			tbCode.setCodeValue(code);
			tbCode = tbCodeService.selectByPrimary(tbCode);
			
			if(null == tbCode){
				bodyJson.put("STATUS", false);
				bodyJson.put("MSG", "验证码已过期，请重新获取！");
				returnJson.put(HEADER, JSONObject.fromObject(headerJson).toString());
				returnJson.put(BODY, AesUtil.encrypt(JSONObject.fromObject(bodyJson).toString(), null));
				returnString = JSONObject.fromObject(returnJson).toString();
				System.out.println(returnString);
				return;
			} else {
				Long time = Long.parseLong(tbCode.getCodeOvertime()) - (DateUtil.getTimeInMillis(new Date()));
				if(time <= 0){
					bodyJson.put("STATUS", false);
					bodyJson.put("MSG", "验证码已过期，请重新获取！");
					returnJson.put(HEADER, JSONObject.fromObject(headerJson).toString());
					returnJson.put(BODY, AesUtil.encrypt(JSONObject.fromObject(bodyJson).toString(), null));
					returnString = JSONObject.fromObject(returnJson).toString();
					System.out.println(returnString);
					return;
				} else {
					TbBuyer tbBuyer = new TbBuyer();
					tbBuyer.setPhone(phone);
					TbBuyer buyer = tbBuyerService.selectByPrimary(tbBuyer);
					if(null != buyer){
						bodyJson.put("STATUS", false);
						bodyJson.put("MSG", "您已经注册过了！如有任何疑问，请致电：4008010810");
					} else {
						tbBuyer = new TbBuyer();
						tbBuyer.setBuyerName(phone);
						tbBuyer.setPhone(phone);
						tbBuyer.setPwd(password);
						tbBuyer.setBuyerCode(String.valueOf(DateUtil.getNum(999999)));
						tbBuyer.setBuyerTime(DateUtil.getCurrentDate("yyyy-MM-dd HH:mm:ss"));
						tbBuyer.setIsDelete(Integer.valueOf(1));
						tbBuyer.setIsCompany(1);
						tbBuyer.setDevId("XXOO-001");
						tbBuyer.setBuyerSource("1");
						int result = tbBuyerService.insertSelective(tbBuyer);
						bodyJson.put("STATUS", result > 0 ? true : false);
						bodyJson.put("MSG", result > 0 ? "注册成功！" : "注册失败！");
					}
				}
			}
		} catch (Exception e) {
			headerJson.put(STATUS, STATUS_FALSE);
			headerJson.put(MSG, "接口服务异常！");
			bodyJson.put("STATUS", false);
			bodyJson.put("MSG", "注册失败！");
			e.printStackTrace();
			logger.error(e);
		}
		returnJson.put(HEADER, JSONObject.fromObject(headerJson).toString());
		returnJson.put(BODY, AesUtil.encrypt(JSONObject.fromObject(bodyJson).toString(), null));
		returnString = JSONObject.fromObject(returnJson).toString();
		System.out.println(returnString);
	}
}
