<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddYMDToTodosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('todos', function(Blueprint $table)
		{
			$table->integer('user_id')->nullable();
            $table->integer('year');
            $table->integer('month');
            $table->integer('day');
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
            $table->dropColumn('user_id');
            $table->dropColumn('year');
            $table->dropColumn('month');
            $table->dropColumn('day');
		});
	}

}