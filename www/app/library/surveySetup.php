<?php
define('CRYPT_SALT', 'theappformerlyknownasice');
define('HASH_LENGTH1', 4);

class surveySetup {

    public static $chrs = '0123456789abcdefghijklmnopqrstuvwxyz';

    public static function url($survey, $user, $parts=''){
      $host = $_SERVER['HTTP_HOST'];

      if (strpos($host, 'www.')===0)
      {
        $host = str_replace('www.', '', $host);
      }

      $url = "http://{$host}";

      if ($parts != ''){$url .= "/$parts";}

      if ($survey->unique_param != ''){
        $url .= '?' . $survey->unique_param . '=' . $user->unique_param;
      }

      if (! empty($survey->other_params)){
        $survey_params = json_decode($survey->other_params);
        $user_params = json_decode($user->other_params);

        if (!empty($survey_params))
        {
          $url .= $survey->unique_param != '' ? '&':'?';
          foreach($survey_params as $i=>$param)
          {
            if ($i>0){$url .= '&';}
            $url .= $param . '=' . $user_params[$param];
          }
        }
      }
      return $url;
    }

    public static function updateSession($user_id, $survey_id)
    {
        $suid = Session::get('user_id');
        $ssid = Session::get('survey_id');

        if ($suid != $user_id || $ssid != $survey_id) Session::flush();

        Session::set('user_id', $user_id);
        Session::set('survey_id', $survey_id);
    }

    public static function encode($id) {
        if (!is_numeric($id) or $id < 1) {return FALSE;}
        $id = (int)$id;
        if ($id > pow(2,31)) {return FALSE;}
        $segment1 = self::getHash($id,16);
        $segment2 = self::getHash($segment1,8);
        $dec      = (int)base_convert($segment2,16,10);
        $dec      = ($dec>$id)?$dec-$id:$dec+$id;
        $segment2 = base_convert($dec,10,16);
        $segment2 = str_pad($segment2,8,'0',STR_PAD_LEFT);
        $segment3 = self::getHash($segment1.$segment2,8);
        $hex      = $segment1.$segment2.$segment3;
        $bin      = pack('H*',$hex);
        $oid      = base64_encode($bin);
        $oid      = str_replace(array('+','/','='),array('$',':',''),$oid);
        return $oid;
    }

    public static function decode($oid) {
        $oid = explode('market', $oid)[1];

        if (!preg_match('/^[A-Z0-9\:\$]{21,23}$/i',$oid)) {return 0;}
        $oid      = str_replace(array('$',':'),array('+','/'),$oid);
        $bin      = base64_decode($oid);
        $hex      = unpack('H*',$bin); $hex = $hex[1];
        if (!preg_match('/^[0-9a-f]{32}$/',$hex)) {return 0;}
        $segment1 = substr($hex,0,16);
        $segment2 = substr($hex,16,8);
        $segment3 = substr($hex,24,8);
        $exp2     = self::getHash($segment1,8);
        $exp3     = self::getHash($segment1.$segment2,8);
        if ($segment3 != $exp3) {return 0;}
        $v1       = (int)base_convert($segment2,16,10);
        $v2       = (int)base_convert($exp2,16,10);
        $id       = abs($v1-$v2);

        return $id;
    }

    private static function getHash($str,$len) {
        return substr(sha1($str.CRYPT_SALT),0,$len);
    }

    public static function domainEncode($i)
    {

      //do not change this line or we loose all current survey hashes!
      $hashids = new Hashids\Hashids('SaltyMcSaltHead,wenttotown', 6, '0123456789abcdefghijklmnopqrstuvwxyz');
      $hash = $hashids->encrypt($i);//can be more than one.
      //$numbers = $hashids->decrypt($hash);

      //var_dump($hash, $numbers);

      return $hash;
    }

    public static function domainDecode($hash)
    {

      //do not change this line or we loose all current survey hashes!
      $hashids = new Hashids\Hashids('SaltyMcSaltHead,wenttotown', 6, '0123456789abcdefghijklmnopqrstuvwxyz');
      //$hash = $hashids->encrypt($i);//can be more than one.
      $numbers = $hashids->decrypt($hash);
      return $numbers[0];
    }


}