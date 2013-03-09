function table.shallow_copy(original_table)
	local new_table = {}
	for k, v in pairs(original_table) do
		new_table[k] = v
	end
	return new_table
end

function table.join(t1, t2) --t2 overrides t1 keys
	t3 = table.shallow_copy(t1)
	for k, v in pairs(t2) do
		t3[k] = v
	end
	return t3
end
