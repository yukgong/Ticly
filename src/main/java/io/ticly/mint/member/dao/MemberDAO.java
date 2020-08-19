package io.ticly.mint.member.dao;

import io.ticly.mint.member.dto.UserDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDAO {

    private SqlSessionTemplate sqlSessionTemplate;

    public MemberDAO(SqlSessionTemplate sqlSessionTemplate) {

        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    /**
     * 로그인시 가입 여부 확인
     * @param userDTO
     * @return
     */
    public UserDTO findMemberInfo(UserDTO userDTO){
        return sqlSessionTemplate.selectOne("memberMapper.findMemberLogin", userDTO);
    }

    public List<String> getUserCategories(String email){
        return sqlSessionTemplate.selectList("memberMapper.getUserCategories", email);
    }

    public int saveUserCategories(String email, int category_num){
        int checkNum = 0;
        checkNum = sqlSessionTemplate.insert("memberMapper.saveUserCategories", category_num);

        return checkNum;
    }

    /**
     * 회원가입시 이메일 중복 확인
     * @param email
     * @return
     */
    public UserDTO findDuplicateEmail(String email){
        UserDTO userDTO = sqlSessionTemplate.selectOne("memberMapper.checkEmail", email);
        return userDTO;
    }

    /**
     * 회원가입시 멤버 데이터 저장
     * @param userDTO
     * @return
     */
    public int insertNewMember(UserDTO userDTO){
        int checkNum = 0;
        checkNum = sqlSessionTemplate.insert("memberMapper.signup", userDTO);
        System.out.println("MemberDAO checkNum : " + checkNum);
        return checkNum;
    }

    public int insertOAuthMember(UserDTO userDTO){
        return sqlSessionTemplate.insert("memberMapper.signup", userDTO);
    }
}
