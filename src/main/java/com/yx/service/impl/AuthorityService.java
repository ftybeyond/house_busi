package com.yx.service.impl;

import com.yx.dao.AuthorityMapper;
import com.yx.model.Authority;
import com.yx.model.Role;
import com.yx.model.common.Select2;
import com.yx.service.IAuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class AuthorityService implements IAuthorityService {

    @Autowired
    AuthorityMapper authorityMapper;

    @Override
    public List<Select2> getSelect2() {
        List<Select2> select2List = new ArrayList<>();
        select2List.add(new Select2(0,"全部权限"));
        for(Authority authority:authorityMapper.selectAll()){
            Select2 select2 = new Select2();
            select2.setId(authority.getId());
            select2.setText(authority.getName());
            select2List.add(select2);
        }
        return select2List;
    }

    @Override
    public List<Authority> selectByRole(Role role) {
        return authorityMapper.selectByRole(role);
    }

    @Override
    public List<Authority> selectAll() {
        return authorityMapper.selectAll();
    }
}
