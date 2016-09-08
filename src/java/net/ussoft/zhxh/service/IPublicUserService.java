package net.ussoft.zhxh.service;

import java.util.List;
import java.util.Map;

import net.ussoft.zhxh.model.PageBean;
import net.ussoft.zhxh.model.Public_user;

/**
 * 用户管理
 * @author guodh
 * @version v1.0 2016.07.27
 * */
public interface IPublicUserService {

	/**
	 * 根据ID获取对象
	 * @param id
	 * @return Public_user
	 * */
	public Public_user getById(String id);
	
	/**
	 * 根据手机号获取对象
	 * @return list
	 * */
	public Public_user getByPhoneNum(String phoneNum);
	
	/**
	 * 查询所有
	 * @return list
	 * */
	public List<Public_user> list();
	
	/**
	 * 个人中心关联关系查询
	 * @param parentid
	 * @param pageBean
	 * @return
	 * */
	public PageBean<Public_user> listByParentid(String parentid,PageBean<Public_user> pageBean);
	
	/**
	 * 条件查询 分页
	 * */
	public PageBean<Public_user> list(Map<String, Object> map,PageBean<Public_user> pageBean);
	
	/**
	 * 查询所有 分页
	 * @param pageBean
	 * @return list
	 * */
	public PageBean<Public_user> list(String key,PageBean<Public_user> pageBean);
	
	/**
	 * 添加
	 * @param Public_user
	 * @return 
	 * */
	public Public_user insert(Public_user user);
	
	/**
	 * 添加 - 代理、店
	 * @param Public_user
	 * @param parentid
	 * @return 
	 * */
	public Public_user insert(Public_user user,String parentid);
	
	/**
	 * 修改
	 * @param Public_user
	 * @return 
	 * */
	public int update(Public_user user);
	
	/**
	 * 修改其上级机构
	 * @param id
	 * @param oldparentid
	 * @param newparentid
	 * @return 
	 * */
	public int updateParent(String id,String oldparentid,String newparentid);
	
	/**
	 * 代理添加店-创建关联关系
	 * @param userid
	 * @param parentid
	 * @return
	 * */
	public int createlink(String userid,String parentid);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 * */
	public int delete(String id);
	
	/**
	 * 验证手机号是否已存在
	 * @param phoneNum
	 * @return true:存在；false:不存在
	 * */
	public boolean checkPhoneNum(String phoneNum);
	
	/**
	 * 登录验证密码
	 * @param userame
	 * @param password
	 * */
	public Public_user login(String username,String password);
	
}
