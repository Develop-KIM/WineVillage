package com.winevillage.winevillage.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartListService {

	// CartMapper 인터페이스 의존성 주입
    private final CartListMapper cartListMapper;

    
    // 생성자를 통한 의존성 주입
    @Autowired
    public CartListService(CartListMapper cartListMapper) {
        this.cartListMapper = cartListMapper;
    }
    
    public void addProductToMemberCart(String productCode, String memberNo) {
        cartListMapper.addProductToMemberCart(productCode, memberNo);
    }

    public void addProductToNonMemberCart(String productCode, String cookieId) {
        Map<String, Object> params = new HashMap<>();
        params.put("productCode", productCode);
        params.put("cookieId", cookieId);
        cartListMapper.addProductToNonMemberCart(params);
    }
    
    public List<CartListDTO> getCartListByCookieId(String cookieId) {
        return cartListMapper.getCartListByCookieId(cookieId);
    }
    
    public List<CartListDTO> getCartListByMemberNo(String memberNo) {
        return cartListMapper.getCartListByMemberNo(memberNo);
    }
    
    public void updateOrderQuantity(Long orderNo, String productCode, int orderAmount) {
        cartListMapper.updateOrderQuantity(orderNo, productCode, orderAmount);
    }
    
    public CartListDTO getCartItem(Long orderNo, String productCode) {
        return cartListMapper.getCartItem(orderNo, productCode);
    }
    
    public String getMemberNo(String user_id) {
        return cartListMapper.getMemberNo(user_id);
    }
    
    public boolean updateMemberCart(String memberNo, String cookieId) {
    	return cartListMapper.updateMemberCart(memberNo, cookieId);
    }
    

}
