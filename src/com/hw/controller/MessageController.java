package com.hw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hw.pojo.Message;
import com.hw.pojo.User;
import com.hw.service.IMessageService;
import com.hw.service.IUserService;

@Controller
public class MessageController {
	@Autowired
	private IMessageService messageService;
	@Autowired
	private IUserService userService;
	@RequestMapping("/doEmail")
	@ResponseBody
	public String doEmail(@SessionAttribute(value="userid",required=false) Integer userid,Integer receiverid,String content) {
		Message message = new Message();
		message.setContent(content);
		message.setReceiverId(receiverid);
		message.setsenderId(userid);
		
		return messageService.addMessage(message)>0?"addMessage success":"addMessage fail";
	}
	
	@RequestMapping("/message")
	public String message(@SessionAttribute(value="userid",required=false) Integer userid,Model model) {
		List<Message> messages = messageService.getMessage(userid);
		List<User> senders = new ArrayList<>();
		List<User> receivers = new ArrayList<>();
		for (Message message : messages) {
			User sender = userService.getUserById(message.getsenderId());
			senders.add(sender);
			User receiver = userService.getUserById(message.getReceiverId());
			receivers.add(receiver);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("messages", messages);
		map.put("userid", userid);
		map.put("senders", senders);
		map.put("receivers", receivers);
		model.addAttribute("map", map);
		return "message";
	}
}
