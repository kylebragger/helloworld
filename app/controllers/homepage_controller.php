<?php

class HomepageController extends AppController {
    public function __construct()
    {
        parent::__construct();
    }
    
    public function index()
    {
        $this->view->use_layout = false;
    }
}
