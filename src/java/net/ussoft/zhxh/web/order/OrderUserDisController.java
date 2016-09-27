package net.ussoft.zhxh.web.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;

import net.ussoft.zhxh.base.BaseConstroller;
import net.ussoft.zhxh.model.PageBean;
import net.ussoft.zhxh.model.Public_brand;
import net.ussoft.zhxh.model.Public_product_size;
import net.ussoft.zhxh.service.IPublicPhoneCodeLogService;
import net.ussoft.zhxh.service.IPublicUser2Service;
import net.ussoft.zhxh.service.IPublicUserLinkService;

/**
 * 机构利益处理active
 * @author wangf
 *
 */

@Controller
@RequestMapping("/orderUserDis")
public class OrderUserDisController extends BaseConstroller {
	
	@Resource
	private IPublicUser2Service userService;
	@Resource
	private IPublicUserLinkService userlinkService;	//个人中心关联关系
	@Resource
	private IPublicPhoneCodeLogService codeLogService;
	
	/**
	 * 获取机构能操作的品牌
	 * @param parentid
	 * @param userid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/listUserBrand",method=RequestMethod.POST)
	public void listUserBrand(String parentid,String userid,String brandname,int pageIndex,int pageSize,
			@RequestParam(value="isPage", defaultValue="false") boolean isPage,HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		PageBean<Public_brand> p = new PageBean<>();
		if (isPage) {
			p.setPageSize(pageSize);
			p.setPageNo(pageIndex + 1);
		}
		else {
			p.setIsPage(false);
		}
		
		p = userService.list_user_brand(parentid, userid,brandname,p);
		
		map.put("total", p.getRowCount());
		map.put("data", p.getList());
		
		String json = JSON.toJSONString(map);
		out.print(json);
	}
	
	/**
	 * 获取客户的采购利益分配标准
	 * @param parentid
	 * @param userid
	 * @param brandid
	 * @param pageIndex
	 * @param pageSize
	 * @param isPage
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/listUserStandard",method=RequestMethod.POST)
	public void listUserStandard(String parentid,String userid,String brandid,int pageIndex,int pageSize,
			@RequestParam(value="isPage", defaultValue="false") boolean isPage,HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		PageBean<Map<String,Object>> p = new PageBean<Map<String,Object>>();
		if (isPage) {
			p.setPageSize(pageSize);
			p.setPageNo(pageIndex + 1);
		}
		else {
			p.setIsPage(false);
		}
		
		p = userService.listUserStandard(parentid, userid, brandid, "", "", "", p);
		
//		List<Map<String, Object>> userStandardList = userService.listUserStandard(parentid, userid,productid,"","");
		
//		map.put("total", userStandardList.size());
//		map.put("data", userStandardList);
		map.put("total", p.getRowCount());
		map.put("data", p.getList());
		
		String json = JSON.toJSONString(map);
		out.print(json);
	}
	
	/**
	 * 获取机构能操作的品牌，分配给客户
	 * @param parentid
	 * @param userid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/selUserBrand",method=RequestMethod.POST)
	public void selUserBrand(String parentid,String userid,HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		List<Public_brand> userBrand = userService.list_select_brand(parentid, userid);
		
		map.put("total", userBrand.size());
		map.put("data", userBrand);
		
		String json = JSON.toJSONString(map);
		out.print(json);
	}
	
	/**
	 * 保存机构的品牌对应
	 * @param brandids		选择的品牌id集合
	 * @param parentid		设置者
	 * @param userid		被设置者
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/saveUserBrand",method=RequestMethod.POST)
	public void saveUserBrand(String brandids,String parentid,String userid,HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		userService.saveUserBrand(brandids,parentid, userid);
		
		out.print("success");
	}
	
	/**
	 * 删除客户能采购的品牌
	 * @param parentid
	 * @param userid
	 * @param brandid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/delUserBrand",method=RequestMethod.POST)
	public void delUserBrand(String parentid,String userid,String brandid,HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		userService.delUserBrand(parentid, userid,brandid);
		
		out.print("success");
	}
	
	/**
	 * 为机构选择规格
	 * @param parentid
	 * @param userid
	 * @param productid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/listSelectSize",method=RequestMethod.POST)
	public void listSelectSize(String parentid,String userid,String brandid,int pageIndex,int pageSize,
			@RequestParam(value="isPage", defaultValue="false") boolean isPage,HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		PageBean<Public_product_size> p = new PageBean<Public_product_size>();
		if (isPage) {
			p.setPageSize(pageSize);
			p.setPageNo(pageIndex + 1);
		}
		else {
			p.setIsPage(false);
		}
		
		PageBean<Public_product_size> sizeList = userService.list_select_size(parentid, userid,brandid,null,p);
		
		map.put("total", sizeList.getRowCount());
		map.put("data", sizeList.getList());
		
		String json = JSON.toJSONString(map);
		out.print(json);
	}
	
	/**
	 * 保存机构对应的规格采购标准
	 * @param brandid		品牌id
	 * @param productid		商品id
	 * @param sizeids		选择的sizeid集合
	 * @param parentid		设置者
	 * @param userid		被设置者
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/saveUserSizeStandard",method=RequestMethod.POST)
	public void saveUserSizeStandard(String brandid,String sizeids,String parentid,String userid,HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		userService.saveUserSizeStandard(brandid, null, sizeids, parentid, userid);
		
		out.print("success");
	}
	
	/**
	 * 根据选择的采购利益标准id，删除
	 * @param ids
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/delUserStandard",method=RequestMethod.POST)
	public void delUserStandard(String ids,HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		userService.delUserStandard(ids);
		
		out.print("success");
	}
	
	/**
	 * 按采购标准id，批量更新
	 * @param ids
	 * @param updateKey
	 * @param updateValue
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/updateUserSizeStandard",method=RequestMethod.POST)
	public void updateUserSizeStandard(String ids, String updateKey, String updateValue,HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		userService.updateUserSizeStandard(ids, updateKey, updateValue);
		
		out.print("success");
	}
	
	
	
	
	
}
