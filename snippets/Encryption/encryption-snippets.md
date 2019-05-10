<?php
/**
 * Encrypt Text
 * @link https://shellcreeper.com/?p=2082
 */
function my_encrypt( $plain_text ){
    $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
    $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
    $h_key = hash('sha256', wp_salt(), TRUE);
    return base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $h_key, $plain_text, MCRYPT_MODE_ECB, $iv));
}

/**
 * Decrypt Text
 * @link https://shellcreeper.com/?p=2082
 */
function my_decrypt( $encrypted_text ){
    $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
    $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
    $h_key = hash('sha256', wp_salt(), TRUE);
    return trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $h_key, base64_decode( $encrypted_text ), MCRYPT_MODE_ECB, $iv));
}

// phpcs:disable
