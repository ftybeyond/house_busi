package com.yx.action;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.model.Accessory;
import com.yx.model.Agreement;
import com.yx.model.common.CommonRsp;
import com.yx.service.IAgreementService;
import com.yx.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/agreement")
@ResponseBody
public class AgreementAction extends BaseAction{

    @Autowired
    IAgreementService agreementService;

    @Autowired
    ILogService logService;

    @RequestMapping(value = "table",method = RequestMethod.POST)
    public DataTableRspWrapper<Agreement> table(PageProxy pageProxy){
        return agreementService.table(pageProxy);
    }

    @RequestMapping(value = "saveOrUpdate",method = RequestMethod.POST)
    public CommonRsp saveOrUpdate(Agreement agreement, MultipartFile[] files, String[] fileName, HttpSession session) throws IOException {
        if(files.length>0){
            List<Accessory> list = new ArrayList<>();
            for (int i = 0; i <files.length ; i++) {
                Accessory accessory = new Accessory();
                accessory.setBelong("agreement");
                accessory.setContent(files[i].getBytes());
                String name = files[i].getOriginalFilename();
                accessory.setOriginalName(name);
                if (name.indexOf(".")>0) {
                    accessory.setExt(name.substring(name.indexOf(".")+1));
                }
                if(fileName.length>i && fileName[i].trim().length()>0){
                    accessory.setName(fileName[i]);
                }else{
                    accessory.setName(name);
                }
                list.add(accessory);
            }
            agreement.setAccessories(list);
        }

        int effect = 0;
        if(agreement.getId()==null){
            effect = agreementService.insert(agreement);
            if(effect>0){
                logService.log(1,"新增合同：合同编号"+agreement.getSerialNumber(),"合同管理",session);
            }
        }else {
            effect = agreementService.update(agreement);
            if(effect>0) {
                logService.log(2, "更新合同：合同编号" + agreement.getSerialNumber(), "合同管理", session);
            }
        }

        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "delete",method = RequestMethod.POST)
    public CommonRsp delete(@RequestParam(value = "id",required = true) Integer id,HttpSession session){
        int effect = agreementService.delete(id);
        CommonRsp rsp = new CommonRsp();
        if (effect > 0) {
            rsp.setSuccess(true);
            rsp.setResultCode("0000");
            rsp.setDescription("操作成功");
            logService.log(3,"删除合同,合同ID"+id,"合同管理",session);
        } else if(effect ==0){
            rsp.setSuccess(false);
            rsp.setResultCode("1000");
            rsp.setDescription("数据库更新失败!");
        }else {
            rsp.setSuccess(false);
            rsp.setResultCode("1000");
            rsp.setDescription("数据库更新失败!");
        }
        return rsp;
    }

    @RequestMapping(value = "getAccessories",method = RequestMethod.POST)
    public CommonRsp getAccessories(Integer id) {
        return data2Rsp(agreementService.getAccessories(id));
    }

    @RequestMapping(value = "deleteAccessory",method = RequestMethod.POST)
    public CommonRsp deleteAccessory(@RequestParam(value = "id",required = true)Integer id){
        return dbEffect2Rsp(agreementService.deleteAccessory(id));
    }

    @RequestMapping(value = "saveContent",method = RequestMethod.POST)
    public CommonRsp saveContent(Integer id,String content){
        return dbEffect2Rsp(agreementService.saveContent(id,content));
    }

    @RequestMapping(value = "getContent",method = RequestMethod.POST)
    public CommonRsp getContent(Integer id){
        return data2Rsp(agreementService.selectContentById(id));
    }

    /**
     * 合同履行，仅对合同state == 1的合同
     * @param agreement
     * @return
     */
    @RequestMapping(value = "perform" ,method = RequestMethod.POST)
    public CommonRsp perform(Integer agreement,HttpSession session){
        int effect = agreementService.perform(agreement);
        if(effect>0) {
            logService.log(4, "合同履行：合同ID" + agreement, "合同管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    /**
     * 合同解除，仅对state == 1的合同处理
     * @param house
     * @param agreement
     * @return
     */
    @RequestMapping(value = "relieve" ,method = RequestMethod.POST)
    public CommonRsp relieve(Integer house,Integer agreement,HttpSession session){
        int effect = agreementService.relieve(house, agreement);
        if(effect>0) {
            logService.log(5, "合同解除：合同ID" + agreement, "合同管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    /**
     * 合同终止
     * @param house
     * @param agreement
     * @param endDate
     * @param payable
     * @param payment
     * @return
     */
    @RequestMapping(value = "over" ,method = RequestMethod.POST)
    public CommonRsp over(Integer house,Integer agreement,String endDate,Double payable,Double payment,String invoice,HttpSession session){
        int effect = agreementService.over(house,agreement,endDate,payable,payment,invoice);
        if(effect>0) {
            logService.log(6, "合同终止：合同ID" + agreement, "合同管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    /**
     * 获取合同未缴费订单
     * @param agreement
     * @return
     */
    @RequestMapping(value = "getPayable" ,method = RequestMethod.POST)
    public CommonRsp getPayable(Integer agreement){
        return data2Rsp(agreementService.getPayable(agreement));
    }

    /**
     * 查询合同下房屋信息
     * @param agreement
     * @return
     */
    @RequestMapping(value = "houses" ,method = RequestMethod.POST)
    public CommonRsp houses(Integer agreement){
        return data2Rsp(agreementService.houses(agreement));
    }
}
