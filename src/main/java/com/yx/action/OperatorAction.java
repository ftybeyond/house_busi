package com.yx.action;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.MD5;
import com.yx.common.PageProxy;
import com.yx.model.Operator;
import com.yx.model.common.CommonRsp;
import com.yx.service.ILogService;
import com.yx.service.IOperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("operator")
@ResponseBody
public class OperatorAction extends BaseAction {

    @Autowired
    IOperatorService operatorService;

    @Autowired
    ILogService logService;

    @RequestMapping(value = "insert",method = RequestMethod.POST)
    public CommonRsp insert(Operator operator,HttpSession session){
        int effect = operatorService.insert(operator);
        if(effect >0){
            logService.log(16, "用户添加：用户名称"+operator.getName() , "用户管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "table",method = RequestMethod.POST)
    public CommonRsp table(PageProxy pageProxy){
        return data2Rsp(operatorService.table(pageProxy));
    }

    @RequestMapping(value = "delete",method = RequestMethod.POST)
    public CommonRsp delete(Integer id,HttpSession session){
        int effect = operatorService.delete(id);
        if(effect >0){
            logService.log(18, "用户删除：用户ID"+id , "用户管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "update",method = RequestMethod.POST)
    public CommonRsp update(Operator operator,HttpSession session){
        int effect = operatorService.update(operator);
        if(effect >0){
            logService.log(17, "用户更新：用户ID"+operator.getId() , "用户管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "passwordChange",method = RequestMethod.POST)
    public CommonRsp passwordChange(@RequestParam(name = "oldPsw",required = true) String oldPsw, @RequestParam(name = "newPsw",required = true)String newPsw , HttpSession session){
        Operator operator = (Operator) session.getAttribute("op");
        if(MD5.EncoderByMd5(oldPsw).equals(operator.getPassword())){
            operator.setPassword(newPsw);
            int effect = operatorService.updatePassword(operator);
            if(effect >0){
                logService.log(19, "用户密码修改：用户ID"+operator.getId() , "用户管理", session);
            }
            return dbEffect2Rsp(effect);
        }else{
            CommonRsp rsp = new CommonRsp();
            rsp.setSuccess(false);
            rsp.setResultCode("1001");
            rsp.setDescription("原密码输入有误!");
            return rsp;
        }
    }

}
