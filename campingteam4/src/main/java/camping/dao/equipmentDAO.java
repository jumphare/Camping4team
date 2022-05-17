package camping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import camping.model.equipment;

@Repository
public class equipmentDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<equipment> eqlist (equipment eqm) {
		return session.selectList("equip.eqlist",eqm);
	}
	public int eqcnt(equipment eqm) {
		return session.selectOne("equip.eqcnt", eqm);
	}
	public List<equipment> eq_option(int camp_no) {
		return session.selectList("equip.option",camp_no);
	}
	public void eq_insert(equipment eq) {
		session.insert("equip.insert", eq);
	}
	public equipment eqdetail(int eq_no) {
		return session.selectOne("equip.eqdetail", eq_no);
	}
	public void eq_update(equipment eq) {
		session.update("equip.update", eq);
	}
	public void eq_delete(String chk) {
		session.delete("equip.delete", chk);
	}
	public void eq_rm(equipment eqm) {
		session.update("equip.rm", eqm);
	}
}
