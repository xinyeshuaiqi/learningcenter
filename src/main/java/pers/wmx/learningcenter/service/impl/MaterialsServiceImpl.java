package pers.wmx.learningcenter.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.wmx.learningcenter.dao.MaterialsDao;
import pers.wmx.learningcenter.domain.Materials;
import pers.wmx.learningcenter.service.MaterialsService;

import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-05-12 21:31
 */
@Service
public class MaterialsServiceImpl implements MaterialsService {

    @Autowired
    MaterialsDao materialsDao;


    @Override
    public int add(Materials materials) {
        return materialsDao.add(materials);
    }

    @Override
    public Materials findById(Integer id) {
        return materialsDao.findById(id);
    }

    @Override
    public List<Materials> findMaterialsList(Integer userId) {
        return materialsDao.findMaterialsList(userId);
    }

    @Override
    public int updateDownloadNum(Integer id) {
        return materialsDao.updateDownloadNum(id);
    }

    @Override
    public int deleteById(Integer id) {
        return materialsDao.deleteById(id);
    }

    @Override
    public int updateMaterials(Materials materials) {
        return materialsDao.updateMaterials(materials);
    }

    @Override
    public List<Materials> findMaterialsByCondition(Materials materials) {
        return materialsDao.findMaterialsByCondition(materials);
    }

    @Override
    public List<Materials> findMaterialsOrderLy() {
        return materialsDao.findMaterialsOrderLy();
    }
}
