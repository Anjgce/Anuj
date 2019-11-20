package com.jlcindia.hibernate;
import org.hibernate.*;
public class Lab2B {

	public static void main(String[] args) {
		Transaction tx=null;
		try{
			SessionFactory sf=HibernateUtil.getSessionFactory();
			Session session=sf.openSession();
			tx=session.beginTransaction();
			Customer cust=(Customer)session.load(Customer.class, 1);
			System.out.println(cust.getCid()+"\t"+cust.getCname()+"\t"+cust.getEmail()+"\t"+cust.getPhone()+"\t"+cust.getCity()+"\t"+cust.getBal());
			tx.commit();
			session.close();
			
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null)
				tx.rollback();
		}

	}

}
