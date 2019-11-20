package com.jlcindia.hibernate;
import org.hibernate.*;
import org.hibernate.boot.registry.*;
import org.hibernate.cfg.*;
public class HibernateUtil {
	static SessionFactory factory;
	static{
		Configuration cfg=new Configuration();
		cfg=cfg.configure();
		StandardServiceRegistryBuilder ssrbuilder=new StandardServiceRegistryBuilder();
		StandardServiceRegistry ssRegistry=ssrbuilder.applySettings(cfg.getProperties()).build();
		factory=cfg.buildSessionFactory(ssRegistry);		//creating SessionFactory object
	}
	public static SessionFactory getSessionFactory(){
		return factory;
	}

}
