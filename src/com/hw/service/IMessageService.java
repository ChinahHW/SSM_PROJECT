package com.hw.service;

import java.util.List;

import com.hw.pojo.Message;

public interface IMessageService {
	int addMessage(Message message);
	List<Message> getMessage(Integer userid);
}
