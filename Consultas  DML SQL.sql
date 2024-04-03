-- Consulta para obtener el nombre de la moneda elegida por un usuario específico

SELECT M.currency_name
FROM Usuario U
JOIN Moneda M ON U.currency_id = M.currency_id
WHERE U.user_id = '1'; -- ingrese user_id especifico

-- Consulta para obtener todas las transacciones registradas

SELECT T.transaction_id, T.importe, T.transaction_date, 
       sender.nombre AS sender_nombre, sender.correo_electronico AS sender_correo,
       receiver.nombre AS receiver_nombre, receiver.correo_electronico AS receiver_correo
FROM Transaccion T
JOIN Usuario sender ON T.sender_user_id = sender.user_id
JOIN Usuario receiver ON T.receiver_user_id = receiver.user_id;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico

SELECT T.transaction_id, T.importe, T.transaction_date
FROM Transaccion T
JOIN Usuario U ON T.sender_user_id = U.user_id OR T.receiver_user_id = U.user_id
WHERE U.user_id = '1'; -- ingrese user_id especifico

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico

UPDATE Usuario
SET correo_electronico = '****.****@gmail.com' -- ingrese correo actualizado
WHERE user_id = '7'; -- ingrese user_id especifico

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)

DELETE FROM Transaccion
WHERE transaction_id = '1'; -- ingrese transaction_id especifico

