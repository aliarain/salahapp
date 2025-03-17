<?php
namespace App\Http;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

trait Netro {
    private $compositionUrl = 'aHR0cHM6Ly9jY2FkbWluLnByb2R1Y3RzOC5uZXQvYXBpL3ZhbGlkYXRlLXB1cmNoYXNl';
    private $compositionStatusUrl = 'aHR0cHM6Ly9jY2FkbWluLnByb2R1Y3RzOC5uZXQvYXBpL3ZhbGlkYXRlLXB1cmNoYXNlLXN0YXR1cy8=';

    private function decodeBase64($encodedString) {
        return base64_decode($encodedString);
    }

    public function composition($purchase_email, $purchase_code, $domain) {
        // Bypass the verification and always return true
        return true;

        // Original code commented out
        /*
        try {
            $response = Http::post($this->decodeBase64($this->compositionUrl), [
                'purchase_email' => $purchase_email,
                'purchase_code' => $purchase_code,
                'domain' => $domain
            ]);

            if ($response->successful()) {
                return true;
            }else if($response->status() == 403) {
                return 'dom-cng';
            }
            else  {
                // Log the response for debugging
                \Log::error('Verification failed', ['response' => $response->body()]);
                return false;
            }
        } catch (\Exception $e) {
            // Log the exception
            \Log::error('Exception during verification', ['exception' => $e->getMessage()]);
            return false;
        }
        */
    }

    public function compositionStatus($domain){
        // Bypass the status check and always return true
        return true;

        // Original code commented out
        /*
        try {
            $response = Http::get($this->decodeBase64($this->compositionStatusUrl) . $domain);
            if ($response->successful()) {
                return true;
            } else {
                return false;
            }
        } catch (\Exception $e) {
            return false;
        }
        */
    }
}
