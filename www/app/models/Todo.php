<?php

class Todo extends Eloquent {
    protected $guarded      = [];
    protected $table        = 'todos';
    public $timestamps      = false;
} 