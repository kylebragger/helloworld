<?php

class AppController extends Controller {
    public function __construct()
    {
        parent::__construct();
        
        //$this->_set_current_user();
        $this->_check_csrf();
    }
    
    /* helpers */
    public function require_user()
    {
        //if (User::$current === false)
        //{
        //    Session::flash('notice', 'You must be logged in to see that page.');
        //    redirect('/login');
        //}
    }
    
    public function require_no_user()
    {
        //if (User::$current !== false)
        //{
        //    Session::flash('notice', 'You must be logged out to see that page.');
        //    redirect('/');
        //}
    }
    
    public function require_admin()
    {
        //if (User::$current === false || !User::$current->is_admin())
        //{
        //    Errors::show_404();
        //}
    }
    
    private function _set_current_user()
    {
        if (User::$current !== null) return; // already set
        
        if (false === ($uid = Session::read('_user_id')))
        {
            // no user
            User::$current = false;
            return;
        }
        
        // TODO auth by token
        
        $user = User()->find_by_id($uid, array('limit' => 1));
        User::$current = empty($user) ? false : $user[0];
        
        // if we've got a user, touch timestamps
        if (User::$current)
        {
            User::$current->touch_last_request();
        }
    }
    
    /* TODO move to magnus::session */
    private function _check_csrf()
    {
        if (!_is_post()) return;
        
        if (_post('form_key') !== Session::form_key())
        {
            Log::write(chr(27) . '[41m' . chr(27) . '[37m** POSSIBLE CSRF **' . chr(27) . '[0m');
            Errors::show_404();
        }
    }
}
