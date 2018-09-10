package com.hw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hw.dao.MessageMapper;
import com.hw.pojo.Message;
import com.hw.service.IMessageService;
@Service
public class MessageService implements IMessageService {
	@Autowired
	private MessageMapper messageMapper;
	@Override
	public int addMessage(Message message) {
		// TODO Auto-generated method stub
		return messageMapper.addMessage(message);
	}

	@Override
	public List<Message> getMessage(Integer userid) {
		// TODO Auto-generated method stub
		return messageMapper.getMessage(userid);
	}

}
