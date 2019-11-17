package com.yx.service.impl;

import com.yx.common.PageProxy;
import com.yx.dao.RoleMapper;
import com.yx.model.Role;
import com.yx.model.common.Select2;
import com.yx.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class RoleService implements IRoleService{

    @Autowired
    RoleMapper roleMapper;

    @Override
    public List<Role> table(PageProxy pageProxy) {
        return roleMapper.selectAll();
    }

    @Override
    public int insert(Role role) {
        return roleMapper.insert(role);
    }

    @Override
    public int delete(Integer id) {
        return roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Role role) {
        return roleMapper.updateByPrimaryKey(role);
    }

    @Override
    public List<Select2> getSelect2() {
        List<Select2> select2List = new ArrayList<>();
        for(Role role:roleMapper.selectAll()){
            Select2 select2 = new Select2();
            select2.setId(role.getId());
            select2.setText(role.getName());
            select2List.add(select2);
        }
        return select2List;
    }
}
