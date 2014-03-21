<?php
//php artisan migrate:refresh --env="testing" --seed
class DatabaseSeeder extends Seeder {
    public function run()
    {
        Eloquent::unguard();
        $this->call('CategoryTableSeeder');
        #$this->call('PagesTableSeeder');
        if(App::environment() == 'testing') $this->call('InvestmentsTableSeeder');
        $this->call('SurveyTableSeeder');
        $this->call('ConceptsTableSeeder');
        $this->call('MarketTableSeeder');
        $this->call('QuestionsTableSeeder');
        $this->call('AnswersTableSeeder');
        $this->call('SuggestionsTableSeeder');
        $this->call('UsersTableSeeder');
        $this->call('TemplatesTableSeeder');
    }
}

