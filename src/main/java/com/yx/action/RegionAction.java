package com.yx.action;

import com.yx.model.Region;
import com.yx.model.common.CommonRsp;
import com.yx.service.ILogService;
import com.yx.service.IRegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/region")
@ResponseBody
public class RegionAction extends BaseAction{

    @Autowired
    IRegionService regionService;

    @Autowired
    ILogService logService;

    @RequestMapping(value = "/tree",method = RequestMethod.POST)
    public List<Region> treeSelect(Integer pid){
        List<Region> regions = regionService.list(pid);
        return regions;
    }

    @RequestMapping(value = "/saveOrUpdate",method = RequestMethod.POST)
    public CommonRsp add(Region region, HttpSession session){
        if (region.getId()==null) {
            int effect = regionService.insert(region);
            if(effect >0){
                logService.log(12, "区域添加：区域名称"+region.getName() , "区域管理", session);
            }
            return dbEffect2Rsp(effect);
        } else {
            int effect = regionService.update(region);
            if(effect >0){
                logService.log(13, "区域编辑：区域ID"+region.getId() , "区域管理", session);
            }
            return dbEffect2Rsp(effect);
        }
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public CommonRsp delete(Integer id,HttpSession session){
        int effect = regionService.deleteByPrimaryKey(id);
        if(effect >0){
            logService.log(14, "区域删除：区域ID"+id , "区域管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "/mark",method = RequestMethod.POST)
    public CommonRsp mark(@RequestParam(value = "point",required = true) String point,@RequestParam(value = "id",required = true) Integer id,HttpSession session){
        int effect = regionService.mark(id,point);
        if(effect >0){
            logService.log(15, "区域标注：区域ID"+id+"标注坐标:"+point , "区域管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "/selectQuery",method = RequestMethod.POST)
    public CommonRsp querySelect2Data(Region region) {
        return data2Rsp(regionService.querySelect2Data(region));
    }
}
