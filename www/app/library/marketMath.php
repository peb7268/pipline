<?php
class marketMath {
    public static $b = 250;

    public static function getPrices($concepts, $ignore_user = null)
    {
        $array = array();
        $dom = self::getDom($concepts, $ignore_user);
        foreach($concepts as $concept){
          $array[$concept->id] = number_format (round(100*(exp($concept->purchasedShares($ignore_user)/self::$b)/$dom),2), 2);
        }
        return $array;
    }

    public static function getDom($concepts, $ignore_user = null){
    $stockDom = 0;
    foreach($concepts as $concept){
      $stockval = $concept->purchasedShares($ignore_user);
      $stockDom += (exp($stockval/self::$b));
    }
    return $stockDom;
  }


}