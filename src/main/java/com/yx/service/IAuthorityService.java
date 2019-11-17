package com.yx.service;

import com.yx.model.Authority;
import com.yx.model.Role;
import com.yx.model.common.Select2;

import java.util.List;

public interface IAuthorityService {

    public List<Select2> getSelect2();

    public List<Authority> selectByRole(Role role);

    public List<Authority> selectAll();
}
