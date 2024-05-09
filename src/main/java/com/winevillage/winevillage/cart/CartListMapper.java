package com.winevillage.winevillage.cart;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CartListMapper {
    void addProductToMemberCart(Map<String, Object> params);
    void addProductToNonMemberCart(Map<String, Object> params);
    List<CartListDTO> getCartListByCookieId(@Param("cookieId") String cookieId);
    List<CartListDTO> getCartListByMemberNo(Long memberNo);
    CartListDTO getProductByCode(@Param("productCode") String productCode);
}
