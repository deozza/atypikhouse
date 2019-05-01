<?php

namespace App\Tests\Entity;

use Deozza\ApiTesterBundle\Service\TestAsserter;

class EntityControllerTest extends TestAsserter
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
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/entity/invalid'                                                                        , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/entity/annonce'                                                                        , 'status' => 200, "out"=>"getAllAuthorizedEntitiesForAnonymous" ] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/entity/annonce'                             , "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 200, "out"=>"getAllAuthorizedEntitiesForUser"] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000'                                           , 'status' => 401] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/entity/00100000-0000-4000-a000-555555555555', "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userForbidden_AUTH_TOKEN", 'status' => 403, "out"=>"getSpecificEntityForbidden"] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/entity/00200000-0000-4000-a000-000000000000'                                           , 'status' => 200] ],

                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 200, "out"=>"getSpecificEntity"] ],
                ["kind" => "unit", "test" => ['method'=> 'GET'    , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userAdmin_AUTH_TOKEN"    , 'status' => 200, "out"=>"getSpecificEntity"] ],

                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/entity/invalid'                                                                        , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/entity/annonce'                                                                        , 'status' => 401] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/entity/annonce'                             , "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 400] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/entity/annonce'                             , "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 400, 'in'=>"postEntityExtraKey"] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/entity/annonce'                             , "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 400, 'in'=>"postEntityInvalidKey"] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/entity/annonce'                             , "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 400, 'in'=>"postEntityMissingKey"] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/entity/annonce'                             , "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 400, 'in'=>"postEntityInvalidChoice"] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'   , 'url' => 'api/entity/annonce'                             , "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 409, 'in'=>"postEntityValid"] ],

                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/entity/00100000-0000-4000-a000-555555555555'                                           , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000'                                           , 'status' => 401] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userForbidden_AUTH_TOKEN", 'status' => 403] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 400] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 400, "in"=>"patchEntityExtraKey"] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 400, "in"=>"patchEntityInvalidKey"] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 409, "in"=>"patchEntityValidPartial"] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userAdmin_AUTH_TOKEN"    , 'status' => 409, "in"=>"patchEntityValidPartial"] ],
                ["kind" => "unit", "test" => ['method'=> 'PATCH'  , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 409, "in"=>"patchEntityValidFull"] ],

                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/entity/00100000-0000-4000-a000-555555555555'                                           , 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000'                                           , 'status' => 401] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userForbidden_AUTH_TOKEN", 'status' => 403] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userActive_AUTH_TOKEN"   , 'status' => 204] ],
                ["kind" => "unit", "test" => ['method'=> 'DELETE' , 'url' => 'api/entity/00100000-0000-4000-a000-000000000000', "token"=>"token_userAdmin_AUTH_TOKEN"    , 'status' => 204] ],
            ];
    }
}