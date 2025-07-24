SELECT ROUND(100.0*(COUNT(*) FILTER(WHERE I1.country_id!= I2.country_id))/COUNT(*),1)
AS international_calls_pct
FROM phone_calls P
JOIN phone_info I1
ON P.caller_id = I1.caller_id
JOIN phone_info I2
ON I2.caller_id = P.receiver_id;