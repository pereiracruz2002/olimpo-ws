<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Lib_recognition{
    var $token = "b2e8e922e62d4665b24b26e47da09f0d";
    var $hostname = "https://westus.api.cognitive.microsoft.com/face/v1.0/";
    var $response_code = '';


    public function __construct($config = array()) {
        if(isset($config['token'])){
            $this->token = $config['token'];
        }
    }

    public function getFaceList($nameList) 
    {
        return $this->doRequest("facelists/{$nameList}", 'GET');
    }


    public function libCreateFaceList($nameList)
    {
        $request_params = array(
            "name" => $nameList, 
        );
        return $this->doRequest("facelists/{$nameList}", "PUT", $request_params);
    }

    public function createPersonGroup($personGroupId, $name) 
    {
        $request_params = array(
            "name" => $name, 
        );
        return $this->doRequest("persongroups/{$personGroupId}", "PUT", $request_params);
    }

    public function getPersonGroup($personGroupId) 
    {
        return $this->doRequest("persongroups/{$personGroupId}", 'GET');
    }


    public function deletePersonGroup($personGroupId) 
    {
        return $this->doRequest("persongroups/{$personGroupId}", "DELETE");
    }


    public function createPerson($personGroupId, $name, $userData='') 
    {
        $request_params = array(
            "name" => $name, 
            "userData" => $userData
        );
        return $this->doRequest("persongroups/{$personGroupId}/persons", "POST", $request_params);
    }

    public function deletePerson($personGroupId, $personId) 
    {
        return $this->doRequest("persongroups/{$personGroupId}/persons/{$personId}", "DELETE");
    }


    public function addPersonFace($url_face, $personGroupId, $personId, $faceRectangle) 
    {
        $request_params = array(
            "url" => $url_face 
        );
        $params = array(
            'userData' => $url_face,
            'targetFace' => $faceRectangle
        );

        return $this->doRequest("persongroups/{$personGroupId}/persons/{$personId}/persistedFaces?".http_build_query($params), "POST", $request_params);
    }

    public function libAddFaceList($faceListId,$url,$userdata,$targetFace)
    {
        $request_params = array(
            "url" => $url, 
        );

        $params = array(
            'userData' => json_encode($userdata),
            'targetFace' => $targetFace
        );
        return $this->doRequest('facelists/'.$faceListId.'/persistedFaces?'.http_build_query($params), "POST", $request_params);
    }

    public function deletePersonFace($personGroupId, $personId, $persistedFaceId) 
    {
        return $this->doRequest("persongroups/{$personGroupId}/persons/{$personId}/persistedFaces/{$persistedFaceId}", "DELETE");
    }

    public function train($personGroupId) 
    {
        return $this->doRequest('persongroups/'.$personGroupId.'/train', "POST", array());
    }

    public function getTrainStatus($personGroupId) 
    {
        return $this->doRequest('persongroups/'.$personGroupId.'/training', "GET");
    }

    public function verifyPerson($faceId, $personId, $personGroupId) 
    {
        $request_params = array(
            "faceId" => $faceId,
            "personId" => $personId,
            "personGroupId" => $personGroupId
        );
        return $this->doRequest('verify', "POST", $request_params);
    }

    public function identifyPerson($faceId, $personGroupId, $maxNumOfCandidatesReturned=1, $confidenceThreshold=0.2) 
    {
        $request_params = array(
            "personGroupId" => $personGroupId,
            "faceIds" => (is_array($faceId) ? $faceId : array($faceId)),
            "maxNumOfCandidatesReturned" => 1,
            "confidenceThreshold" =>  0.5
        );
        return $this->doRequest('identify', "POST", $request_params);
    }


    public function detect($image)
    {
        $request_params = array(
            "url" => $image, 
        );
        return $this->doRequest("detect?returnFaceId=true&returnFaceLandmarks=false", 'POST', $request_params);
    }


    public function libFindSimilar($faceId,$faceListId)
    {
        $request_params = array(
            "faceId"        => $faceId,
            "faceListId"    => $faceListId,
        );
        return $this->doRequest('findsimilars', 'POST', $request_params);
    }

    public function remove($faceId, $faceListId)
    {
        return $this->doRequest("facelists/{$faceListId}/persistedFaces/{$faceId}", "DELETE");
    }

    private function doRequest($method, $type, $data_params=false) 
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->hostname . $method);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $type);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        if(is_array($data_params)){
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data_params));
        }
        curl_setopt($ch, CURLOPT_HTTPHEADER, 
            array
            (
                'Content-Type: application/json',
                'Ocp-Apim-Subscription-Key: ' . $this->token
            )
        );
        $response = curl_exec($ch);
        $this->response_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        return json_decode($response);
    }

}
