package net.ussoft.zhxh.service;

import java.util.List;
import java.util.Map;

import net.ussoft.zhxh.model.PageBean;
import net.ussoft.zhxh.model.Public_product_size;

/**
 * 商品规格
 * @author guodh
 * @version v1.0 2016.07.27
 * */
public interface IPublicProductSizeService {

	/**
	 * 根据ID获取对象
	 * @param id
	 * @return Public_product_size
	 * */
	public Public_product_size getById(String id);
	
	/**
	 * 查询所有 ids
	 * @return list
	 * */
	public List<Public_product_size> getByIds(List<String> ids);
	
	
	/**
	 * 查询所有
	 * @return list
	 * */
	public List<Public_product_size> list(String parentid);
	
	/**
	 * 查询所有 
	 * @return list
	 * */
	public List<Public_product_size> list(Map<String, Object> map);
	
	/**
	 * 查询所有 分页
	 * @param pageBean
	 * @return list
	 * */
	public PageBean<Public_product_size> list(PageBean<Public_product_size> pageBean,String parentid);
	
	/**
	 * 添加
	 * @param Public_product_size
	 * @return 
	 * */
	public Public_product_size insert(Public_product_size product_size);
	
	/**
	 * 修改
	 * @param Public_product_size
	 * @return 
	 * */
	public int update(Public_product_size product_size);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 * */
	public int delete(String id,String realPath);
	
	/**
	 * 克隆一个新的商品规格
	 * @param cloneid
	 * @return
	 */
	public boolean cloneSize(String cloneid,String realPath);
}
