package com.muwei.demo.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class CampsiteRepositoryCustomImpl implements CampsiteRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Campsite> selectByCheck(Map<String,String> checks,boolean campervanAVL) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Campsite> query = cb.createQuery(Campsite.class);
        Root<Campsite> csite = query.from(Campsite.class);
        
        List<Predicate> predicates = new ArrayList<Predicate>();
        Iterator<String> iter = checks.keySet().iterator();
        while(iter.hasNext()){
        	String key=iter.next();
        	predicates.add(cb.equal(csite.get(key),checks.get(key)));
        }
        
        if(campervanAVL) {
        	predicates.add(cb.greaterThan(csite.get("campervanAreaAmount"), 0));   	
        }
        
        query.select(csite).where(cb.and(predicates.toArray(new Predicate[predicates.size()])));
        return entityManager.createQuery(query).getResultList();

	}

}
