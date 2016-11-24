package com.sist.library.service;

import java.util.Map;

import com.sist.library.dao.MailVO;
import com.sist.library.dao.MemberVO;

public interface LoginService {
	public int insertMember(MemberVO vo) throws Exception;

	public int check_id(String id);

	public int login_ok(String id, String pwd);

	public int findId(Map map);

	public MailVO findmail(Map map);

	public int findPwd(Map map);

	public MailVO findPwdMail(Map map);

	public void changeRandomPwd(Map map);

}
