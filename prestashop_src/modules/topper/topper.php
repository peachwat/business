<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class Topper extends Module
{
    public function __construct()
    {
        $this->name = 'Topper';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'nikitaksk';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = [
            'min' => '1.7',
            'max' => _PS_VERSION_
        ];
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Topper Module');
        $this->description = $this->l('A module witht the displayTopper hook');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
    }

    public function install()
    {
        if (!parent::install() || !$this->registerHook('displayTopper')) {
            return false;
        }
        return true;
    }

    public function uninstall()
    {
        if (!parent::uninstall() || !$this->unregisterHook('displayTopper')) {
            return false;
        }
        return true;
    }

    public function hookDisplayTopper($params)
    {
        return $this->display(__FILE__, 'topper.tpl');
    }
}