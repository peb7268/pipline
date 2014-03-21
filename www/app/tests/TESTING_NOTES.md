<?php

class CategoryTest extends TestCase
{
	public function setUp()
	{
		parent::setUp();
		Artisan::call('migrate');
		//$this->('db:seed');
	}
	/**
	 * @dataProvider mockCategories
	 */
	public function testReturnsAll($name, $relevant, $i, $result = null)
	{
		//App::environment();
		/* Example Of Using Mockery here for forcing execution paths 

		//Arrange
		$cat = Mockery::mock('Category');
		$cat ->shouldReceive('setName')
			 ->with('gardening')
			 ->once()
			 ->andReturn('gardening')
			 ->passThru();

		//Act	 
		$cat->setName('gardening');

		//Assert
		$this->assertEquals($cat->name, 'gardening');

		*/
		
		//Arrange
		$cat = new Category();
		$cat->name = $name;
		$cat->relevant = $relevant;
		
		//Act
		$cat->save();

		if(gettype($result) === 'string') {
		 	$result  = $result;
		} else {
			$result = Api::hit($this, 'GET', 'categories');
			$result = $result[0]->name;
		}
		
		//Assert
		$this->assertEquals($name, $result);	
	}
	public function mockCategories(){
		return array(
			//$name, $relevant, $i, [$result]
			array('gardening', true, 1),
			array('politics', true, 2, 'politics'),
			array('soft drinks', true, 3, 'soft drinks')
		);
	}
}