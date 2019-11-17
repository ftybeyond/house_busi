package com.yx.action;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.model.House;
import com.yx.model.common.CommonRsp;
import com.yx.service.IHouseService;
import com.yx.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;

@Controller
@RequestMapping("/house")
@ResponseBody
public class HouseAction extends BaseAction {

    @Autowired
    IHouseService houseService;

    @Autowired
    ILogService logService;

    @RequestMapping(value = "/table",method = {RequestMethod.POST})
    public DataTableRspWrapper<House> table(PageProxy pageProxy){
        return houseService.table(pageProxy);
    }

    @RequestMapping(value = "/saveOrUpdate",method = {RequestMethod.POST})
    public CommonRsp insert(House house,HttpSession session) {
        int effect = 0;
        if (house.getId()==null) {
            effect = houseService.insert(house);
            if(effect >0){
                logService.log(9, "新增房屋：房屋编号" + house.getHouseCode(), "房屋管理", session);
            }
            return dbEffect2Rsp(effect);
        } else {
            effect =houseService.update(house);
            if(effect >0){
                logService.log(10, "更新房屋：房屋编号" + house.getHouseCode(), "房屋管理", session);
            }
            return dbEffect2Rsp(effect);
        }
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public CommonRsp delete(Integer id, HttpSession session){
        int effect = houseService.deleteByPrimaryKey(id);
        CommonRsp rsp = new CommonRsp();
        if (effect > 0) {
            rsp.setSuccess(true);
            rsp.setResultCode("0000");
            rsp.setDescription("操作成功");
            logService.log(11, "删除房屋：房屋ID" + id, "房屋管理", session);
        } else if(effect==0) {
            rsp.setSuccess(false);
            rsp.setResultCode("1000");
            rsp.setDescription("没有数据更新！");
        }else if(effect ==-1){
            rsp.setSuccess(false);
            rsp.setResultCode("1001");
            rsp.setDescription("该数据已关联合同及相关数据，无法删除！");
        }
        return rsp;
    }

    @RequestMapping(value = "/relateAgreement",method = RequestMethod.POST)
    public CommonRsp relateAgreement(Integer[] houses,Integer agreement,HttpSession session){
        //关联合同
        int effect = houseService.relateAgreement(houses,agreement);
        if(effect>0) {
            logService.log(7, "合同关联：合同ID" + agreement+"房屋ID"+ Arrays.toString(houses), "合同管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "/leaseList",method = RequestMethod.POST)
    public DataTableRspWrapper<House> leaseList(PageProxy pageProxy){
        return houseService.leaseList(pageProxy);
    }
}
