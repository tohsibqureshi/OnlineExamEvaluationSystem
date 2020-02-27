package com.arc.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.arc.model.User;

public interface UserRepository  extends CrudRepository<User, Long>
{
//	 public User findByUserName(String username);

	Optional<User> findByUserName(String userName);
}
