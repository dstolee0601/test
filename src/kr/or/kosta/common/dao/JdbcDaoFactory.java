package kr.or.kosta.common.dao;

import java.lang.reflect.Method;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 * Jdbc����� ����ϴ� ������ Dao ����
 * @author �����
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
		// ����ġ���� �����ϴ� DataSource ����ü(DBCD API)
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
		// Reflection API�� �̿��� Dao ���� ���� 
		dao = Class.forName(daoClassName).newInstance();
		// ������ Dao�� DataSource ����
		DataSource dataSource = createDataSource();
		// Reflection API�� �̿��� �޼��� ���� ȣ��
		Method method = dao.getClass().getMethod("setDataSource", DataSource.class);
		method.invoke(dao, dataSource);
		//dao.setDataSource(dataSource);
		return dao;
	}
}
