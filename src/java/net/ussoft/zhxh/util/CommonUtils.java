package net.ussoft.zhxh.util;


import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public class CommonUtils {
	
	public static void main(String[] args) throws Exception {
		
	}
	
	public CommonUtils() {
		
	}

	private final static Logger log = new Logger(CommonUtils.class);
    private static final String DATE_STYLE = "yyyy-MM-dd";
    private static final String TIME_STYLE = "yyyy-MM-dd HH:mm:ss";

    public static String getMACAddress() throws Exception {
		InputStream in = null;
		String message = null;
		try {
			java.lang.Process proc = Runtime.getRuntime().exec("ipconfig /all");
			in = proc.getInputStream();
			byte[] data = new byte[2048];
			in.read(data);
			String netdata = new String(data);
			log.debug(netdata);
			return procAll(netdata);
		} catch (IOException e) {
			e.printStackTrace();
			message = e.getMessage();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		throw new Exception("异常错误：" + message + "，导致无法获取MAC地址");
	}

	private static String procAll(String str) {
		return procStringEnd(procFirstMac(procAddress(str)));
	}

	private static String procAddress(String str) {
		int indexof = str.indexOf("Physical Address");
		if (indexof > 0) {
			return str.substring(indexof, str.length());
		}
		return str;
	}

	private static String procFirstMac(String str) {
		int indexof = str.indexOf(":");
		if (indexof > 0) {
			return str.substring(indexof + 1, str.length()).trim();
		}
		return str;
	}

	private static String procStringEnd(String str) {
		int indexof = str.indexOf("\r");
		if (indexof > 0) {
			return str.substring(0, indexof).trim();
		}
		return str;
	}

	/**
	 * 
	 * @param request
	 *            HttpServletRequest
	 */
	public static void parameter2Attribute(HttpServletRequest request) {
		Enumeration enu = request.getParameterNames();
		if (enu != null) {
			String key = null;
			String value = null;
			StringBuffer strBuf = new StringBuffer("Parameter contents:");
			int i = 0;
			while (enu.hasMoreElements()) {
				key = (String) enu.nextElement();
				value = request.getParameter(key);
				strBuf.append("\n  " + (++i) + ") name=" + key + "; value=" + value);
				if (value != null) {
					strBuf.append(";type=" + value.getClass().getName());
				}
				request.setAttribute(key, value);
			}
			logger.info(strBuf.toString());
		}
	}

	private static Logger logger = new Logger("BaseUtil");

	/**
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param name
	 *            String
	 * @return Object
	 */
	public static Object getSessionAttribute(HttpServletRequest request, String name) {
		logger.info("Getting " + name + " from session.");
		Object obj = null;
		HttpSession session = request.getSession(false);
		if (session != null) {
			obj = session.getAttribute(name);
		}
		return obj;

	}

	public static void setSessionAttribute(HttpServletRequest request, String name, Object value) {
		logger.info("Setting " + name + " of type " + value.getClass().getName() + " on session.");
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.setAttribute(name, value);
		}
	}

	public static void removeSessionAttribute(HttpServletRequest request, String name) {
		logger.info("Removing " + name + " from session.");
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute(name);
		}
	}

	/**
	 * 
	 * @param req
	 *            HttpServletRequest
	 */
	public static void printRequestAttributeContents(HttpServletRequest req) {
		Enumeration enu = req.getAttributeNames();
		StringBuffer strBuf = new StringBuffer("Attribute contents:");
		int i = 0;
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			Object obj = req.getAttribute(name);
			strBuf.append("\n  " + (++i) + ") name=" + name + "; value=" + obj);
			if (obj != null) {
				strBuf.append(";type=" + obj.getClass().getName());
			}
		}
		logger.info(strBuf.toString());
	}

	/**
	 * 
	 * @param temp
	 * @return
	 */
	public static String filterString(String temp) {
		if (temp == null) {
			return null;
		}
		return temp.replaceAll("'", "''");
	}

	/**
	 * 
	 * @param req
	 *            HttpServletRequest
	 */
	public static void printSessionContents(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			Enumeration enu = session.getAttributeNames();
			StringBuffer strBuf = new StringBuffer("Session contents:");
			int i = 0;
			while (enu.hasMoreElements()) {
				String name = (String) enu.nextElement();
				Object obj = session.getAttribute(name);
				strBuf.append("\n  " + (++i) + ") name=" + name + "; value=" + obj);
				if (obj != null) {
					strBuf.append(";type=" + obj.getClass().getName());
				}
			}
			logger.info(strBuf.toString());
		}
	}

	public static void closeResultSet(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void closeStatement(Statement st) {
		if (st != null) {
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void closeConnection(Connection con) {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
    public static String replaceNull2Space(String s) {
        if (s == null)
            return "";
        if (s.trim().toUpperCase().equals("NULL"))
            return "";
        return s.trim();
    }
	public static void closeStream(Closeable stream) {
		if (stream != null)
			try {
				stream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
	}

	/**
	 * 判断是否为数字
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isNumber(String value) {
		if (value != null && value.trim().length() > 0) {
			Pattern pattern = Pattern.compile("^[+-]?\\d*[.]?\\d*$");
			return pattern.matcher(value).matches();
		}
		return false;
	}

    public static boolean  isPdfPrintType(String filename){
        boolean flag = false;
        filename = filename.toLowerCase();
        if(filename.endsWith(".doc")) flag = true;
        if(filename.endsWith(".docx")) flag = true;
        if(filename.endsWith(".ppt")) flag = true;
        if(filename.endsWith(".pptx")) flag = true;
        if(filename.endsWith(".xls")) flag = true;
        if(filename.endsWith(".xlsx")) flag = true;
       return  flag;
    }

    /**
     * 日期型时间转换为字符串
     * @param dt
     * @return
     */
    public static String Time2String(Date dt) {
        if (dt == null)
            return "";
        SimpleDateFormat sdf = new SimpleDateFormat(TIME_STYLE);
        try {
            return sdf.format(dt);
        } catch (Exception ex) {
            log.error("==ComUtil:Time2String==：" + ex);
            return "";
        }
    }
    /**
     *	获取应用服务器系统日期、时间
     *	@return	日期+时间字符串。格式“yyyy-mm-dd hh:mm:ss”
     */
    public static  String getTimeStamp() {
        return Time2String(new Date());
    }

    /**
     * 转换文件大小单位 将字节转换为K M G
     * @param fileS
     * @return
     */
    public static String formatFileSize(long fileS) {//转换文件大小
        DecimalFormat df = new DecimalFormat("#.00");
        String fileSizeString = "";
        if (fileS < 1024) {
            fileSizeString = df.format((double) fileS) + "B";
        } else if (fileS < 1048576) {
            fileSizeString = df.format((double) fileS / 1024) + "K";
        } else if (fileS < 1073741824) {
            fileSizeString = df.format((double) fileS / 1048576) + "M";
        } else {
            fileSizeString = df.format((double) fileS / 1073741824) + "G";
        }
        return fileSizeString;
    }


    /**集合对象都不为NULL并且不为空("")
	 * @param objs
	 * @return
	 */
	public static boolean isNotNullAndEmpty(Object... objs){
		if(CommonUtils.isNotEqNull(objs)&&CommonUtils.isNotEqEmpty(objs)){return true;}
		return false;
	}
	/**集合所有对象不为NULL,则返回真,否则返回假
	 * @param objs
	 * @return
	 */
	public static boolean isNotEqNull(Object[] objs){
		for (Object object : objs) {
			return isNotEqNull(object);
		}
		return  true;
	}
	/**对象不为NULL,则返回真,否则返回假
	 * @param obj
	 * @return
	 */
	public static boolean isNotEqNull(Object obj){
		if(obj==null)return false;return  true;
	}
	/**集合所有对象不为空(""),则返回真,否则返回假     (NULL!="")
	 * @param objs
	 * @return
	 */
	public static boolean isNotEqEmpty(Object[] objs){
		for (Object object : objs) {
			return isNotEqEmpty(object);
		}
		return  true;
	}
	
	/**对象不为空(""),则返回真,否则返回假     (NULL!="")
	 * @param obj
	 * @return
	 */
	public static boolean isNotEqEmpty(Object obj){
		if("".equals(obj.toString())){return false;}return  true;
	}
	
	/**
	 * 删除指定的字符在最后的位置
	 * @param sb
	 * @param str
	 */
    public static void deleteLastStr(StringBuilder sb,String str){
		int index = sb.lastIndexOf(str);
		if(index!=-1){
			sb.delete(index, index+str.length());
		}
	}
    
    /**
     * List转换String
     * 
     * @param list :需要转换的List
     * @param sep1 :分隔符
     * @return String转换后的字符串
     */ 
    public static String ListToString(List<?> list,String SEP1) { 
        StringBuffer sb = new StringBuffer(); 
        if (list != null && list.size() > 0) { 
            for (int i = 0; i < list.size(); i++) { 
                if (list.get(i) == null || list.get(i) == "") { 
                    continue; 
                } 
                // 如果值是list类型则调用自己 
                if (list.get(i) instanceof List) { 
                    sb.append(ListToString((List<?>) list.get(i), SEP1)); 
                    sb.append(SEP1); 
                } else { 
                    sb.append(list.get(i)); 
                    sb.append(SEP1); 
                } 
            } 
        }
        String result = sb.toString();
        result = result.substring(0, result.length()-1);
        return result; 
    }
    
    
    /**
     * 将元数据前补零，补后的总长度为指定的长度，以字符串的形式返回
     * @param sourceDate 
     * @param formatLength 
     * @return 重组后的数据 
     */  
    public static String frontCompWithZore(int sourceDate,int formatLength)  
    {  
     /* 
      * 0 指前面补充零 
      * formatLength 字符总长度为 formatLength 
      * d 代表为正数。 
      */  
	     String newString = String.format("%0"+formatLength+"d", sourceDate);  
	     return  newString;  
    } 
    
    /**
	 * 上传文件公共方法（form提交方式上传）。仅将文件保存到服务器，返回map文件的基本属性。
	 * @param file				文件流
	 * @param saveFolder		保存的目录
	 * @return
	 * @throws IOException
	 */
	public static HashMap<String,String> toinsert_file(@RequestParam("file") MultipartFile file,String saveFolder,HttpServletRequest request) throws IOException {
		
		String uuidString = "";
		String newName = "";
		String oldName = "";
		String newFilePath = "";
		String path = "";
		
		String filePath = "";
		
		HashMap<String,String> resultMap = new HashMap<String,String>(); 
		
        int size = file.getInputStream().available();
		if (size != 0) {
			if (null != saveFolder && !"".equals(saveFolder)) {
				path = request.getSession().getServletContext().getRealPath("/file/" + saveFolder);
				filePath = "file/" + saveFolder + "/";
			}
			else {
				path = request.getSession().getServletContext().getRealPath("/file");
				filePath = "file/";
			}
			
			FileOperate.isExist(path);
			
	        String ext = "";//扩展名
	        
	        oldName = file.getOriginalFilename();
	        //获取扩展名
	        if (oldName.lastIndexOf(".") >= 0) {
	            ext = oldName.substring(oldName.lastIndexOf("."));
	            ext = ext.toLowerCase();
	        }
	        
	        uuidString = UUID.randomUUID().toString();
	        newName = uuidString + ext;
	        newFilePath = path + "/" + newName;
	        File excFile = new File(newFilePath);
	        FileCopyUtils.copy(file.getBytes(),excFile);
	        
	        resultMap.put("oldname", oldName);
	        resultMap.put("ext", ext);
	        resultMap.put("newname", newName);
	        resultMap.put("filepath", filePath);
	        resultMap.put("uuidString", uuidString);
		}
		
		return resultMap;
	}
	
	/**
	 * 产生随机的六位数
	 * @return
	 */
	public static String getSix(){
		Random rad=new Random();
		String result  = rad.nextInt(1000000) +"";
		
		if(result.length()!=6){
			return getSix();
		}
		return result;
	}
	
	/***
	 * 获取IP地址
	 * @param request
	 * */
	public static String getRemoteIp(HttpServletRequest request){
		
		String remoteIp = request.getHeader("x-forwarded-for");
        if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
            remoteIp= request.getHeader("X-Real-IP");
        }
        if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
            remoteIp= request.getHeader("Proxy-Client-IP");
        }
        if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
            remoteIp= request.getHeader("WL-Proxy-Client-IP");
        }
        if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
            remoteIp= request.getHeader("HTTP_CLIENT_IP");
        }
        if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
            remoteIp= request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
            remoteIp= request.getRemoteAddr();
        }
        if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
            remoteIp= request.getRemoteHost();
        }
        return remoteIp;
    }
	
	/**
	 * 使用java正则表达式去掉多余的.与0
	 * @param s
	 * @return 
	 */
	public static String subZeroAndDot(String s){
		if(s.indexOf(".") > 0){
			s = s.replaceAll("0+?$", "");//去掉多余的0
			s = s.replaceAll("[.]$", "");//如最后一位是.则去掉
		}
		return s;
	}
}