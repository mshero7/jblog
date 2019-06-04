package com.cafe24.jblog.util;

import java.util.Optional;

public class OptionalUtil {
	public static Integer optionalValueCheck(Optional<Integer> path_value) {
		Integer result = 1;
		
		if(path_value.isPresent()) {
			result = path_value.get();
		}
		
		return result;
	}
}
