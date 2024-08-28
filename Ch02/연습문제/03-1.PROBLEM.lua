local crimeSystem = {
	["Speeding"] = {
		ticketPrice = 100,
		isViolating = function(officerInputDictionary)
			local MAX_SPEED = 100

            -- 연습문제 2 : 필요한 데이터가 있는지 확인합니다.

            -- 연습문제 1 : 운전자가 이 위반 사항을 저지르고 있는지 확인합니다.
		end
	},
	["No License"] = {
		ticketPrice = 250,
		isViolating = function(officerInputDictionary)
            -- 연습문제 2 : 필요한 데이터가 있는지 확인합니다.

            -- 연습문제 1 : 운전자가 이 위반 사항을 저지르고 있는지 확인합니다.
		end
	},
	["Reckless Driving"] = {
		ticketPrice = 250,
		isViolating = function(officerInputDictionary)
            -- 연습문제 2 : 필요한 데이터가 있는지 확인합니다.

            -- 연습문제 1 : 운전자가 이 위반 사항을 저지르고 있는지 확인합니다.
		end
	}
}


-- setup 함수

function setup()
    -- Tip: 이 기능을 변경할 필요는 없습니다. 
	print("Ticket Price: " .. calculateTicketPrice(
			{
				speed = 90,
				hasLicense = true,
				isRecklessDriving = false
			}
		)
	)
end


-- 과태료 함수

function calculateTicketPrice(officerInputDictionary)
	-- 과태료 금액
	local totalTicketPrice = 0

    -- 연습문제 3 : crimeSystem 테이블을 순환하는 반복문을 생성합니다.
    -- Hint: index 변수는 위반 사항의 이름입니다.
    -- Hint: value 변수는 특정 위반 사항에 대한 딕셔너리입니다.

    -- 연습문제 6 : 반복문에서 isRequiredCrimeDataPresent 함수를 호출합니다.
    -- Hint: 함수가 false를 반환하면 continue문을 사용합니다. 

    -- 연습문제 7 : 반복문에서 현재 위반 사항에 대한 isViolating 함수를 호출합니다.
    -- isViolating 함수가 true를 반환하면 totalTicketPrice 변수가 증가합니다.
	-- Hint: isViolating 함수에는 officerInputDictionary를 인수로 제공합니다. 

	-- 과태료 금액 반환
	return totalTicketPrice
end

--

function isRequiredCrimeDataPresent(crimeName, crimeData)
	-- 필요한 위반 사항 데이터 가져오기
	local ticketPrice = crimeData.ticketPrice
	local isViolatingFunction = crimeData.isViolating

    -- 연습문제 4 : ticketPrice 변수가 nil이 아닌지, 0보다 큰지 확인합니다. 
    -- 변수가 없거나 0보다 작으면 false 반환합니다. 

    -- 연습문제 5 : isViolatingFunction 변수가 nil이 아닌지 확인합니다.
    -- 변수가 없으면 false 반환합니다.
	
	-- 모든 데이터가 존재합니다.
	return true
end

--

setup()