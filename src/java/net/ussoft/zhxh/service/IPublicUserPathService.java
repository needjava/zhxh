package net.ussoft.zhxh.service;

import java.util.List;

import net.ussoft.zhxh.model.PageBean;
import net.ussoft.zhxh.model.Public_user_path;

/**
 * 个人地址
 * @author guodh
 * @version v1.0 2016.07.27
 * */
public interface IPublicUserPathService {

	/**
	 * 根据ID获取对象
	 * @param id
	 * @return Public_user_path
	 * */
	public Public_user_path getById(String id);
	
	/**
	 * 查询所有
	 * @return list
	 * */
	public List<Public_user_path> list();
	
	/**
	 * 查询所有 分页
	 * @param pageBean
	 * @return list
	 * */
	public List<Public_user_path> list(PageBean<Public_user_path> pageBean);
	
	/**
	 * 添加
	 * @param Public_user_path
	 * @return 
	 * */
	public int update(Public_user_path userPath);
	
	/**
	 * 添加
	 * @param id
	 * @return
	 * */
	public int delete(String id);
}
