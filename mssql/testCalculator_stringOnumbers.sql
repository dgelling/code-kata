--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
create PROCEDURE [kata].[testCalculator_stringOnumbers]
AS
BEGIN
  --Assemble
  --  This section is for code that sets up the environment. It often
  --  contains calls to methods such as tSQLt.FakeTable and tSQLt.SpyProcedure
  --  along with INSERTs of relevant data.
  --  For more information, see http://tsqlt.org/user-guide/isolating-dependencies/
  
  DECLARE	@mystring varchar(50) = '1,2,3'
		   ,@expectedResult INT = 6
		   ,@actualResult int
  
  --Act
  --  Execute the code under test like a stored procedure, function or view
  --  and capture the results in variables or tables.
  
	SELECT @actualResult= dbo.udf_Calculate(@mystring)
  
  --Assert
  --  Compare the expected and actual values, or call tSQLt.Fail in an IF statement.  
  --  Available Asserts: tSQLt.AssertEquals, tSQLt.AssertEqualsString, tSQLt.AssertEqualsTable
  --  For a complete list, see: http://tsqlt.org/user-guide/assertions/
  
  exec tsqlt.assertEquals @expected=@expectedResult,@actual=@actualResult, @message='when passed string of numbers sum'
  
--  EXEC tSQLt.Fail 'TODO:Implement this test.'
  
END;

