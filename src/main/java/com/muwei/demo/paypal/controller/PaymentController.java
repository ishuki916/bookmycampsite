package com.muwei.demo.paypal.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.muwei.demo.camp.model.PaidList;
import com.muwei.demo.camp.service.MyCampsiteService;
import com.muwei.demo.paypal.config.PaypalPaymentIntent;
import com.muwei.demo.paypal.config.PaypalPaymentMethod;
import com.muwei.demo.paypal.service.PaypalService;
import com.muwei.demo.paypal.util.URLUtils;
import com.muwei.demo.users.model.Users;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;



@Controller
public class PaymentController {
	
	public static final String PAYPAL_SUCCESS_URL = "pay/success";
	public static final String PAYPAL_CANCEL_URL = "pay/cancel";
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PaypalService paypalService;
	
	@Autowired
	private MyCampsiteService csSer;
	
	
	@PostMapping("/payByPaypal")
	public String pay(HttpServletRequest request,@RequestParam String totalforPaypal){
		String cancelUrl = URLUtils.getBaseURl(request) + "/" + PAYPAL_CANCEL_URL;
		String successUrl = URLUtils.getBaseURl(request) + "/" + PAYPAL_SUCCESS_URL;
		try {
			Payment payment = paypalService.createPayment(
					Double.valueOf(totalforPaypal), 
					"TWD", 
					PaypalPaymentMethod.paypal, 
					PaypalPaymentIntent.sale,
					"payment description", 
					cancelUrl, 
					successUrl+"/"+totalforPaypal);
			for(Links links : payment.getLinks()){
				if(links.getRel().equals("approval_url")){
					return "redirect:" + links.getHref();
				}
			}
			
		
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		return "redirect:mycampsite/showBrandNewCart";
		//這邊應該要跳轉到購物車頁面
	}
	
	
	@GetMapping(value="pay/cancel")
	public String cancelPay(){
		
		return "redirect:mycampsite/showBrandNewCart";
		//return "paypal/cancel";
		
	}
	

	
	@GetMapping(value="pay/success/{totalforPaypal}")
	public String successPay(@PathVariable String totalforPaypal, @RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId,HttpServletRequest r){
		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			if(payment.getState().equals("approved")){
				
			//拿到總價,生成一筆新的PaidList,生成之後回傳PaidListId
				PaidList pl = new PaidList();
				pl.setTotal(Integer.valueOf(totalforPaypal));
				Integer plid = csSer.insertAndUpdatePaidList(pl);
				System.out.println("plid="+plid);
	
			//把PaidListId塞進bookingCampsite表單的欄位(userId=?和paidStatus='N'),並把paidStatus改成'Y'
				Users u = (Users) r.getSession().getAttribute("loginUser");
				Integer userid = u.getId();
				csSer.updatebookingCampsiteToPaid(plid, userid);
			
				
				return "campsite/bookingpage4";
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		return "redirect:mycampsite/showBrandNewCart";
	
	}
	

}
