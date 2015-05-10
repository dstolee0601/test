package kr.or.kosta.common.dao;

import java.lang.reflect.Method;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 * Jdbc기술을 사용하는 각각의 Dao 생성
 * @author 김기정
 *
 */
public class JdbcDaoFactory extends DaoFactory{
	
	private static final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521";
	private static final String USER_ID = "hr";
	private static final String USER_PW = "hr";
	private static final int MAX_COUNT = 5;
	private static final int IDLE_COUNT = 2;
	
	public DataSource createDataSource(){
		// 아파치에서 제공하는 DataSource 구현체(DBCD API)
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(DRIVER_NAME);
		dataSource.setUrl(DB_URL);
		dataSource.setUsername(USER_ID);
		dataSource.setPassword(USER_PW);
		dataSource.setMaxTotal(MAX_COUNT);
		dataSource.setMaxIdle(IDLE_COUNT);
		return dataSource;
	}
	
	
//	public UserDao getUserDao(){
//		return new JdbcUserDao(createDataSource());
//	}
//	public abstract AccountDao getAccountDao(){}
//	public abstract MessageDao getMessageDao(){}
	
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
