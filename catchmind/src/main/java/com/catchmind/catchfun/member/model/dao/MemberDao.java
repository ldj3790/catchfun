package com.catchmind.catchfun.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.catchmind.catchfun.admin.model.vo.Question;
import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.member.model.vo.Member;
import com.catchmind.catchfun.member.model.vo.MyWish;

@Repository("mDao")
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.deleteMember", m);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}
	
	public int selectId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectId", m);
	}
	
	
	public int sellerMessageRestListCount(SqlSessionTemplate sqlSession, String counseling) {
		return sqlSession.selectOne("memberMapper.sellerMessageRestListCount", counseling);
	}
	
	public ArrayList<Question> sellerMessageRestList(SqlSessionTemplate sqlSession, PageInfo pi, String counseling){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.sellerMessageRestList", counseling, rowBounds);
		
	}
	
	public int MessageRestListCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("memberMapper.MessageRestListCount", userNo);
	}
	
	public ArrayList<Question> MessageRestList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.MessageRestList", userNo, rowBounds);
		
	}



	public Question selectMessage(SqlSessionTemplate sqlSession, String qno) {
		
		return sqlSession.selectOne("memberMapper.selectMessage", qno);
	}

	public int deleteMessage(SqlSessionTemplate sqlSession, String qno) {
		
		return sqlSession.update("memberMapper.deleteMessage", qno);
	}

	public int updateMessage(SqlSessionTemplate sqlSession, Question q) {
		System.out.println(q);
		return sqlSession.update("memberMapper.updateMessage", q);
	}

	public Question messageUpdateForm(SqlSessionTemplate sqlSession, String qno) {
		return sqlSession.selectOne("memberMapper.messageUpdateForm", qno);
	}

//	public ArrayList<Question> selectReplyList(SqlSessionTemplate sqlSession, String qno) {
	public Question selectReplyList(SqlSessionTemplate sqlSession, String qno) {
//		return (ArrayList)sqlSession.selectList("memberMapper.selectReplyList", qno);
		return sqlSession.selectOne("memberMapper.selectReplyList", qno);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.update("memberMapper.insertReply", q);
	}

	public int deleteAnswer(SqlSessionTemplate sqlSession, String qno) {
		return sqlSession.update("memberMapper.deleteAnswer", qno);
	}

	public int pwdFind(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.pwdFind", m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}
	public ArrayList<Member> idFindMember(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.idFindMember", m);
	}
	
	public ArrayList<MyWish> myWishList(SqlSessionTemplate sqlSession, String userNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.myWishList", userNo);
	}






	
	

	// ????????? !!
	/*
	//???????????? ?????? ?????????
    public void join(SqlSessionTemplate sqlSession, Map<String, Object>map, MemberDTO dto) {
 
        map.get("user_id");
        map.get("member_pass");
        map.get("e_mail");
        
        sqlSession.insert("member.insertUser",map);        
    }
    
    
    //??????????????? ?????????
    public boolean loginCheck(SqlSessionTemplate sqlSession, MemberDTO dto) {
        String name
            =sqlSession.selectOne("member.login_check", dto);
        
        //????????? ? true????????? ??? : false????????? ???
        return (name==null) ? false : true;
    }
 
    
    //????????? ?????? ?????? ?????????
    public String find_idCheck(SqlSessionTemplate sqlSession, MemberDTO dto) {
        String id = sqlSession.selectOne("member.find_id_check", dto);
        return id;
        
    }
 
    
    //???????????? ?????? ?????? ?????????
    public String find_passCheck(SqlSessionTemplate sqlSession, MemberDTO dto) {
        String pass = sqlSession.selectOne("member.find_pass_check", dto);
        return pass;
    }
 
    
    //?????? ?????? ?????? ?????????
    //????????? ????????? ????????? ????????? ?????? ???????????? ???????????? ????????? ??? ?????? ???
    public void authentication(SqlSessionTemplate sqlSession, MemberDTO dto) {
        
        sqlSession.insert("member.authentication", dto);
        
    }
 
 
    public void pass_change(SqlSessionTemplate sqlSession, Map<String, Object> map, MemberDTO dto) throws Exception{
        
        map.get("member_pass");
        map.get("e_mail");
 
        sqlSession.update("member.pass_change", map);
    }
 
 
    public boolean email_check(SqlSessionTemplate sqlSession, String e_mail) throws Exception {
        String email
        =sqlSession.selectOne("member.email_check", e_mail);
    
        //????????? ? true????????? ??? : false????????? ???
        return (email==null) ? true : false;
        
    }
 
 */

}






