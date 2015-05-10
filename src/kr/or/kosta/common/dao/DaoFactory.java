package kr.or.kosta.common.dao;

import javax.sql.DataSource;

/**
 * DaoFactory�μ��� �⺻ �Ծ� ���� �߻�Ŭ����
 * @author �����
 *
 */
public abstract class DaoFactory {
	
	public enum FactoryType{
		JDBC, MYBATIS, JDO, JPA, HIBERNATE
	}
	
	public abstract DataSource createDataSource();
	
	public static DaoFactory getDaoFactory(FactoryType type){
		switch (type) {
			case JDBC: return new JdbcDaoFactory();
//			case MYBATIS: return new MybatisDaoFactory();
			default : return new JdbcDaoFactory();
		}
	}
	
//	public abstract UserDao getUserDao();
//	public abstract AccountDao getAccountDao();
//	public abstract MessageDao getMessageDao();
	
	public abstract Object getDao(String daoClassName) throws Exception;

}
