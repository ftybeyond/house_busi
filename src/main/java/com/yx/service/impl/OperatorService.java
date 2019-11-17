package com.yx.service.impl;

import com.alibaba.fastjson.JSON;
import com.yx.common.MD5;
import com.yx.common.PageProxy;
import com.yx.component.HttpUtil;
import com.yx.dao.AuthorityMapper;
import com.yx.dao.OperatorMapper;
import com.yx.model.Authority;
import com.yx.model.Operator;
import com.yx.model.Role;
import com.yx.model.common.CommonRsp;
import com.yx.service.IOperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class OperatorService implements IOperatorService{

    @Autowired
    OperatorMapper operatorMapper;

    @Autowired
    AuthorityMapper authorityMapper;

    @Autowired
    HttpUtil httpUtil;

    @Value("${sso.url.add}")
    String ssoAddUrl;

    @Value("${sso.url.update}")
    String ssoUpdateUrl;

    @Value("${sys.id}")
    Integer sysID;

    @Value("${sso.key}")
    Integer ssoKey;

    @Value("${init.password}")
    String initPassword;

    @Override
    public List<Operator> table(PageProxy pageProxy) {
        return operatorMapper.selectAll();
    }

    @Override
    public int insert(Operator operator) {
        if(operatorMapper.selectByLoginName(operator.getLoginName())!=null){
            return -1;
        }
        Map<String,String> params = new HashMap<>();
        params.put("loginName",operator.getLoginName());
        params.put("password",operator.getPassword());
        params.put("sysFrom",sysID.toString());
        Map<String,String> headers = new HashMap<>();
        headers.put("token",MD5.EncoderByMd5(operator.getLoginName()+operator.getPassword()+sysID+ssoKey));
        String body = httpUtil.doPost(ssoAddUrl,params,headers);
        CommonRsp rsp = JSON.parseObject(body, CommonRsp.class);
        if(!(rsp.isSuccess()&&"0000".equals(rsp.getResultCode()))){
            return -1;
        }
        operator.setPassword(initPassword);
        operator.setState(1);
        return operatorMapper.insert(operator);
    }

    @Override
    public int delete(Integer id) {
        return operatorMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Operator operator) {
        Operator old = operatorMapper.selectByLoginName(operator.getLoginName());
        if(old.getId()!=operator.getId()){
            return -1;
        }
        return operatorMapper.updateByPrimaryKey(operator);
    }

    @Override
    public int updatePassword(Operator operator){
        Map<String,String> params = new HashMap<>();
        params.put("loginName",operator.getLoginName());
        params.put("password",operator.getPassword());
        params.put("sysFrom",sysID.toString());
        Map<String,String> headers = new HashMap<>();
        headers.put("token",MD5.EncoderByMd5(operator.getLoginName()+operator.getPassword()+sysID+ssoKey));
        String body = httpUtil.doPost(ssoUpdateUrl,params,headers);
        CommonRsp rsp = JSON.parseObject(body, CommonRsp.class);
        if(!(rsp.isSuccess()&&"0000".equals(rsp.getResultCode()))){
            return -1;
        }
        String password = MD5.EncoderByMd5(operator.getPassword());
        operator.setPassword(password);
        return operatorMapper.updatePassword(operator);
    }

    @Override
    public Operator selectByLoginName(String loginName){
        return operatorMapper.selectByLoginName(loginName);
    }


    @Override
    public Operator selectById(Integer id){
        return operatorMapper.selectByPrimaryKey(id);
    }
}
