package com.yx.service.impl;

import com.yx.dao.AccessoryMapper;
import com.yx.model.Accessory;
import com.yx.service.IAccessoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AccessoryService implements IAccessoryService{

    @Autowired
    AccessoryMapper accessoryMapper;

    @Override
    public Accessory loadFile(Integer id) {
        return accessoryMapper.loadBinary(id);
    }
}
