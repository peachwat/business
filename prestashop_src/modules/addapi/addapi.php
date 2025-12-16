1 <?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class AddApi extends Module
{
    public function __construct()
    {
        $this->name = 'addapi';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'nikitaksk';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = [
            'min' => '1.7.0',
            'max' => _PS_VERSION_,
        ];
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Addition API');
        $this->description = $this->l('Creates an endpoint for adding products to the DB.');
    }

    public function install()
    {
        return parent::install() && $this->registerHook('moduleRoutes');
    }

    /**
     * Hook for adding custom URL routes.
     */
    public function hookModuleRoutes($params)
    {
        return [
            'addapi_add_rule' => [
                'controller' => 'add',
                'rule' => 'api/add',
                'keywords' => [],
                'params' => [
                    'fc' => 'module',
                    'module' => 'addapi',
                    'controller' => 'add',
                ],
            ],
        ];
    }
}