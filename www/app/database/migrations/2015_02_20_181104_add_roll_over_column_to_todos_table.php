<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddRollOverColumnToTodosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('todos', function(Blueprint $table)
		{
			$table->boolean('roll_over')->default(1);
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('todos', function(Blueprint $table)
		{
			if(Schema::hasColumn('todos', 'roll_over')){
                Schema::dropColumn('todos', 'roll_over');
            }
		});
	}

}