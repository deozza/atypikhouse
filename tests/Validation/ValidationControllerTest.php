<?php

namespace App\Tests\Validation;

use Deozza\ApiTesterBundle\Service\TestAsserter;

class ValidationControllerTest extends TestAsserter
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
                ["kind" => "unit", "test" => ['method'=> 'POST'    , 'url' => 'api/validate/00100000-0000-4000-a000-000000000000'                                        , 'status' => 401] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'    , 'url' => 'api/validate/00100000-0000-4000-a000-555555555555', "token"=>"token_userActive_AUTH_TOKEN", 'status' => 404] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'    , 'url' => 'api/validate/00100000-0000-4000-a000-000000000000', "token"=>"token_userActive_AUTH_TOKEN", 'status' => 403] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'    , 'url' => 'api/validate/00200000-0000-4000-a000-000000000000', "token"=>"token_userAdmin_AUTH_TOKEN" , 'status' => 200] ],
                ["kind" => "unit", "test" => ['method'=> 'POST'    , 'url' => 'api/validate/00100000-0000-4000-a000-000000000000', "token"=>"token_userAdmin_AUTH_TOKEN" , 'status' => 200] ],
            ];
    }
}