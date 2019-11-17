package com.yx.action;

import com.yx.common.PageProxy;
import com.yx.model.Role;
import com.yx.model.common.CommonRsp;
import com.yx.model.common.Select2;
import com.yx.service.IAuthorityService;
import com.yx.service.ILogService;
import com.yx.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("role")
@ResponseBody
public class RoleAction extends BaseAction {

    @Autowired
    IRoleService roleService;

    @Autowired
    IAuthorityService authorityService;

    @Autowired
    ILogService logService;

    @RequestMapping(value = "insert",method = RequestMethod.POST)
    public CommonRsp insert(Role role, HttpSession session){
        if (role.getAuthority() != null && role.getAuthority().startsWith("0,")) {
            role.setAuthority("0");
        }
        int effect = roleService.insert(role);
        if(effect >0){
            logService.log(20, "角色添加：角色名称"+role.getName() , "角色管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "table",method = RequestMethod.POST)
    public CommonRsp table(PageProxy pageProxy){
        return data2Rsp(roleService.table(pageProxy));
    }

    @RequestMapping(value = "delete",method = RequestMethod.POST)
    public CommonRsp delete(Integer id,HttpSession session){
        int effect = roleService.delete(id);
        if(effect >0){
            logService.log(22, "角色删除：角色ID"+id , "角色管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "update",method = RequestMethod.POST)
    public CommonRsp update(Role role,HttpSession session){
        if (role.getAuthority() != null && role.getAuthority().startsWith("0,")) {
            role.setAuthority("0");
        }
        int effect = roleService.update(role);
        if(effect >0){
            logService.log(21, "角色编辑：角色ID"+role.getId() , "角色管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "authoritySelect2",method = RequestMethod.POST)
    public List<Select2> getAuthoritySelect(){
        return authorityService.getSelect2();
    }

    @RequestMapping(value = "roleSelect2",method = RequestMethod.POST)
    public List<Select2> getRoleSelect(){
        return roleService.getSelect2();
    }
}