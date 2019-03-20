<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

return [
    // 定义资源路由
    '__rest__'=>[
        // menu
        'menu'      =>  'index/menu',
        'position'  =>  'index/position',
        'department'=>  'index/department',
        'user'      =>  'index/indexUser',
        'rule'      =>  'index/rule',
        'setting'   =>  'index/sysConfig',
    ],
    '[base]'      => [
        'index'       => ['index/base/index', ['method' => 'get']],
        'login'       => ['index/base/login', ['method' => 'post']],

    ],

    // MISS路由
    // '__miss__'    => 'index/base/index',
];
