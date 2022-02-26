-- Signup Function
CREATE OR REPLACE FUNCTION
signup(firstname text, lastname text, email text, password text) RETURNS VOID
AS $$
  INSERT INTO "User" (firstname, lastname, emailaddress, userpassword, isadmin) VALUES
    (signup.firstname, signup.lastname, signup.email, crypt(signup.password, gen_salt('bf', 8)), 0);
$$ LANGUAGE sql SECURITY DEFINER;

-- Login Function
CREATE OR REPLACE FUNCTION
login(email TEXT, password TEXT) RETURNS jwt_token
  LANGUAGE plpgsql SECURITY DEFINER
  AS $$
DECLARE
  _role NAME;
  result jwt_token;
BEGIN
  SELECT "User".userid FROM "User" WHERE "User".emailaddress=login.email AND userpassword=crypt(login.password, userpassword) INTO _role;
  IF _role IS NULL THEN
    RAISE invalid_password USING message = 'invalid user or password';
  END IF;

  SELECT sign(
      row_to_json(r), current_setting('app.settings.jwt_secret')
    ) AS token
    from (
      SELECT 'admins' AS role, login.email AS email, _role AS user_id,
         extract(epoch from now())::integer + 3600*60*60 as exp
    ) r
    INTO result;

  RETURN result;
END;
$$
