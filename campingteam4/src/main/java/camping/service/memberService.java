package camping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.memberDAO;

@Service
public class memberService {
	@Autowired
	private memberDAO dao;
}
