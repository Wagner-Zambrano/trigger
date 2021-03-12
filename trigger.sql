
create trigger validarhora
on cita 
for insert as 
if (select hora from inserted)<= 12
begin 
	ROLLBACK TRANSACTION 
	PRINT 'No se puede registrar horas menores a 12:00 PM'
	end
	else
		PRINT 'registrar horas correctamente'
go



declare  @nombre varchar (50),
@direccion varchar (50),
@correo varchar (50)
Declare tr_usuario cursor Global
for select nombre, direccion, email from usuario 

Open tr_usuario
fetch tr_usuario into @nombre , @direccion, @correo

while (@@fetch_status=0)
begin

print @nombre +' '+ @direccion +' '+ @correo 
fetch tr_usuario into @nombre, @direccion, @correo
end
close tr_usuario
deallocate tr_usuario
go



Create procedure pa_citas
@lugar varchar (30)
as 
select * from citas
where lugar =@lugar
go
exec pa_citas 'restaurante'
go
