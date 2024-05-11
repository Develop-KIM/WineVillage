package com.winevillage.winevillage.pay;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import utils.PagingUtil;


@Controller
//@CrossOrigin(origins = "*")
public class PayContoller {
	
	@Autowired
	IPayService dao;
	
	@GetMapping("order_write.do")
	public String getOrderUserInfo(ParameterDTO parameterDTO, Model model, PayDTO payDTO) {
		
		ArrayList<PayDTO> lists = dao.getOrderUserInfo(parameterDTO);
		model.addAttribute("lists", lists);
		System.out.println("lists확인" + lists);
       
		ArrayList<PayDTO> orderList = dao.listOrder(parameterDTO);
		model.addAttribute("orderList", orderList);
        System.out.println("orderList확인" + orderList);
        
        int totalPrice = 0;
        for (PayDTO order : orderList) {
            totalPrice += order.getDiscountPrice() * order.getOrderAmount();
        }

        int availablePoints = 0;
        if (!lists.isEmpty()) {
            availablePoints = lists.get(0).getPoints();
        }

        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("availablePoints", availablePoints);
        
        return "order/order_write"; // JSP 페이지 이름 반환
    }
	
	@PostMapping("order_write.do")
	public String submitOrder(PayDTO payDTO, Model model) {
	    System.out.println("확인" + payDTO);
	    
	    int result = dao.write(payDTO);
	    
    	System.out.println("성공");
    	model.addAttribute("message", "성공");
	    	
	    return "main/main";
	}
	
	@GetMapping("/admin_order_lists.do")
	public String adminOrderListsGet(Model model, HttpServletRequest req, 
			ParameterDTO parameterDTO) {
		
		int totalCount = dao.totalCount(parameterDTO);
		int pageSize = 10;
		int blockPage = 5;
		int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals(""))
				? 1 : Integer.parseInt(req.getParameter("pageNum"));
		int start = (pageNum-1) * pageSize + 1;
		int end = pageNum * pageSize;
		
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("totalCount", totalCount);
		maps.put("pageSize", pageSize);
		maps.put("pageNum", pageNum);
		model.addAttribute("maps", maps);
		
		ArrayList<PayDTO> lists = dao.listOrderUsers(parameterDTO);
		model.addAttribute("lists", lists);
		
		String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum, 
				req.getContextPath()+"/admin_order_lists.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		return "admin/admin_order/admin_order_lists";
	}
	
//	@GetMapping("/restBoardList.do")
//	public List<PayDTO> restBoardList(ParameterDTO parameterDTO) {
//		
//		int pageSize = 10;
//		int pageNum = parameterDTO.getPageNum() == null ? 1 :
//			Integer.parseInt(parameterDTO.getPageNum());
//		
//		int start = (pageNum - 1) * pageSize + 1;
//		int end = pageNum * pageSize;
//		
//		parameterDTO.setStart(start);
//		parameterDTO.setEnd(end);
//	    
//		List<PayDTO> boardList = dao.listOrder(parameterDTO);
//		
//		return boardList;
//	}
//	
	
}


