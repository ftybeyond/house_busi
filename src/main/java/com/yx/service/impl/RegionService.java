package com.yx.service.impl;

import com.yx.dao.RegionMapper;
import com.yx.model.Region;
import com.yx.model.common.UpdateMap;
import com.yx.service.IRegionService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class RegionService implements IRegionService{

    @Autowired
    RegionMapper regionMapper;


    @Override
    public List<Region> list(Integer pid) {
        return regionMapper.selectByPid(pid);
    }

    @Override
    @Transactional
    public int insert(Region region) {
        int result = regionMapper.insert(region);
        UpdateMap updateMap = new UpdateMap("region",region.getId(),null);
        if(region.getParentId() == null || region.getParentId() == 0){
            Map map = new HashMap();
            map.put("level",1);
            map.put("id_Path",region.getId());
            map.put("name_Path",region.getName());
            updateMap.setProps(map);
        }else{
            Region father = regionMapper.selectByPrimaryKey(region.getParentId());
            Map map = new HashMap();
            map.put("level",father.getLevel()+1);
            map.put("id_Path",father.getIdPath()+"."+region.getId());
            map.put("name_Path",father.getNamePath()+"."+region.getName());
            updateMap.setProps(map);
        }
        result+=regionMapper.updateByMap(updateMap);
        return result;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {

        return regionMapper.deleteByPrimaryKey(id);
    }

    @Override
    @Transactional
    public int update(Region region) {
        Map props = new HashMap();
        props.put("name",region.getName());
        props.put("remark",region.getRemark());
        UpdateMap updateMap = new UpdateMap("region",region.getId(),props);
        int effect =  regionMapper.updateByMap(updateMap);
        List<Region> branch = regionMapper.selectBranch(region.getId());
        for(Region r:branch){
            String[] names  = r.getNamePath().split("\\.");
            names[region.getLevel()-1] = region.getName();
            Map props1 = new HashMap();
            props1.put("name_path", StringUtils.join(names,"."));
            UpdateMap updateMap1 = new UpdateMap("region",r.getId(),props1);
            effect+= regionMapper.updateByMap(updateMap1);
        }
        return effect;
    }

    public int mark(Integer id,String point){
        Map map = new HashMap();
        map.put("location",point);
        UpdateMap updateMap = new UpdateMap("region",id,map);
        return regionMapper.updateByMap(updateMap);
    }

    public List<Region> querySelect2Data(Region region){
        return  regionMapper.querySelect2Data(region);
    }
}
