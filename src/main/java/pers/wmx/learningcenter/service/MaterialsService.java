package pers.wmx.learningcenter.service;

import pers.wmx.learningcenter.domain.Materials;

import java.util.List;

public interface MaterialsService {
    int add(Materials materials);

    Materials findById(Integer id);

    List<Materials> findMaterialsList(Integer userId);

    int updateDownloadNum(Integer id);

    int deleteById(Integer id);

    int updateMaterials(Materials materials);

    List<Materials> findMaterialsByCondition(Materials materials);

    List<Materials> findMaterialsOrderLy();
}
