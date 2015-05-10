package kr.or.kosta.common.dao;

import java.lang.reflect.Method;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 * Jdbc기술을 사용하는 각각의 Dao 생성
 * @author 김기정
 *
 */
public class MybatisDaoFactory extends DaoFactory{
	
	public DataSource createDataSource(){
		return null;
	}
	
	@Override
	public Object getDao(String daoClassName) throws Exception{
		Object dao = null;
		// Reflection API를 이용한 Dao 동적 생성 
		dao = Class.forName(daoClassName).newInstance();
		// 생성된 Dao에 DataSource 설정
		DataSource dataSource = createDataSource();
		// Reflection API를 이용한 메서드 동적 호출
		Method method = dao.getClass().getMethod("setDataSource", DataSource.class);
		method.invoke(dao, dataSource);
		//dao.setDataSource(dataSource);
		return dao;
	}
}
