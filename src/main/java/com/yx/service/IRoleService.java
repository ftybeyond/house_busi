package com.yx.service;

import com.yx.common.PageProxy;
import com.yx.model.Role;
import com.yx.model.common.Select2;

import java.util.List;

public interface IRoleService {

    public List<Role> table(PageProxy pageProxy);

    public int insert(Role role);

    public int delete(Integer id);

    public int update(Role role);

    public List<Select2> getSelect2();
}
