package com.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.model.MessageBean;
import com.edu.service.IMessageService;
import com.edu.socket.MessageVO;

@Controller
@RequestMapping("/message.do")
public class MessageController {

	@Autowired
	private IMessageService messageService;
	
	/**
	 * 获取用户未读消息
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getUndReadMessage")
	public Map<String, Object> JsonGetUnRead(@RequestParam(name="id")Integer id){
		List<MessageBean> list = messageService.getUserUnReadMessage(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", MessageVO.ChangeToListMessageVO(list));
		//map.put("list", list);
		return map;
	}
}
