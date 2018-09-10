package com.hw.dao;

import java.util.List;

import com.hw.pojo.Message;

public interface MessageMapper {
	int addMessage(Message message);
	List<Message> getMessage(Integer userid);
}
