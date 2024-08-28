SomeDataStore:UpdateAsync(
	--키
	"Plr_" .. player.UserId,

	-- 업데이트 함수
	function(oldData)
		-- 현재 데이터 확인
		local data = oldData or 0

		-- 데이터 업데이트
		data += 1

		-- 새 데이터 반환
		return data
	end
)