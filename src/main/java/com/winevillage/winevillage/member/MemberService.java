package com.winevillage.winevillage.member;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberService {
	int insert(MemberDTO memberDTO);
	int checkPhoneNumberExist(String phoneNumber);
	int checkMemberIdExist(String memberId);
	void registerMember(MemberDTO memberDTO);
	ArrayList<MemberDTO> memberlistPage(ParameterDTO parameterDTO);
	public int memberTotalCount(ParameterDTO parameterDTO);
}

