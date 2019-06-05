package pers.wmx.learningcenter.dao;

import org.apache.ibatis.annotations.*;
import pers.wmx.learningcenter.domain.Materials;

import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-05-12 21:32
 */
@Mapper
public interface MaterialsDao {

    @Insert("insert into materials(user_id,NAME,TYPE,description,create_time,file_path) " +
            "values(#{userId},#{name},#{type},#{description},#{createTime},#{filePath})")
    @Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")   //插入成功后返回id
    int add(Materials materials);

    @Select("select * from  materials where id = #{id}")
    Materials findById(@Param(value = "id")Integer id);

    @Select({"<script>",
            "SELECT * FROM materials",
            "WHERE 1=1",
            "<when test='userId!=null'>",
            "AND user_id = #{userId}",
            "</when>",
            "ORDER BY create_time desc",
            "</script>"})
    List<Materials> findMaterialsList(@Param(value = "userId")Integer userId);

    @Update("update materials set download_num=download_num+1 where id=#{id}")
    int updateDownloadNum(@Param(value = "id")Integer id);

    @Delete("delete from materials where id = #{id}")
    int deleteById(@Param(value = "id")Integer id);

    @Update("update materials set NAME=#{name},description=#{description},type=#{type}," +
            "file_path=#{filePath} " +
            "where id=#{id}")
    int updateMaterials(Materials materials);

    @Select({"<script>",
            "SELECT * FROM materials",
            "WHERE 1=1",
            "<when test='name!=null'>",
            "AND NAME like CONCAT('%',#{name},'%')",
            "</when>",
            "<when test='type!=null'>",
            "AND TYPE = #{type}",
            "</when>",
            "<when test='description!=null'>",
            "AND description like CONCAT('%',#{description},'%')",
            "</when>",
            "ORDER BY create_time desc",
            "</script>"})
    List<Materials> findMaterialsByCondition(Materials materials);

    @Select("select * from  materials order by download_num desc")
    List<Materials> findMaterialsOrderLy();
}
