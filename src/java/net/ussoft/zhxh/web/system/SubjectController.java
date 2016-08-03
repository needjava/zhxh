package net.ussoft.zhxh.web.system;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.ussoft.zhxh.base.BaseConstroller;
import net.ussoft.zhxh.model.Public_content;
import net.ussoft.zhxh.service.IPublicContentService;
import net.ussoft.zhxh.util.FileOperate;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;

/**
 * 专题
 * @author guodh
 * */
@Controller
@RequestMapping(value="subject")
public class SubjectController extends BaseConstroller{

	@Resource
	IPublicContentService contentService;
	
	private String PARENTID = "zt";
	private String PARENTTYPE = "zt";
	/**
	 * 首页轮播图列表
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	public void list(HttpServletResponse response) throws IOException {
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		List<Public_content> list = contentService.list(PARENTID,PARENTTYPE);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("total", list.size());
		map.put("data", list);
		
		String json = JSON.toJSONString(map);
		out.print(json);
	}
	
	/**
	 * 保存
	 * @param objs
	 * @param response
	 * @throws IOException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public void save(String objs,HttpServletResponse response) throws IOException, IllegalAccessException, InvocationTargetException {
		
		response.setContentType("text/xml;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String result = "success";
		
		if ("".equals(objs) || objs == null) {
			out.print(result);
			return;
		}
		
		//
		List<Map<String, String>> rows = (List<Map<String, String>>) JSON.parse(objs);
		
		for(int i=0,l=rows.size(); i<l; i++){
			Map<String,String> row = (Map<String,String>)rows.get(i);
	  		  
			String id = row.get("id") != null ? row.get("id").toString() : "";
	        String state = row.get("_state") != null ? row.get("_state").toString() : "";
	        //新增：id为空，或_state为added
	        if(state.equals("added") || id.equals("")) {
	        	insert(row);
	        }
	        else if (state.equals("removed") || state.equals("deleted")) {
	        	System.out.println("pic_path="+row.get("pic_path"));
	        	String pic_path = row.get("pic_path");
	        	boolean flag = delete(id);
	        	if(flag){
	        		FileOperate.delFile(super.getProjectRealPath() + pic_path);
	        	}
	        }
	        //更新：_state为空，或modified
	        else if (state.equals("modified") || state.equals(""))	 {
	            update(row);
	        }
	    }
		out.print(result);
	}
	
	private boolean insert(Map<String,String> row) throws IllegalAccessException, InvocationTargetException {
		if (null == row) {
			return false;
		}
		Public_content content = new Public_content();
		BeanUtils.populate(content, row);
		
		content.setId(UUID.randomUUID().toString());
		content.setParentid(PARENTID);
		content.setParenttype(PARENTTYPE);
		
		content = contentService.insert(content);
		return true;
	}
	
	/**
	 * 删除。
	 * @param id
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private boolean delete(String id) throws IOException {
		
		if (id == null || id.equals("") ) {
			return false;
		}
		int num = contentService.delete(id);
		
		if (num <= 0 ) {
			return false;
		}
		return true;
	}
	/**
	 * 更新
	 * @param row
	 * @return
	 * @throws IOException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	private boolean update(Map<String,String> row) throws IOException, IllegalAccessException, InvocationTargetException {
		
		if (null == row) {
			return false;
		}
		Public_content pic = new Public_content();
		BeanUtils.populate(pic, row);
		
		int num = contentService.update(pic);
		
		if (num <= 0 ) {
			return false;
		}
		return true;
	}
	
}