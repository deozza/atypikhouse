<?php

namespace App\Tests\Entity;

use Deozza\ApiTesterBundle\Service\TestAsserter;

class PropertyControllerTest extends TestAsserter
{
    public function setUp()
    {
        parent::setUp();
    }

    /**
     * @dataProvider addDataProvider
     */
    public function testUnit($kind, $test)
    {
        parent::launchTestByKind($kind, $test);
    }

    public function addDataProvider()
    {
        return
            [
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/invalid/00100000-0000-4000-a000-000000000000/title'                                                  , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/invalid'                                                , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/annonce/00100000-0000-4000-a000-555555555555/title'                                                  , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/title'                                                  , 'status' => 401] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userForbidden", 'status' => 403] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userActive"   , 'status' => 200] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userAdmin"    , 'status' => 200] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/annonce/00200000-0000-4000-a000-000000000000/title'                                                  , 'status' => 200] ],

                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/invalid'                                                , 'status' => 401] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/invalid/00100000-0000-4000-a000-000000000000/description' , "token"=>"token_userActive"   , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/annonce/00100000-0000-4000-a000-555555555555/description' , "token"=>"token_userActive"   , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/invalid'     , "token"=>"token_userActive"   , 'status' => 405] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description' , "token"=>"token_userForbidden", 'status' => 403, "in"=>"postPropertyValid"] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description' , "token"=>"token_userActive"   , 'status' => 400] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description' , "token"=>"token_userActive"   , 'status' => 400, "in"=>"postPropertyExtraKey"] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description' , "token"=>"token_userActive"   , 'status' => 400, "in"=>"postPropertyInvalidKey"] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description' , "token"=>"token_userActive"   , 'status' => 201, "in"=>"postPropertyValid"] ],

                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/invalid'                                                , 'status' => 401] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/invalid/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userActive"   , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/annonce/00100000-0000-4000-a000-555555555555/title'       , "token"=>"token_userActive"   , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/invalid'     , "token"=>"token_userActive"   , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userForbidden", 'status' => 403, "in"=>"postPropertyValid"] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userActive"   , 'status' => 400] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userActive"   , 'status' => 400, "in"=>"patchPropertyExtraKey"] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userActive"   , 'status' => 400, "in"=>"patchPropertyInvalidKey"] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userActive"   , 'status' => 200, "in"=>"patchPropertyValid"] ],

                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/invalid'                                                , 'status' => 401] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/invalid/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userActive"   , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/annonce/00100000-0000-4000-a000-555555555555/title'       , "token"=>"token_userActive"   , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/invalid'     , "token"=>"token_userActive"   , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/title'       , "token"=>"token_userActive"   , 'status' => 405] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description' , "token"=>"token_userForbidden", 'status' => 403] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description' , "token"=>"token_userActive"   , 'status' => 204] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description' , "token"=>"token_userAdmin"    , 'status' => 204] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description?key=0'   , "token"=>"token_userActive"   , 'status' => 204] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description?key=100' , "token"=>"token_userActive"   , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/annonce/00100000-0000-4000-a000-000000000000/description?key=all' , "token"=>"token_userActive"   , 'status' => 204] ],

            ];
    }
}