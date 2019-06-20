package com.yd.util;

import java.lang.reflect.Field;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

/**
* @author YD
* @date 2017年3月3日
* @version 1.0
* @Description 字段工具
*/
public class ColumnUtil {
	/**
	* @Title 设置值
	* @param field 字段实体
	* @param entity 实体
	* @param fieldType 字段类型
	* @param value 值
	* @author YD
	* @date 2017年3月3日
	* @version 1.0
	* @Description 
	*/
	public static void setValue(Field field,Object entity,String fieldType,String value) throws Exception{
		if(fieldType.equalsIgnoreCase("java.lang.String")){
            field.set(entity, value);
        }else if(fieldType.equalsIgnoreCase("byte")){
            field.setByte(entity, Byte.parseByte(value));
        }else if(fieldType.equalsIgnoreCase("short")){
            field.setShort(entity, Short.parseShort(value));
        }else if(fieldType.equalsIgnoreCase("int")){
            field.setInt(entity, Integer.parseInt(value));  
        }else if(fieldType.equalsIgnoreCase("long")){
            field.setLong(entity, Long.parseLong(value));
        }else if(fieldType.equalsIgnoreCase("float")){
            field.setFloat(entity, Float.parseFloat(value));
        }else if(fieldType.equalsIgnoreCase("double")){
            field.setDouble(entity, Double.parseDouble(value));
        }else if(fieldType.equalsIgnoreCase("boolean")){
            field.setBoolean(entity, Boolean.parseBoolean(value));
        }else if(fieldType.equalsIgnoreCase("java.util.Date")){
        	Calendar c = Calendar.getInstance();
        	c.setTimeInMillis(new Long(value));
            field.set(entity,c.getTime());
        }else if(fieldType.equalsIgnoreCase("java.lang.Integer")){
            field.set(entity, new Integer(value));
        }  else{
            field.set(entity, value);
        }  
	}
	
	
	/** 
     * 解析表单并转换成对象 
     * @param request 
     * @param clazz 对象bean路径
     * @return 返回封装好的对象
     * @throws Exception 
     */  
	public static <T> T parseRequestToEntity(HttpServletRequest request, Class<T> clazz) throws Exception{  
        T entity = clazz.newInstance();//初始化对象
        Field[] fields = clazz.getFields();//得到对象字段。包括继承。如果使用这个getdeclaredfields则不包括继承
        for (Field field : fields) {
            field.setAccessible(true);  
            String fieldName = field.getName();//字段名称
            String fieldType = field.getType().getName();//字段
            String value = request.getParameter(fieldName);//值
            if(value == null || value.trim().length() == 0){  
                continue;
            }
            //设置字段值
            ColumnUtil.setValue(field, entity, fieldType, value);
        }
        //返回对象
        return entity;
    }  
}
