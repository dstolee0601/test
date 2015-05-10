package kr.or.kosta.common.dao;

import java.lang.reflect.Method;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 * Jdbc����� ����ϴ� ������ Dao ����
 * @author �����
 *
 */
public class MybatisDaoFactory extends DaoFactory{
	
	public DataSource createDataSource(){
		return null;
	}
	
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
